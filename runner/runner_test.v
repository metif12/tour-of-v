module runner_test

import os
import runner

// A colour sequence, built at runtime so this file does not itself contain
// the bytes it is testing for.
fn red() string {
	return u8(27).ascii_str() + '[31m'
}

fn reset() string {
	return u8(27).ascii_str() + '[0m'
}

fn test_strip_ansi_removes_colour_sequences() {
	assert runner.strip_ansi('a${red()}red${reset()}b') == 'aredb'
}

fn test_strip_ansi_removes_cursor_movement() {
	// CSI A moves the cursor up. It carries no text worth keeping.
	esc := u8(27).ascii_str()
	assert runner.strip_ansi('one\n${esc}[2Athree') == 'one\nthree'
}

fn test_strip_ansi_removes_erase_and_clear() {
	esc := u8(27).ascii_str()
	assert runner.strip_ansi('before${esc}[2Jafter') == 'beforeafter'
	assert runner.strip_ansi('x${esc}[K') == 'x'
}

fn test_strip_ansi_leaves_ordinary_text_alone() {
	assert runner.strip_ansi('plain text') == 'plain text'
	assert runner.strip_ansi('') == ''
	assert runner.strip_ansi('a [31m b') == 'a [31m b'
	assert runner.strip_ansi('100% [done]') == '100% [done]'
}

fn test_strip_ansi_handles_a_truncated_sequence() {
	// Output cut off mid-sequence must not lose the rest of the text, and must
	// not loop. A colour sequence with no terminator is simply dropped.
	esc := u8(27).ascii_str()
	assert runner.strip_ansi('done${esc}[31') == 'done'
	assert runner.strip_ansi('${esc}') == ''
}

fn test_strip_ansi_drops_a_lone_escape() {
	esc := u8(27).ascii_str()
	assert runner.strip_ansi('a${esc}b') == 'ab'
}

fn test_strip_ansi_leaves_a_bracket_that_is_not_a_sequence() {
	// The `[` only introduces a sequence when it directly follows ESC.
	assert runner.strip_ansi('array[0]') == 'array[0]'
}

// prettify now strips escapes before bounding, so a program that prints colour
// cannot use it to smuggle bytes past the size limits either.
fn test_prettify_strips_escapes() {
	noisy := 'start${red()}middle${reset()}end'
	assert runner.prettify(noisy) == 'startmiddleend'
}

fn test_parse_diagnostic_reads_a_real_error() {
	raw := 'main.v:3:6: error: `sum` is immutable, declare it with `mut` to make it mutable'
	d := runner.parse_diagnostic(raw)
	assert d.file == 'main.v'
	assert d.line == 3
	assert d.column == 6
	assert d.level == 'error'
	assert d.text == '`sum` is immutable, declare it with `mut` to make it mutable'
}

fn test_parse_diagnostic_handles_a_real_syntax_error() {
	raw := 'main.v:1:30: error: unfinished string literal'
	d := runner.parse_diagnostic(raw)
	assert d.line == 1
	assert d.column == 30
	assert d.level == 'error'
	assert d.text == 'unfinished string literal'
}

// V messages contain colons of their own, so splitting naively on every colon
// loses the tail of the message.
fn test_parse_diagnostic_keeps_colons_inside_the_message() {
	raw := 'main.v:2:5: error: cannot use `x` as `int` in argument 1 to `f`: note: expected int'
	d := runner.parse_diagnostic(raw)
	assert d.line == 2
	assert d.level == 'error'
	assert d.text.contains('argument 1')
	assert d.text.contains('note: expected int')
}

fn test_parse_diagnostic_handles_notes_and_warnings() {
	w := runner.parse_diagnostic('main.v:9:2: warning: unused variable `y`')
	assert w.level == 'warning'
	assert w.line == 9

	n := runner.parse_diagnostic('main.v:4:1: note: declared here')
	assert n.level == 'note'
	assert n.text == 'declared here'
}

