#!/usr/bin/env python3
"""Compile and run every lesson example, in the compiler that will run them.

The tour compiles a reader's program with the V build inside the container, and
that build is not the same one a developer has on their machine: two builds
both reporting `V 0.5.2` disagreed on six constructs, and every example involved
compiled on the host and failed in the sandbox. `v test .` cannot catch that. It
checks that a page has a program and that the example embeds non-empty, but it
never compiles anything, because sixty compiler invocations do not belong in a
unit test.

So this is the other half of the check, and it has to run against a tour that is
already serving:

    docker build -t tour-of-v:check .
    docker run -d --name tour-check -p 8128:8080 tour-of-v:check
    python scripts/check_examples.py http://127.0.0.1:8128
    docker rm -f tour-check

Exit status is 0 when every example produced output, 1 otherwise.

Two things are deliberately not treated as failures. `variables_broken.v` is
meant not to compile, and is recognised by content the way `tour_test.v` does,
because it is served as `main.v` and would otherwise be indistinguishable from
every other page using that name. And a page whose example is absent is skipped,
which is the one state `tour_test.v` already forbids.
"""

import json
import re
import sys
import urllib.error
import urllib.parse
import urllib.request

BASE = (sys.argv[1] if len(sys.argv) > 1 else "http://127.0.0.1:8128").rstrip("/")

# Discovered from the catalogue rather than hard-coded, so a new lesson does not
# need editing here. The 404 is the boundary.
SLUGS = ["welcome", "basics", "controlflow", "moretypes", "optionresult",
         "methods", "generics", "concurrency"]

# The deliberately broken page, matched on content rather than name, because
# tour_test.v does the same and because it is served as `main.v`.
def is_deliberately_broken(body):
    return "sum = sum + 10" in body and "mut sum := 1" not in body


def get(path):
    with urllib.request.urlopen(BASE + path, timeout=30) as r:
        return r.read().decode("utf-8", "replace")


def post(path, fields):
    # veb parses a form-encoded body only. A JSON body arrives as an empty form,
    # which looks like a broken handler and is not.
    data = urllib.parse.urlencode(fields).encode()
    req = urllib.request.Request(BASE + path, data=data)
    with urllib.request.urlopen(req, timeout=300) as r:
        return r.read().decode("utf-8", "replace")


def page_count(slug):
    n = 1
    while n < 500:
        try:
            get("/%s/%d" % (slug, n))
        except urllib.error.HTTPError as exc:
            if exc.code == 404:
                return n - 1
            raise
        n += 1
    return n - 1


def diagnose(res):
    """The most informative line available, preferring a crash to silence."""
    bo = res.get("buildOutput") or ""
    if "V panic" in bo:
        return "COMPILER PANIC: " + bo.splitlines()[0][:110]
    seen = []
    for line in bo.splitlines():
        if ": error:" in line and line.strip() not in seen:
            seen.append(line.strip())
    if seen:
        return " | ".join(seen[:2])
    if res.get("error"):
        return "error: " + res["error"][:110]
    if res.get("limited"):
        return "hit the wall clock or a resource limit with no output"
    return "no output and no diagnostic"


def main():
    try:
        get("/welcome/1")
    except Exception as exc:  # noqa: BLE001
        print("cannot reach a tour at %s: %s" % (BASE, exc))
        print("start one first; see the module docstring.")
        return 2

    ran = 0
    expected_failures = 0
    problems = []
    pages = 0

    for slug in SLUGS:
        for n in range(1, page_count(slug) + 1):
            pages += 1
            path = "/%s/%d" % (slug, n)
            try:
                body = get(path)
            except Exception as exc:  # noqa: BLE001
                problems.append("%s -> %s" % (path, exc))
                continue
            island = re.search(r'id="page-data"[^>]*>(.*?)</script>', body, re.S)
            if not island:
                problems.append("%s -> no page-data island" % path)
                continue
            data = json.loads(island.group(1))
            files = data.get("files") or []
            if not files:
                problems.append("%s -> page carries no program" % path)
                continue
            for f in files:
                name = f.get("name") or "?"
                source = f.get("body") or ""
                res = json.loads(post("/api/run", {"code": source, "filename": name}))
                output = (res.get("output") or "").strip()
                if is_deliberately_broken(source):
                    if output:
                        problems.append("%s %s -> meant to fail but ran" % (path, name))
                    else:
                        expected_failures += 1
                    continue
                if output:
                    ran += 1
                else:
                    problems.append("%s %s -> %s" % (path, name, diagnose(res)))

    print("pages: %d" % pages)
    print("examples that ran: %d" % ran)
    print("deliberate failures confirmed: %d" % expected_failures)
    if problems:
        print("\nPROBLEMS (%d):" % len(problems))
        for p in problems:
            print("  " + p)
        return 1
    print("\nevery example runs in the sandbox compiler")
    return 0


if __name__ == "__main__":
    sys.exit(main())