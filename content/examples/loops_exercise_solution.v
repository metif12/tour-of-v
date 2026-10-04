module main

// One solution: accumulate with an explicit `for` loop.
// Others are possible, including recursion or a closed form.

fn sum_to(n int) int {
	mut total := 0
	for i in 1 .. n + 1 {
		total += i
	}
	return total
}

fn sum_squares(n int) int {
	mut total := 0
	for i in 1 .. n + 1 {
		total += i * i
	}
	return total
}

fn main() {
	println(sum_to(4)) // 10
	println(sum_to(100))
	println(sum_squares(4)) // 30
	println(sum_squares(100))
}