fn test_parse_diagnostic_ignores_prose_that_looks_numeric() {
	// "Tutorial part 2: read the docs" must not become a diagnostic.
	assert runner.parse_diagnostic('see part 2: read the docs').line == 0
	assert runner.parse_diagnostic('no position at all').line == 0
	assert runner.parse_diagnostic('').line == 0
}

fn test_parse_diagnostics_finds_every_positioned_line() {
	output := 'main.v:3:6: error: `sum` is immutable\n    3 |     sum = sum + 10\n      |     ~~~~\nCannot compile file main.v'
	diags := runner.parse_diagnostics(output)
	assert diags.len == 1
	assert diags[0].line == 3
}

fn test_first_error_line_picks_the_first_error() {
	diags := runner.parse_diagnostics('main.v:5:1: warning: unused `x`\nmain.v:2:1: error: broken')
	assert runner.first_error_line(diags) == 2
}

fn test_first_error_line_is_zero_when_nothing_is_positioned() {
	assert runner.first_error_line([]) == 0
	assert runner.first_error_line(runner.parse_diagnostics('Cannot compile')) == 0
}

// Programs in a print loop can emit output far faster than they burn CPU, so
// both bounds are needed.
fn test_prettify_bounds_bytes() {
	huge := 'x'.repeat(runner.max_output_bytes * 2)
	out := runner.prettify(huge)
	assert out.len <= runner.max_output_bytes
	assert out.ends_with('...')
}

fn test_prettify_bounds_lines() {
	mut many := []string{}
	for i in 0 .. runner.max_output_lines + 50 {
		many << i.str()
	}
	out := runner.prettify(many.join('\n'))
	assert out.count('\n') <= runner.max_output_lines + 1
	assert out.contains('more lines')
}

fn test_prettify_leaves_short_output_alone() {
	assert runner.prettify('hello\nworld') == 'hello\nworld'
}

fn test_prettify_trims_a_trailing_newline() {
	assert runner.prettify('hello\n') == 'hello'
}

fn test_strip_isolate_status_removes_the_timing_line() {
	raw := 'smallest: 1\nlargest: 9\nOK (0.033 sec real, 0.219 sec wall)'
	assert runner.strip_isolate_status(raw) == 'smallest: 1\nlargest: 9'
}

fn test_strip_isolate_status_removes_a_failed_command_line() {
	raw := 'partial output\nFailed command: ./main'
	assert runner.strip_isolate_status(raw) == 'partial output'
}

fn test_strip_isolate_status_keeps_program_output_that_looks_similar() {
	// A learner program may legitimately print something starting with OK.
	raw := 'OK (this is my program output)'
	assert runner.strip_isolate_status(raw) == 'OK (this is my program output)'
}

fn test_strip_isolate_status_survives_empty_output() {
	assert runner.strip_isolate_status('') == ''
}

// isolate reports the process cap it applied on its own status line, so the
// flag has to be present and has to carry the right number.
fn test_compile_limit_allows_the_compiler_thread_pool() {
	// V builds a thread pool sized from the CPU count when the compiler starts.
	// If this cap is not comfortably above the program cap, the compiler dies
	// before printing anything and every build looks like an empty failure.
	compile := runner.compile_limits()
	assert '--processes=${runner.max_compiler_processes}' in compile
	assert runner.max_compiler_processes > runner.max_program_processes
}

fn test_run_limit_keeps_the_fork_bomb_cap() {
	// The submitted program is the untrusted thing here, so its cap stays tight
	// and must not drift upward with the compiler's.
	run := runner.run_limits()
	assert '--processes=${runner.max_program_processes}' in run
	assert runner.max_program_processes <= 10
}

fn test_every_box_gets_a_writable_home_and_a_path() {
	// Without HOME the compiler has nowhere to put its temporary files, and
	// without PATH isolate's empty environment hides the C compiler.
	for limits in [runner.compile_limits(), runner.run_limits(), runner.tool_limits()] {
		assert '--env=HOME=/box' in limits
		assert limits.any(it.starts_with('--env=PATH='))
	}
}

