# Contributing

## Branches

`main` is the stable branch. It is always deployable: the image builds, the
unit tests pass, and the container's isolation self-test passes. Nothing lands
on `main` that breaks any of those.

Work happens on a branch, branched from an up to date `main`:

| branch | for |
| --- | --- |
| `feat/<slug>` | a feature, however small |
| `fix/<slug>` | a bug fix |
| `docs/<slug>` | prose only, no behaviour change |
| `chore/<slug>` | build, dependencies, tooling |

Branch names use the slug, lower case and hyphenated: `feat/v-in-browser`,
`fix/run-button-scroll`.

There are no long lived branches. A branch is merged and deleted once its work
lands, so the only branch that accumulates history is `main`.

To start:

```sh
git switch main
git pull
git switch -c feat/<slug>
```

## Before opening a pull request

```sh
v fmt -w .
v -check .
v test .
docker compose build
docker compose run --rm tour --self-test-only
```

All of it has to pass. The last one matters more than it looks: it compiles and
runs a program inside a real sandbox and then attacks it, so it catches the
class of change that unit tests cannot. It needs `docker compose up` not
running at the same time, because both want port 8080.

`v fmt -w .` covers the veb templates too. A template change that has not been
formatted will fail the build.

## If you touched a lesson example

`v test .` does **not** compile the examples. It checks that each page has a
program, that each example embeds non-empty, and that each has a `fn main()`,
which is why six examples were able to ship that compiled on the author's
machine and not in the sandbox. Sixty compiler invocations do not belong in a
unit test, so the other half of the check lives in a script.

The compiler that matters is the one in the image, which is not the one on your
machine. Both report `V 0.5.2` and they disagree: a send needs brackets around
a computed value, `chan T` takes `cap:` and refuses `len:`, a `select` with both
a send and a receive branch crashes the compiler, and `json2` is `x.json2`.

So build the image, serve it, and run every example through it:

```sh
docker build -t tour-of-v:check .
docker run -d --name tour-check -p 8128:8080 tour-of-v:check
python scripts/check_examples.py http://127.0.0.1:8128
docker rm -f tour-check
```

It runs all sixty-odd examples and exits non-zero if any produces no output.
`variables_broken.v` is meant to fail and is recognised by content, not by
name. Pick a free port and check nothing else already owns it: a stale container
answering on the port reports its own CSS as your build.

Run it whenever you edit anything under `content/examples/`, or the prose in a
lesson.

## Adding a lesson page

Use the scaffolding script to create the files with the right shape:

```sh
python scripts/new_lesson.py <module-slug> <module-title> <lesson-slug> <lesson-title>
```

For example:

```sh
python scripts/new_lesson.py structs "Structs" structs_intro "Introduction to Structs"
```

This creates `content/structs.v` with a stub module and lesson, and
`content/examples/structs_intro_example.v` with a stub example. It also adds
the module to `content/catalog.v`.

Then fill in the stubs:

1. Put the runnable example in `content/examples/<name>.v` as a real V file.
   Do not put V source in a string literal: every V string form interpolates
   `${...}`, and V examples are full of interpolation. Embed the file with
   `$embed_file`.
2. Add the prose as a `"..."` constant on the page. Read the three rules on
   `content.Page` first: single quotes inside HTML attributes, `&#36;{` for a
   literal dollar-brace, and no backticks.
3. Add the `Page` to its lesson in `content/<lesson>.v`, and the lesson to
   `content/catalog.v` if it is new.
4. Add a test if the page is an exercise, with a solution, or is deliberately
   broken.

`tour/tour_test.v` already checks the invariants that are easy to break: a
lesson without a title, an example embedded as empty, and the deliberately
broken page having stopped being broken.

## Adding a locale

Use the scaffolding script to create a locale file with all UI keys:

```sh
python scripts/new_locale.py <code> <english-name> <native-name> [--rtl]
```

For example:

```sh
python scripts/new_locale.py sv Swedish Svenska
python scripts/new_locale.py he Hebrew עברית --rtl
```

This creates `locale/<code>.v` with every UI key scaffolded, and registers the
locale in `locale/locale.v`. Fill in the translations, then translate page
bodies in the `pages` map as time allows — untranslated pages fall back to
English automatically.

## Reporting a compiler bug

If the tour is blocked by something in V itself, check for an existing issue
before opening one, and include a reproduction that someone else can run. The
tour has shipped two: one for a cgen bug and one for the V1 fallback. Both are
worth reading before writing a new report, because both had already been
misdiagnosed once locally before the actual cause turned up.

## Licence

MIT, see [LICENSE](LICENSE). Third party code and assets keep their own
licences, listed in [THIRD_PARTY.md](THIRD_PARTY.md).
