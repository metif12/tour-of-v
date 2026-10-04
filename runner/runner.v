module runner

import os

// SourceFile is one file of a submitted program.
//
// Names are validated against a strict pattern before use. A submission can
// never influence the path it is written to, and cannot escape the box.
pub struct SourceFile {
pub:
	name string
	body string
}

// RunResult is what the API hands back to the browser.
pub struct RunResult {
pub:
	output     string // the program's stdout and stderr, bounded
	build_out  string // compiler output, bounded
	error      string // non-empty means the request itself failed
	diag_line  int    // 1-based line to mark in the editor, or 0
	diag_text  string // the message for that line
	ran        bool   // whether the program actually executed
	hit_limits bool   // whether a resource limit stopped it
}

// validate checks a submission before anything touches the filesystem.
pub fn validate(files []SourceFile) string {
	if files.len == 0 {
		return 'No code was provided.'
	}
	if files.len > max_source_files {
		return 'Too many files: at most ${max_source_files} are allowed.'
	}
	mut total := 0
	for f in files {
		if !is_safe_name(f.name) {
			return 'Illegal file name: ${f.name}'
		}
		total += f.body.len
	}
	if total > max_source_bytes {
		return 'Your program is too large: ${total} bytes, limit is ${max_source_bytes}.'
	}
	return ''
}

// name_chars is the alphabet a submitted file name may be built from.
//
// A path separator is deliberately absent: a file name is a single name, and
// a submission with several files gets several names. That removes the need to
// reason about traversal through a prefix at all.
const name_chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-.'

// is_safe_name reports whether a submitted file name is acceptable.
//
// Anything outside this set is rejected outright rather than sanitised. There
// is no leading slash, no `..`, no backslash, no hidden file, no absolute
// path, and no path separator of any kind.
fn is_safe_name(name string) bool {
	if name == '' || name.len > 64 {
		return false
	}
	if !name.ends_with('.v') {
		return false
	}
	if name.starts_with('.') {
		return false
	}
	for c in name.runes() {
		if !name_chars.contains(c.str()) {
			return false
		}
	}
	return true
}

// toolchain_root is the V installation bind mounted into every box, read only.
//
// This is the compiler itself. The box needs it to build, and must not be
// able to write to it.
pub fn toolchain_root() string {
	root := os.getenv('TOUR_VROOT')
	if root != '' {
		return root
	}
	return os.dir(@VEXEROOT)
}

// run compiles and then runs a submission.
//
// The two phases are separate isolate invocations sharing one box, so the
// compiler cannot outlive its own wall-clock budget and the program cannot
// inherit anything the compiler left behind.
pub fn run(files []SourceFile) RunResult {
	problem := validate(files)
	if problem != '' {
		return RunResult{
			output:    ''
			build_out: ''
			error:     problem
		}
	}

	b := init_box()
	if !b.ok {
		return RunResult{
			output:    ''
			build_out: ''
			error:     'The sandbox is busy. Please try again.'
		}
	}
	defer {
		cleanup(b)
	}

	msg := write_files(b, files)
	if msg != '' {
		return RunResult{
			output:    ''
			build_out: ''
			error:     msg
		}
	}

	main_name := pick_main(files)
	root := toolchain_root()
	mut compile_argv := ['${root}/v']
	compile_argv << compile_flag_args()
	compile_argv << main_name
	build := exec_boxed(b, root, compile_limits(), compile_argv)

	build_out := strip_isolate_status(prettify(build.output))
	if build.exit_code != 0 {
		line, text := first_diagnostic(build.output)
		return RunResult{
			output:    ''
			build_out: build_out
			diag_line: line
			diag_text: text
			ran:       false
		}
	}

	out := exec_boxed(b, root, run_limits(), ['./${binary_name(main_name)}'])

	mut output := strip_isolate_status(out.output)
	limited := hit_resource_limit(out)
	if limited {
		output = 'The program reached the resource limit assigned to it.'
	}

	return RunResult{
		output:     prettify(output)
		build_out:  build_out
		ran:        true
		hit_limits: limited
	}
}

// format runs `v fmt` over a single file and returns the formatted source.
pub fn format(body string) string {
	b := init_box()
	if !b.ok {
		return ''
	}
	defer {
		cleanup(b)
	}

	tmp := SourceFile{
		name: 'main.v'
		body: body
	}
	write_problem := write_files(b, [tmp])
	if write_problem != '' {
		return ''
	}

	root := toolchain_root()
	mut fmt_argv := ['${root}/v', 'fmt']
	fmt_argv << format_flag_args()
	fmt_argv << 'main.v'
	res := exec_boxed(b, root, tool_limits(), fmt_argv)
	if res.exit_code != 0 {
		return ''
	}
	// `v fmt` echoes the formatted file to stdout, so the body is what comes
	// back rather than a status line.
	return res.output
}

// compiler_version reports the compiler inside the sandbox.
//
// Returned by the API so a lesson can mention a version specific feature
// without going stale, and so "works on my machine" can be checked.
pub fn compiler_version() string {
	b := init_box()
	if !b.ok {
		return ''
	}
	defer {
		cleanup(b)
	}

	root := toolchain_root()
	res := exec_boxed(b, root, tool_limits(), ['${root}/v', '-version'])
	if res.exit_code != 0 {
		return ''
	}
	// isolate appends its own timing line, which is not part of the version.
	return strip_isolate_status(res.output).trim_space()
}

// write_files lays a submission down inside the box.
//
// Returns an empty string on success, or a message describing why not.
//
// Paths are validated before this point, so joining them cannot escape the
// box directory. Parent directories are created for multi file submissions.
fn write_files(b Box, files []SourceFile) string {
	for f in files {
		path := os.join_path(b.path, f.name)
		dir := os.dir(path)
		os.mkdir_all(dir) or { return 'Failed to prepare the sandbox.' }
		os.write_file(path, f.body) or { return 'Failed to write the program.' }
	}
	return ''
}

// pick_main chooses the file to point the compiler at.
//
// `main.v` if there is one, otherwise the first file, which is how the
// tour's single file examples work.
fn pick_main(files []SourceFile) string {
	for f in files {
		if f.name.all_after('/') == 'main.v' {
			return f.name
		}
	}
	return files[0].name
}

// binary_name is the executable the compiler leaves behind for a source file.
//
// `v main.v` writes `main`, not `main.v`, so the run phase has to ask the
// compiler's naming rule rather than reuse the source name. Getting this wrong
// is quiet: the build succeeds, and the run fails with `execve("./main.v"):
// Permission denied`, which reads like a sandbox problem rather than a name
// mismatch.
pub fn binary_name(source_name string) string {
	base := source_name.all_after('/')
	if base.ends_with('.v') {
		return base[..base.len - 2]
	}
	return base
}

// hit_resource_limit reports whether a program was stopped by a limit rather
// than exiting on its own.
//
// isolate surfaces the two interesting cases as an exit status of 1 with a
// recognisable message, so they are matched rather than inferred from a
// non-zero exit, which an ordinary panic also produces.
fn hit_resource_limit(res os.Result) bool {
	if res.exit_code != 1 {
		return false
	}
	return res.output.contains('Resource temporarily unavailable')
		|| res.output.contains('Out of Memory')
		|| res.output.contains('SIGKILL')
}

// first_diagnostic reduces compiler output to one line number and message for
// the editor to mark.
fn first_diagnostic(output string) (int, string) {
	diags := parse_diagnostics(output)
	line := first_error_line(diags)
	if line > 0 {
		for d in diags {
			if d.line == line {
				return d.line, d.text
			}
		}
		return line, ''
	}
	return 0, ''
}
