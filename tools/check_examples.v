module main

import os

// check_examples compiles and, where it makes sense, runs every example under
// content/examples using the genuine V 0.5.2 release compiler -- the compiler
// the sandbox actually uses to execute a learner's submission.
//
// Rules this script exists to enforce:
//
//  1. Use the release compiler, not whatever `v` is on PATH. A post-release
//     master build can compile something the release cannot, which is exactly
//     the mistake this check is meant to catch.
//  2. Run the driver with the same 0.5.2 compiler, because a V driver leaks its
//     own VROOT to child compilers. Driving with a master `v` makes the child
//     read the master's vlib, which produces failures that belong to the
//     harness rather than to the tour.
//  3. Give the compiler its own TMPDIR, because its build directory is
//     <temp>/v_<uid>, shared with every other V build on the machine.
//
// This file deliberately uses only API that exists in V 0.5.2. In particular
// `os.exec_opt([]string)` does NOT exist there -- it was added after 0.5.2 --
// so commands are passed as strings via `os.execute_opt`. Every path here is
// fixed by this script, so there is nothing interpolated from outside.
//
// A stub file is reported as SKIP with its reason, never as a pass, so an
// incomplete exercise cannot look verified.
//
// Usage: <v-0.5.2-dir>\v.exe run tools/check_examples.v <dir-containing-v.exe>

struct Result {
	name   string
	kind   string
	status string
	detail string
}

struct Run {
	exit_code int
	output    string
}

fn main() {
	vroot := os.args[1]
	vex := os.join_path(vroot, 'v.exe')
	if !os.exists(vex) {
		eprintln('no v.exe at ${vex}')
		exit(1)
	}

	examples_dir := 'content/examples'
	files := os.ls(examples_dir) or {
		eprintln('cannot read ${examples_dir}: ${err.msg()}')
		exit(1)
	}

	mut results := []Result{}
	for name in files {
		if name.ends_with('.v') {
			results << check_one(vex, name, os.join_path(examples_dir, name))
		}
	}

	mut pass := 0
	mut fail := 0
	mut skipped := 0
	for r in results {
		head := '${pad(r.status, 7)}${pad(r.kind, 10)}${r.name}'
		if r.status == 'PASS' {
			pass++
			println(head)
			if r.detail != '' {
				println('           ${pad('', 17)}${r.detail}')
			}
		} else if r.status == 'FAIL' {
			fail++
			println(head)
			for l in r.detail.split_into_lines() {
				println('           ${pad('', 17)}${l}')
			}
		} else {
			skipped++
			println('${head}  ${r.detail}')
		}
	}
	println('')
	println('PASS=${pass} FAIL=${fail} SKIPPED=${skipped} TOTAL=${results.len}')
	if fail > 0 {
		exit(1)
	}
}

fn pad(s string, n int) string {
	mut out := s
	for out.len < n {
		out += ' '
	}
	return out
}

fn kind_of(base string) string {
	if base.ends_with('_exercise.v') {
		return 'exercise'
	}
	if base.ends_with('_broken.v') {
		return 'broken'
	}
	if base.ends_with('_done.v') || base.ends_with('_solution.v') {
		return 'done'
	}
	return 'example'
}

fn check_one(vex string, name string, path string) Result {
	kind := kind_of(name)
	body := os.read_file(path) or {
		return Result{
			name:   name
			kind:   kind
			status: 'FAIL'
			detail: 'unreadable: ${err.msg()}'
		}
	}

	if kind == 'exercise' {
		return Result{
			name:   name
			kind:   kind
			status: 'SKIP'
			detail: 'unfinished stub by design; the _solution.v sibling is the one that must run'
		}
	}

	if body.contains('your code here') {
		return Result{
			name:   name
			kind:   kind
			status: 'SKIP'
			detail: 'contains a stub body; nothing to verify'
		}
	}

	if kind == 'broken' {
		return compile_expecting_failure(vex, name, kind, path)
	}

	return compile_and_run(vex, name, kind, path)
}

// compile_expecting_failure compiles a broken-by-design lesson and requires it
// to fail. If it compiles cleanly the lesson no longer teaches anything.
fn compile_expecting_failure(vex string, name string, kind string, path string) Result {
	r := build(vex, path)
	if r.exit_code == 0 {
		return Result{
			name:   name
			kind:   kind
			status: 'FAIL'
			detail: 'expected a compile error, but a broken-by-design file compiled cleanly'
		}
	}
	return Result{
		name:   name
		kind:   kind
		status: 'PASS'
		detail: 'fails to compile, as designed'
	}
}

fn compile_and_run(vex string, name string, kind string, path string) Result {
	b := build(vex, path)
	if b.exit_code != 0 {
		return Result{
			name:   name
			kind:   kind
			status: 'FAIL'
			detail: 'did not compile:\n${b.output}'
		}
	}
	exe := os.join_path(os.vtmp_dir(), 'chk_example.exe')
	r := execute('"${os.quoted_path(exe)}"')
	if r.exit_code != 0 {
		return Result{
			name:   name
			kind:   kind
			status: 'FAIL'
			detail: 'compiled, but exited ${r.exit_code}:\n${r.output}'
		}
	}
	return Result{
		name:   name
		kind:   kind
		status: 'PASS'
		detail: 'ran ok -> ${r.output.trim_space().replace('\n', ' / ')}'
	}
}

fn build(vex string, path string) Run {
	exe := os.join_path(os.vtmp_dir(), 'chk_example.exe')
	cmd := '"${os.quoted_path(vex)}" -skip-unused -o "${os.quoted_path(exe)}" "${os.quoted_path(path)}"'
	return execute(cmd)
}

// execute runs a command string and always returns a result, treating a spawn
// failure as a non-zero exit rather than propagating an error.
fn execute(cmd string) Run {
	r := os.execute_opt(cmd) or {
		return Run{
			exit_code: -1
			output:    err.msg()
		}
	}
	return Run{
		exit_code: r.exit_code
		output:    r.output
	}
}
