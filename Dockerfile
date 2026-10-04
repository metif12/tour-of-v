# syntax=docker/dockerfile:1
#
# The tour runs code submitted by anyone who visits it, so this container is
# part of the trust boundary rather than just a packaging convenience. Two
# things follow from that, and neither is optional:
#
#   1. isolate must be built and present. It supplies the Linux namespaces,
#      cgroups, seccomp filter and chroot that actually contain a submitted
#      program. The application refuses to start without it.
#   2. The container must be able to create namespaces, which means it has to
#      run privileged. The box inside it is then the boundary; the container is
#      the wall behind the wall.
#
# The V toolchain is bind mounted read only into every sandbox, because the
# compiler is what the resource limits are there to constrain.
#
# There are two toolchains in this file, and they have different jobs.
#
#   V_COMMIT   builds *this tour*. It is built from source rather than taken
#              from the official vlang image because the tour's templates use
#              `veb.raw` and loop over the table of contents, and the veb in the
#              official image (V 0.5.0) has neither. Its output is the single
#              binary at /usr/local/bin/tour; nothing else from it ships.
#
#   toolchain  *runs a visitor's code*. This is the official V 0.5.2 release,
#              checksum verified. See the comment on that stage for why the
#              source build cannot be used for it.
#
# To move to a newer V, change V_COMMIT, then run `v fmt -w .` and `v test .`
# with it locally before rebuilding. Moving the compiler that executes a
# submission is a separate decision, made by changing V_RELEASE and
# V_RELEASE_SHA256 on the `toolchain` stage.

ARG V_COMMIT=a9e7ec2e0e41229a6e1acda45fbda5065527e9e5

# --------------------------------------- compiler that builds this tour only

FROM debian:bookworm AS vlang

# An ARG declared before the first FROM is global, and is only automatically in
# scope for FROM lines. Each stage that uses it has to take it again.
ARG V_COMMIT=a9e7ec2e0e41229a6e1acda45fbda5065527e9e5
RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	make \
	gcc \
	libc6-dev \
