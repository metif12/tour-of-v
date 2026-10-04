module main

fn main() {
	// An array has a fixed length, and its element type comes from the first
	// value.
	mut numbers := [3, 4, 5]
	numbers[0] = 1
	println(numbers)
	println('length is ${numbers.len}')

	// An array can be given a length up front, with a default value.
	mut zeros := []int{len: 4, init: 0}
	println(zeros)
	zeros[2] = 9
	println(zeros)

	// clone makes an independent duplicate. It is worth reaching for whenever two
	// values must not share their contents, because it says so at the point
	// of use rather than relying on a rule you have to remember.
	mut duplicate := numbers.clone()
	duplicate[0] = 100
	println('original first element: ${numbers[0]}')
	println('copied first element:    ${duplicate[0]}')

	// The usual operations work on arrays.
	println(numbers.map(it * 2))
	println(numbers.filter(it > 1))
	mut total := 0
	for n in numbers {
		total += n
	}
	println('sum: ' + total.str())
}
