module runner_test

import runner

fn test_validate_rejects_empty_submission() {
	assert runner.validate([]) != ''
}

// These names are the whole attack surface for path traversal, so each one
// gets its own case rather than being folded into a table.
fn test_validate_rejects_unsafe_file_names() {
	bad := [
		'../escape.v',
		'../../etc/passwd.v',
		'/etc/passwd',
		'a/../../b.v',
		'sub/../../../x.v',
		'..',
		'.',
		'',
		'no_extension',
		'script.sh',
		'C:/windows/system32.v',
		'back\\slash.v',
		'.hidden.v',
		'sub/.hidden.v',
		'with space.v',
		'semi;colon.v',
		'dollar' + '$' + '{x}.v',
		'pipe|it.v',
		'newline.v
second.v',
	]
	for name in bad {
		assert runner.validate([runner.SourceFile{ name: name, body: 'fn main() {}' }]) != '', 'should have rejected file name: ${name}'
	}
}

// A file name is one name, never a path. Refusing a separator outright means
// there is no traversal to reason about at all.
fn test_validate_rejects_names_containing_a_path_separator() {
	for name in ['sub/helper.v', 'a/b/c.v', '/main.v', './main.v'] {
		assert runner.validate([runner.SourceFile{ name: name, body: 'fn main() {}' }]) != '', 'should have rejected path-like name: ${name}'
	}
}

fn test_validate_accepts_ordinary_names() {
	good := ['main.v', 'loops.v', 'a_b-c.v', 'UPPER.v', 'v2.v']
	for name in good {
		assert runner.validate([runner.SourceFile{ name: name, body: 'fn main() {}' }]) == '', 'should have accepted file name: ${name}'
	}
}

fn test_validate_rejects_too_many_files() {
	mut files := []runner.SourceFile{}
	for i in 0 .. 8 {
		files << runner.SourceFile{ name: 'f${i}.v', body: 'fn main() {}' }
	}
	assert runner.validate(files) != ''
}

fn test_validate_rejects_oversized_source() {
	big := 'x'.repeat(runner.max_source_bytes + 1)
	assert runner.validate([runner.SourceFile{ name: 'main.v', body: big }]) != ''
}

fn test_validate_enforces_the_total_size_across_files() {
	half := 'x'.repeat(runner.max_source_bytes / 2 + 10)
	files := [
		runner.SourceFile{ name: 'a.v', body: half },
		runner.SourceFile{ name: 'b.v', body: half },
	]
	assert runner.validate(files) != ''
}

fn test_pick_main_prefers_main_v() {
	files := [
		runner.SourceFile{ name: 'helper.v', body: '' },
		runner.SourceFile{ name: 'main.v', body: '' },
	]
	assert runner.pick_main(files) == 'main.v'
}

fn test_pick_main_falls_back_to_the_first_file() {
	files := [runner.SourceFile{ name: 'only.v', body: '' }]
	assert runner.pick_main(files) == 'only.v'
}

// The shape below is copied from real V compiler output, because the parser
// is only worth anything if it handles what the compiler actually emits.
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
