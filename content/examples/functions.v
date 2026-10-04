module main

// A function is declared with `fn`.
// Parameters are grouped by type: `name, name2 Type`.

fn add(x int, y int) int {
	return x + y
}

fn swap(a string, b string) (string, string) {
	return b, a
}

fn main() {
	println(add(2, 3))

	x, y := swap('hello', 'world')
	println(x)
	println(y)
}
