module main

// A struct groups values under one name.
//
// Fields are immutable unless declared under `mut`, on the same principle as
// ordinary variables: changing something is something you have to mean.
struct Point {
mut:
	x int
	y int
}

fn main() {
	p := Point{
		x: 3
		y: 4
	}
	println(p.x)
	println(p.y)

	// Read a field by name after the type.
	q := Point{ x: 1, y: 2 }
	println('${q.x}, ${q.y}')

	// Structs are copied by value, like any other value. Mutating the copy
	// leaves the original alone.
	mut r := p
	r.x = 100
	println('original x is still ${p.x}')
	println('copy x is now ${r.x}')

	// A struct can print itself.
	println(p)
}
