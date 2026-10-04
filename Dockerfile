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
# The V toolchain is built from source at the commit the tour is developed
# against, rather than taken from the official vlang image.
#
# The reason is veb. The tour's templates use `veb.raw` and loop over the
# table of contents, and the veb in the official image (V 0.5.0) has neither.
# Building V from the 0.5.2 tag under Debian 12's gcc does not bootstrap
# cleanly either. This commit builds, runs, and has the veb the tour is written
# for.
#
# To move to a newer V, change V_COMMIT, then run `v fmt -w .` and `v test .`
# with it locally before rebuilding.

ARG V_COMMIT=a9e7ec2e0e41229a6e1acda45fbda5065527e9e5

# ---------------------------------------------------------------- V toolchain

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

# Known gap: the compiler wants to build a C fallback for some code paths, and
# `make v1` is the documented way to do it up front. At this commit `make v1`
# fails, because the bootstrap passes a shell command list to the process
# spawner as a single argv (`['mkdir', '-p', ..., '&&', 'cp', ...]`), so the
# `&&` are treated as filenames. Until that is fixed upstream, the first
# compile inside a sandbox may fail with
# `failed to create C build directory ...: Read-only file system`.
#
# The fix is one line in the compiler's fallback bootstrap, not something to
# work around here: install the container root filesystem writable for that one
# command instead of read only, and leave the sandbox mounts read only where
# they matter.
#
# RUN cd /opt/vlang && make v1

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

COPY --from=vlang /opt/vlang /opt/vlang

WORKDIR /opt/tour

COPY v.mod ./
COPY main.v view.v ./
COPY api/ api/
COPY content/ content/
COPY runner/ runner/
COPY tour/ tour/
COPY templates/ templates/
COPY static/ static/

# -prod embeds the lesson content into the binary rather than reading it at
# runtime, so the image needs no content directory of its own.
RUN v -prod -o /usr/local/bin/tour .

# Check what can be checked without privileges. The full isolation self-test
# cannot run here: creating namespaces requires CAP_SYS_ADMIN, and a `docker
# build` step does not have it. That check belongs to the privileged runtime,
# where it runs on every start and again on every healthcheck, and where it can
# actually mean something.
RUN v -version && isolate --version

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/tour"]