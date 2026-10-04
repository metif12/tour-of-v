module main

// Exercise:
//   1. `sum_to` should return 0 + 1 + ... + n.
//   2. `sum_squares` should return 0^2 + 1^2 + ... + n^2.
// Then rewrite both of them to use an explicit `for` loop rather than
// any shortcut you can think of.

fn sum_to(n int) int {
	if n <= 0 {
		return 0
	}
	return n // your code here
}

fn sum_squares(n int) int {
	if n <= 0 {
		return 0
	}
	return n // your code here
}

fn main() {
	println(sum_to(4)) // want 10
	println(sum_to(100))
	println(sum_squares(4)) // want 30
	println(sum_squares(100))
}
