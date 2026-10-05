module main

// A struct can print itself, because any type may say how it looks when it is
// printed with `println`. The convention is a method called `str`.
struct Point {
	x int
	y int
}

fn (p Point) str() string {
	return '(${p.x}, ${p.y})'
}

fn main() {
	p := Point{
		x: 3
		y: 4
	}
	// `println(p)` would print the fields. Because Point has a `str` method,
	// it prints this instead.
	println(p)
	println('distance from the origin is about 5, and the point is ${p}')
}
