# A Tour of V

An interactive tour of the [V programming language](https://vlang.io), modelled on
[A Tour of Go](https://go.dev/tour/). Written in V, served with `veb`, and with
every example compiled and run for the reader.

```
docker compose up --build       # then open http://localhost:8080
```

## What this is

The Go Tour teaches a language by showing a program on every page and letting
the reader change it and run it. This is that idea, for V, with V's own
material rather than a transliteration of Go's.

Eight lessons, in reading order:

| Lesson | Pages | State |
|---|---|---|
| `welcome` — how to use the tour | 5 | written |
| `basics` — modules, variables, functions | 13 | written |
| `controlflow` — for, if, match, defer | 10 | written |
| `moretypes` — structs, arrays, slices, maps, strings | 8 | written |
| `optionresult` — Option and Result in depth | 4 | written |
| `methods` — interfaces, embedding, `str` | 5 | written |
| `generics` — type parameters | — | placeholder |
| `concurrency` — spawn, channels, lock | — | placeholder |

The two unwritten lessons are listed and navigable but say plainly that they
are not written yet, so the shape of the finished tour is visible from the
start. 45 pages of real content exist today, across 39 example programs.

## How it is put together

```
main.v            routes, startup, the isolation self-test
view.v            the view models the templates render
api/              the JSON endpoints
runner/           compiling and running submitted code
tour/             navigation: the flat page sequence
content/          the lessons, and the example programs
templates/        veb templates
static/           CodeMirror 5 (vendored), the V mode, app.js, app.css
```

### Content is compiled in, not parsed

A lesson is typed V data, not a file read at startup:

```v ignore
Page{
	title: 'For is V\'s "while"'
	body:  cf_while
	code:  Example{ files: [while_and_forever_file] }
}
```

A malformed lesson is therefore a compile error rather than a runtime surprise,
and the compiler's own checks apply to lesson structure.

Code examples are the exception. Each lives in a real `.v` file under
`content/examples/` and is embedded with `$embed_file`:

```v ignore
const hello_file = CodeFile{
	name: 'hello.v'
	body: $embed_file('examples/hello.v').to_string()
}
```

They have to be. Every string form in V — `'...'`, `"..."`, `r'...'` — still
interpolates `${...}`, and V code examples are full of string interpolation, so
there is no way to write them as V string literals without an escaping layer
leaking into the editor. Embedding real files means the learner reads exactly
what the author wrote, and a renamed file becomes a compile error rather than
an empty editor.

`tour_test.v` checks both of these properties, including that embedded
examples still contain their `${` interpolations.

### Prose is trusted HTML

Page bodies are pre-authored HTML. That is safe by construction: lesson text is
compiled into the binary, so nothing a visitor submits can reach it. Visitor
input flows only through the editor and the API, which escape it.

Writing a page body means three things, all of them load-bearing and documented
on `content.Page` in `content/content.v`:

- HTML attributes use single quotes: `<a href='/list'>`. A double quote would
  end the V string.
- A literal `${` is written `&#36;{`. Every V string form interpolates.
- V backticks are single characters, not string delimiters, so multi line text
  uses ordinary double quoted strings.

### Navigation is one sequence, not a tree

Prev and next walk a flat list of pages spanning every module, so moving forward
never stops to ask what comes next. Page numbers restart at 1 for each lesson,
and an out-of-range number is a real 404 rather than a clamp, so stale links
behave predictably.

### Errors are marked in the editor

The Go Tour scrapes `file:line:` out of the compiler's output in the browser.
Here that parsing happens on the server, in `runner/diagnostics.v`, where it can
be tested, and the API returns a single `diagLine`. Program output is inserted
with `textContent`, never as markup, because a learner program can print
anything at all.

## Running submitted code

This is the part that matters. A tour that executes submitted code is a remote
code execution service; the difference between that and a language tutorial is
entirely whether the sandbox holds.

The design follows the official V playground at
[play.vlang.io](https://play.vlang.io), which uses
[ioi/isolate](https://github.com/ioi/isolate): Linux namespaces, cgroups, a
seccomp filter and a chroot. Each run gets a fresh box, and the compiler is
bind-mounted read-only into it.

| | compile | run |
|---|---|---|
| processes | 10 | 10 |
| memory (RLIMIT_AS) | 2 GB | 500 MB |
| CPU seconds | — | 2 |
| wall clock | 60 s | 3 s |
| network | none | none |

Three deliberate differences from upstream:

**No bypass switch.** The playground's isolate wrapper has a `-d local` build
flag that strips the `isolate` prefix and runs the command directly on the
host — an unsandboxed RCE service that looks identical in the source. There is
no such switch here; every command that touches visitor code goes through
`exec_boxed`.

**The sandbox is verified on every start.** `runner/isolation_check.v` runs
deliberately hostile programs through the real run path before the listener
opens, and the process exits if any of them survives: network access, reading
`/etc/passwd`, writing outside the box, an infinite loop, a memory bomb, a fork
bomb, and a 60 second sleep. This exists because of how the official playground
got it wrong: its `/cgen` endpoint was found running the compiler directly on
the host, and the most recent commit in that repository is titled "fix
vulnerability". A sandbox is a claim that is easy to make and easy to stop
making by accident.

**No arbitrary compiler flags.** The playground accepts user-supplied build and
run arguments, sanitised to `[\w\d\-=]`. That closes shell injection but still
permits flag injection. This tour accepts none.

## Status

Working and verified:

- All 45 pages of content compile, and all 39 example programs compile and run
  with correct output and no compiler noise.
- The server renders every lesson, the list, and real 404s for unknown lessons,
  out-of-range pages and wrong URL depth.
- The editor, keyboard shortcuts, persistence, TOC and themes work in a browser.
- `v test .` passes; `v fmt -w .` and `v check-md` are clean.

Every claim a lesson makes about output was checked against the program's
actual output rather than assumed. That caught several, including that
assignment and slicing share rather than copy in this compiler, so the lessons
teach `clone` as the explicit way to get an independent copy instead of
asserting a rule that is version dependent.

Output is stripped of ANSI escape sequences on the server before it is shown. A
compiler error carrying a highlighted source excerpt would otherwise reach the
browser as literal `ESC [ 3 1 m` bytes, and rendering colour from program
output would mean inserting markup built from it.

Not yet verified end to end:

**A compile and run inside the container's sandbox.** The image builds and the
sandbox itself works — isolate creates boxes, enforces namespaces, and contains
the probes. What is not yet proven is the V compiler completing a build *inside*
a box. Two upstream V bugs at the pinned commit stand in the way:

1. `vlib/builtin/backtraces_nix.c.v` generates C that does not compile —
   `addr2line_executable` reaches `backtrace_exec_capture` as an `int` where an
   argument array is expected. This is the same failure that broke a plain
   `v main.v` during the build, so it is not specific to the sandbox.
2. The compiler's C fallback bootstrap passes a shell command list to the
   process spawner as a single argv, so `make v1` fails with `&&` treated as a
   filename. The fallback is needed because the V installation is mounted read
   only.

Both are in the compiler, not in this project. The pinned commit is
`a9e7ec2e0e41229a6e1acda45fbda5065527e9e5`; moving to a newer V is likely to
clear both, and the application code should not need to change.

Worked around deliberately rather than patched here: `install_v1_fallback.sh`
is itself a shell script, so its `oldv` path could be replicated by hand in the
Dockerfile. That was not done. Reimplementing a compiler's cache layout in a
Dockerfile is the kind of coupling that fails silently, and the failure mode
here is the sandbox quietly ceasing to contain code — which is precisely what
the self-test exists to detect, but only if nobody has papered over it first.

Until then, `TOUR_SKIP_SELF_TEST=1` runs the server without a sandbox. That is
for local development on a machine where running code is already something you
permit. Do not expose it.

## Developing

Requires V and Docker.

```sh
v fmt -w .          # format, including the veb templates
v test .            # unit tests
v run .             # needs TOUR_SKIP_SELF_TEST=1 outside a container
docker compose up --build
```

Two traps worth knowing, both of which cost time here:

- V excludes any file ending `_test.v` from a normal build, so a module
  function in a file named `self_test.v` is invisible to importers. The
  isolation check is in `runner/isolation_check.v` for that reason.
- An `ARG` before the first `FROM` is global and only in scope for `FROM`
  lines; each stage that uses it must declare it again.

## Adding a page

1. Put the example in `content/examples/`, as a real `.v` file.
2. Add a `CodeFile` constant with `$embed_file`.
3. Add the prose as a `"..."` constant, following the three rules on
   `content.Page`.
4. Add the `Page` to the lesson in `content/<lesson>.v`.
5. `v fmt -w . && v test . && v run .`

`tour_test.v` will tell you if a lesson has no title, if an example embedded as
empty, or if the deliberately broken page stopped being broken.

## Licence

MIT.