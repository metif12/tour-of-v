module main

fn main() {
	// A slice is a view onto a range of an array or another slice.
	arr := [1, 2, 3, 4, 5]
	part := arr[1..3]
	println('slice is ${part}, length ${part.len}')

	// A slice can grow with `<<`, which may have to move it, so the variable
	// must be `mut`.
	mut words := []string{}
	words << 'hello'
	words << 'world'
	println(words)
	println('length is ${words.len}')

	// Slices can be sliced again, and cloned to become independent.
	mut first := words[..1].clone()
	println('first word: ${first}')

	first[0] = 'goodbye'
	println('words is unchanged: ${words}')

	// A range is `..` for loops and exclusive, which is worth remembering
	// because ranges inside `match` are written with `...` and inclusive.
	for i in 0 .. words.len {
		println('${i}: ${words[i]}')
	}

	// A slice knows its own length, so appending is safe.
	mut numbers := []int{}
	for n in 1 .. 6 {
		numbers << n * n
	}
	println('squares: ${numbers}')
}