fn test_compile_flags_actually_reach_the_compiler() {
	// compile_flags used to be a constant nothing read, so a build got none of
	// it. These are the flags whose absence changes what a learner sees.
	args := runner.compile_flag_args()
	assert '-cc' in args
	assert 'gcc' in args
	assert '-no-retry-compilation' in args
	assert '-no-parallel' in args
	assert '-g' in args
	assert '-DGC_MARKERS=1' in args
}

fn test_format_flag_args_splits_into_separate_arguments() {
	assert runner.format_flag_args() == ['-verify']
}

fn test_binary_name_is_the_executable_the_compiler_writes() {
	// `v main.v` writes `main`. Running `./main.v` instead fails with
	// `execve("./main.v"): Permission denied` after a build that succeeded,
	// which reads like a broken sandbox rather than a name mismatch.
	assert runner.binary_name('main.v') == 'main'
	assert runner.binary_name('hello.v') == 'hello'
}

fn test_binary_name_keeps_a_directory_out_of_the_path() {
	// The executable is written to the top of the box, so a path is stripped.
	assert runner.binary_name('dir/main.v') == 'main'
}

fn test_binary_name_leaves_a_name_without_the_v_suffix_alone() {
	assert runner.binary_name('main') == 'main'
	assert runner.binary_name('weird') == 'weird'
}

// Validation runs before anything touches the filesystem, so an empty
// submission must fail here rather than producing an empty box.
fn test_validate_rejects_an_empty_submission() {
	assert runner.validate([]runner.SourceFile{}) == 'No code was provided.'
}

// Each file becomes a box entry plus compiler work, so the count is capped
// before the box is even created.
fn test_validate_rejects_too_many_files() {
	mut files := []runner.SourceFile{}
	for i in 0 .. runner.max_source_files + 1 {
		files << runner.SourceFile{
			name: 'f${i}.v'
			body: 'x'
		}
	}
	assert runner.validate(files).contains('Too many files')
}

// The message names the offender so the caller can tell which of several
// files was refused without resubmitting them one at a time.
fn test_validate_rejects_an_illegal_name() {
	files := [runner.SourceFile{
		name: 'bad name.v'
		body: 'fn main() {}'
	}]
	assert runner.validate(files) == 'Illegal file name: bad name.v'
}

// veb sets no request body limit of its own, so the byte total is enforced
// here before a giant post reaches the disk.
fn test_validate_rejects_an_oversized_program() {
	files := [runner.SourceFile{
		name: 'main.v'
		body: 'x'.repeat(runner.max_source_bytes + 1)
	}]
	assert runner.validate(files).contains('too large')
}

// A single well-formed file is the normal tour submission, so it must pass
// with no message at all.
fn test_validate_accepts_a_single_good_file() {
	files := [runner.SourceFile{
		name: 'main.v'
		body: 'fn main() { println(1) }'
	}]
	assert runner.validate(files) == ''
}

// The environment override lets operators point the boxes at a fixed
// toolchain without rebuilding, so a set variable must win.
fn test_toolchain_root_prefers_the_env_override() {
	old := os.getenv('TOUR_VROOT')
	defer {
		if old == '' {
			os.unsetenv('TOUR_VROOT')
		} else {
			os.setenv('TOUR_VROOT', old, true)
		}
	}
	os.setenv('TOUR_VROOT', '/fixed/toolchain/root', true)
	assert runner.toolchain_root() == '/fixed/toolchain/root'
}

// Without the override the server must still find its own compiler, so an
// unset variable falls back to something non-empty rather than failing.
fn test_toolchain_root_falls_back_without_the_env() {
	old := os.getenv('TOUR_VROOT')
	defer {
		if old == '' {
			os.unsetenv('TOUR_VROOT')
		} else {
			os.setenv('TOUR_VROOT', old, true)
		}
	}
	os.unsetenv('TOUR_VROOT')
	assert runner.toolchain_root() != ''
}