&& rm -rf /var/lib/apt/lists/*

RUN git init /opt/vlang \
&& cd /opt/vlang \
&& git remote add origin https://github.com/vlang/v \
&& git fetch --depth 1 origin "${V_COMMIT}" \
&& git checkout FETCH_HEAD \
&& make \
&& ./v version

ENV PATH=/opt/vlang:${PATH}

# The tour is compiled here rather than in the final image, because this is the
# only stage that has a compiler which can build it: main.v imports json2, which
# the 0.5.2 release carries as x.json2. Keeping the build here means the final
# image needs nothing from this stage except the finished binary, so the source
# tree and its build dependencies stay out of the image that executes a
# visitor's code.
#
# -prod embeds the lesson content into the binary rather than reading it at
# runtime, so the image needs no content directory of its own.
WORKDIR /opt/toursrc
COPY v.mod ./
COPY main.v view.v ./
COPY api/ api/
COPY content/ content/
COPY runner/ runner/
COPY tour/ tour/
# veb resolves its HTML templates while compiling, so these are build inputs
# even though the finished binary also reads them at runtime.
COPY templates/ templates/
RUN v -prod -o /tour .

# Known gap, no longer reachable: the pinned source build wants a V1 fallback
# for some code paths, and `make v1` is the documented way to install one up
# front. At this commit `make v1` fails, because cmd/tools/oldv.v hands the
# command to `os.exec_or_exit`, which execs an argv array without a shell, so
# the `&&` in install_v1_fallback.sh's command is treated as a filename.
#
# This does not affect the image any more, because the compiler that executes a
# submission is the 0.5.2 release from the `toolchain` stage, which needs no
# fallback. It is left here rather than deleted because the gap is still real
# in the source build, and the next person to move V_COMMIT forward will meet
# it.
#
# RUN cd /opt/vlang && make v1

# ------------------------------------------------------- runtime toolchain
#
# The compiler that runs a visitor's program is the official V 0.5.2 release,
# not the source build above. Two independent reasons, both measured rather
# than assumed:
#
#   1. The pinned source build cannot compile a hello world with the default C
#      toolchain. Its C generator emits
#      `backtrace_exec_capture(new_array_from_c_array(4, 4, ...))`, passing an
#      int where the generated C function expects a struct array, so both tcc
#      and gcc reject the output. Upstream tracks this as vlang/v#29412, and an
#      ordinary V install hides it by retrying the build with the 0.5.2 release
#      compiler. We could lean on that retry, but it costs three compiler
#      invocations per Run and mixes a failed build's diagnostics into the
#      output a learner reads.
#   2. This image cannot install that fallback, so there is nothing to retry
#      with. The path is broken upstream: cmd/tools/oldv.v runs the command it
#      is given through `os.exec_or_exit`, which execs an argv array with no
#      shell, so the `&&` in install_v1_fallback.sh's command arrives as a
#      literal filename.
#
# Using the release binary sidesteps both. It is a supported compiler, it is
# what the tour is developed and tested against locally, and it emits correct
# C.
#
# The archive is checked against the SHA256 that upstream publishes in
# cmd/tools/install_v1_fallback.sh. A toolchain that executes untrusted code is
# not something to take on trust, so the checksum is verified rather than
# assumed and a mismatch fails the build.
FROM debian:bookworm AS toolchain

ARG V_RELEASE=0.5.2
ARG V_RELEASE_SHA256=86caf9e70c3342d48ef19eb4f6c47b709f18c90ae86255520d5c29df6b482e23

RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	curl \
	unzip \
&& rm -rf /var/lib/apt/lists/*

# The archive unpacks to a top level `v` directory holding the `v` binary and
# its vlib, so it is moved rather than extracted in place: the runner expects
# ${TOUR_VROOT}/v next to ${TOUR_VROOT}/vlib.
RUN mkdir -p /dl && cd /dl \
&& curl -fsSL -o v_linux.zip \
	"https://github.com/vlang/v/releases/download/${V_RELEASE}/v_linux.zip" \
&& echo "${V_RELEASE_SHA256}  v_linux.zip" | sha256sum -c - \
&& unzip -q v_linux.zip \
&& mv v /opt/vlang \
&& /opt/vlang/v version \
&& rm -rf /dl

# ------------------------------------------------------------------ the image

FROM debian:bookworm

# isolate needs libseccomp and libcap to build. gcc is installed because
# isolate's Makefile asks for it by name even though clang is also present, and
# because V shells out to `cc` when it links a submitted program. libc6-dev
# is the C standard library headers, which V-generated C includes.
RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	make \
	gcc \
	libc6-dev \
	pkg-config \
	libcap-dev \
	libseccomp-dev \
	libseccomp2 \
	libcap2-bin \
	libsystemd-dev \
	asciidoc \
	bash \
&& rm -rf /var/lib/apt/lists/*

# isolate also needs an unprivileged user of its own to drop to, with a
# subuid/subgid range allocated so user namespaces work. `make install` does not
# create it, and without it every box fails with
# `User isolate not found in /etc/subuid`.
RUN groupadd --system isolate --gid 1234 \
&& useradd --system isolate --uid 1234 --gid isolate --no-create-home \
&& echo 'isolate:1234:65536' >> /etc/subuid \
&& echo 'isolate:1234:65536' >> /etc/subgid

# Build isolate from source rather than trusting a distribution package: it is
# the sandbox, so its version is part of the security boundary.
RUN git clone --depth 1 https://github.com/ioi/isolate /tmp/isolate \
&& cd /tmp/isolate \
&& make isolate isolate-check-environment \
&& make install \
&& cd / && rm -rf /tmp/isolate

# The runner reads this to know which directory to bind mount read only into
# each sandbox. Naming it here means it does not depend on what the launcher
# happens to compute.
ENV TOUR_VROOT=/opt/vlang
ENV PATH=/opt/vlang:${PATH}

# Every compile of a visitor's program is expected to be inspected by a
# learner, not reported upstream. Without this the compiler submits a C bug
# report to bugs.vlang.io for each genuine compile error in a submission,
# which is noise for the project and leaks the content of what was submitted.
ENV V_C_ERROR_BUG_REPORT_DISABLED=1

# The toolchain is the release compiler from the `toolchain` stage, not the
# source build. `vlang` was only needed to compile this tour, and nothing from
# it has to survive into the image that executes a visitor's code.
COPY --from=toolchain /opt/vlang /opt/vlang

WORKDIR /opt/tour

# The templates and static assets are read at runtime; the V sources are not,
# because -prod compiled the lesson content into the binary.
COPY templates/ templates/
COPY static/ static/

# The finished binary, built by the pinned source compiler in the `vlang` stage.
COPY --from=vlang /tour /usr/local/bin/tour

# Check what can be checked without privileges. The tour's own isolation
# self-test cannot run here: creating namespaces requires CAP_SYS_ADMIN, and a
# `docker build` step does not have it, so it fails with "Cannot run proxy,
# clone failed". That check belongs to the privileged runtime, where it runs on
# every start and again on every healthcheck, and where it can actually mean
# something. What is verified here is that both binaries exist and that the
# compiler in the toolchain is the one that will be bind mounted.
RUN isolate --version && /opt/vlang/v -version

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/tour"]