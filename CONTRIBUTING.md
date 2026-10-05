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

## Adding a lesson page

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

## Reporting a compiler bug

If the tour is blocked by something in V itself, check for an existing issue
before opening one, and include a reproduction that someone else can run. The
tour has shipped two: one for a cgen bug and one for the V1 fallback. Both are
worth reading before writing a new report, because both had already been
misdiagnosed once locally before the actual cause turned up.

## Licence

MIT, see [LICENSE](LICENSE). Third party code and assets keep their own
licences, listed in [THIRD_PARTY.md](THIRD_PARTY.md).
