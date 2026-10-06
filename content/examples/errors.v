module main

// `x.json2` is the path; the name you use is still `json2`. The V 0.5.2
// release that compiles programs in the sandbox moved the module, and a bare
// `import json2` fails there with "cannot import module" even though it works
// when the tour itself is built.
import x.json2

// `!T` means a value or a failure.
fn parse_int(s string) !int {
	n := s.int()
	if n == 0 && s != '0' {
		return error('"${s}" is not a number')
	}
	return n
}

// Returning an error needs no unwrapping: V wraps the plain value.
fn parse_pair(a string, b string) !(int, int) {
	return parse_int(a)!, parse_int(b)!
}

// Errors carry a message, and `err` is bound in the else branch.
fn describe(s string) string {
	if n := parse_int(s) {
		return 'ok, ${n}'
	} else {
		return 'failed: ${err.msg()}'
	}
}

fn main() {
	println(describe('42'))
	println(describe('nope'))
	println(describe('0'))

	// The error message can be inspected.
	if n := parse_int('x') {
		println('unreachable, ${n}')
	} else {
		println('message is: ${err.msg()}')
	}

	// `!` propagates a failure out of the calling function unchanged, which
	// is why parse_pair can forward both halves without checking them.
	if a, b := parse_pair('1', '2') {
		println('${a} and ${b}')
	} else {
		println('failed: ${err.msg()}')
	}

	if a, b := parse_pair('1', 'oops') {
		println('${a} and ${b}')
	} else {
		println('failed: ${err.msg()}')
	}

	// Decoding reports its own errors, including the position in the input.
	good := '{"name":"V","year":2026}'
	if doc := json2.decode[Doc](good, json2.DecoderOptions{}) {
		println('${doc.name} from ${doc.year}')
	} else {
		println('bad json: ${err.msg()}')
	}

	bad := '{"name":42}'
	if doc := json2.decode[Doc](bad, json2.DecoderOptions{}) {
		println('${doc.name}')
	} else {
		println('bad json: ${err.msg()}')
	}
}

// Doc is the shape the JSON above has.
struct Doc {
	name string
	year int
}
