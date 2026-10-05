module runner_test

import runner

// Formatting is the one thing this project does to untrusted source in the
// server process rather than in a sandbox, because `v fmt` cannot run in a box.
// These tests are the safety net for that decision: they are the inputs that
// crash parsers.

// fmt_ok formats input that is expected to be valid V and asserts success.
fn fmt_ok(body string) string {
	out, reason := runner.format_source('main.v', body)
	assert reason == ''
	return out
}

// fmt_survives formats input that may or may not be valid and asserts only that
// the call returns.
//
// This is the property that matters for the crash shapes. In process formatting
// means a parser crash would take down the server rather than one sandbox box,
// so what has to hold is that the call comes back at all. Whether the result is
// formatted text or a "cannot be formatted yet" message is a separate question,
// and for genuine garbage the message is the correct answer.
fn fmt_survives(body string) {
	_, _ := runner.format_source('main.v', body)
}

fn test_format_produces_the_same_layout_v_fmt_would() {
	got := fmt_ok('fn  main( ){\n   x:=3\n  println( x )\n}')
	assert got == 'fn main() {\n\tx := 3\n\tprintln(x)\n}\n'
}

fn test_format_reindents_a_struct() {
	got := fmt_ok('struct  Point{ mut:\nx int\n   y int\n}')
	assert got.contains('struct Point {')
	assert got.contains('mut:')
	assert got.contains('\tx int')
	assert got.contains('\ty int')
}

fn test_format_adds_spaces_around_operators() {
	assert fmt_ok('fn f() int { return 1+2 }').contains('1 + 2')
}

fn test_format_is_idempotent() {
	once := fmt_ok('fn  main( ){println("x")}')
	twice := fmt_ok(once)
	assert once == twice
}

fn test_format_keeps_vfmt_off_regions_alone() {
	body := '// vfmt off\nfn    weird(   ) {}\n// vfmt on\nfn    tidy(   ) {}\n'
	got := fmt_ok(body)
	// The region between the markers is left exactly as it was written, which is
	// the whole point of the markers.
	assert got.contains('fn    weird(   ) {}')
	// And the code outside them is still formatted.
	assert got.contains('fn tidy() {}')
}

fn test_format_reports_a_parse_error_instead_of_mangling() {
	_, reason := runner.format_source('main.v', 'fn main() { println("x")')
	assert reason != ''
	assert reason.contains('cannot be formatted')
}

// The inputs below are the ones that have historically crashed V's parser. None
// of them may take the process down, because in process formatting means a
// parser crash takes down every visitor's request rather than one sandbox box.
// Several of them are also genuine syntax errors, so an explanatory message is
// the right outcome and only the return is asserted.

fn test_format_survives_input_that_is_not_v() {
	fmt_survives('this is not V code at all !!! ???')
	fmt_survives('+')
	fmt_survives('}}}}{')
	fmt_survives('/*')
}

fn test_format_survives_empty_and_whitespace() {
	assert fmt_ok('') == ''
	assert fmt_ok('   \n\n\t\n') == ''
}

fn test_format_survives_a_comment_with_no_code() {
	fmt_ok('// just a comment')
	fmt_ok('/* block */')
}

fn test_format_survives_raw_non_utf8_bytes() {
	// Written with escapes so this file stays ASCII.
	fmt_survives('\x00\x01\x02 not text \xff\xfe')
}

fn test_format_survives_deep_nesting() {
	// Sixty levels, which is well past anything a person writes and into the
	// range that has overflowed recursive descent parsers before.
	body := 'fn main() { ' + 'if true {'.repeat(60) + 'println(1)' + '}'.repeat(60) + ' }'
	fmt_survives(body)
}

fn test_format_survives_a_very_long_line() {
	fmt_ok('fn main() { println("' + 'x'.repeat(20000) + '") }')
}

fn test_format_survives_unicode_in_strings() {
	assert fmt_ok('fn main() { println("سلام") }').contains('سلام')
}

// A program the parser cannot read is reported rather than half-formatted. A
// learner who presses Format on code that does not compile yet should be told
// where it breaks, not handed back mangled text.

fn test_format_reports_a_parse_error_rather_than_mangling() {
	_, reason := runner.format_source('main.v', 'fn main() { println("x")')
	assert reason.contains('cannot be formatted')
	// Which line is reported is the parser's business; that a line is reported at
	// all is ours, because a bare "cannot format" sends the reader hunting.
	assert reason.contains('line ')
}

fn test_format_reports_unexpected_characters() {
	_, reason := runner.format_source('main.v', '\x00\x01\x02 not text \xff')
	assert reason.contains('cannot be formatted')
}
