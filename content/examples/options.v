module main

// A function returning `?T` returns a value or none.
fn find_user(id int) ?string {
	if id == 1 {
		return 'Ada'
	}
	if id == 2 {
		return 'Alan'
	}
	return none
}

fn main() {
	// Assigning an option gives you the value or none.
	a := find_user(1)
	println(a or { 'nobody' })

	b := find_user(9)
	println(b or { 'nobody' })

	// An `if` unwraps it, and `none` means the else branch.
	if name := find_user(2) {
		println('found ${name}')
	} else {
		println('not found')
	}

	if name := find_user(9) {
		println('found ${name}')
	} else {
		println('not found')
	}

	// Options compose. A function returning `?int` can return one from a
	// function returning `?string` without unpacking it by hand.
	//
	// Printing an option shows which half of it you have.
	println(length_of(find_user(1)))
	println(length_of(find_user(9)))

	// Unwrapping it reads as it would for any other option.
	println(length_of(find_user(1)) or { -1 })
	println(length_of(find_user(9)) or { -1 })
}

// An option returning function can return another option directly.
fn length_of(name ?string) ?int {
	// `?` after a call propagates none straight out of this function.
	n := name?.len
	return n
}
