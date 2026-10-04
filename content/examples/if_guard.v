module main

fn parse(s string) !int {
	// `!` marks a return type that can fail.
	// `error(...)` produces a value of that return type.
	if s.len == 0 {
		return error('empty input')
	}
	return s.int()
}

fn main() {
	// An `if` guard can unwrap a `!` or `?` type inline.
	if v := parse('42') {
		println('parsed ${v}')
	} else {
		println('failed: ${err}')
	}

	if v := parse('nonsense') {
		println('parsed ${v}')
	} else {
		println('failed: ${err}')
	}
}
