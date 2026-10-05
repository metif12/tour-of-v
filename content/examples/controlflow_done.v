module main

// The three ways of repeating something.
fn main() {
	// A condition, once.
	age := 3
	if age > 2 {
		println('three is more than two')
	} else {
		println('three is not more than two')
	}

	// A counted loop.
	mut total := 0
	for i in 1 .. 5 {
		total += i
	}
	println('1 + 2 + 3 + 4 = ${total}')

	// A loop over something.
	words := ['if', 'for', 'match']
	for w in words {
		println('  ${w}')
	}

	// A match on the value.
	match total {
		10 { println('that is ten') }
		else { println('that is ${total}') }
	}
}
