module main

struct Point {
mut:
	x int
	y int
}

// A method is declared with a receiver: the value it is called on.
// This receiver is a copy, so the method cannot change the original.
fn (p Point) sum() int {
	return p.x + p.y
}

// A receiver declared with `&` is a reference, so the method can change the
// original. To write through it, the receiver itself must be `mut` as well.
fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
	p.y += dy
}

fn main() {
	mut p := Point{
		x: 3
		y: 4
	}
	println('sum is ${p.sum()}')

	// A method that writes through the pointer receiver changes the original.
	p.shift(1, 1)
	println('after shift: ${p.x}, ${p.y}')

	p.shift(2, 3)
	println('after another shift: ${p.x}, ${p.y}')

	// The original is now changed too, because the method had a reference.
	println(p)
}
