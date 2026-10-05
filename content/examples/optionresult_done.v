module main

import strconv

fn find(names []string, want string) ?int {
	for i, n in names {
		if n == want {
			return i
		}
	}
	return none
}

// `!` is a Result: it either holds a value or an error. This one fails on
// anything that is not a number, which is what makes it different from `.int()`.
fn parse_age(text string) !int {
	return strconv.atoi(text)!
}

fn main() {
	names := ['ada', 'grace', 'alan']

	// `?Option` is a value that might be absent. There are three ways to ask.
	if i := find(names, 'grace') {
		println('if form: grace is at index ${i}')
	} else {
		println('if form: not found')
	}

	println('or form: ${find(names, 'nobody') or { -1 }}')

	match find(names, 'nobody') {
		none { println('match: nobody is absent') }
		else { println('match: somebody is present') }
	}

	// A good parse hands back the value, a bad one hands back the fallback, and
	// neither is a crash.
	println('parsed:   ${parse_age('45') or { -1 }}')
	println('unparsed: ${parse_age('not a number') or { -1 }}')
}
