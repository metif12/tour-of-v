module main

struct Circle {
	radius int
}

struct Square {
	side int
}

struct Point {
	x int
	y int
}

// A sum type is declared with `=` and a list of alternatives.
type Shape = Circle | Square | Point

// Inside a match over a sum type, the original variable is smart cast to
// the variant of the current arm, so `shape.radius` just works.
fn area(shape Shape) f64 {
	match shape {
		Circle {
			return 3.141592653589793 * f64(shape.radius * shape.radius)
		}
		Square {
			return f64(shape.side * shape.side)
		}
		Point {
			return 0.0
		}
	}
}

fn describe(shape Shape) string {
	mut out := ''
	match shape {
		Circle { out = 'a circle' }
		Square { out = 'a square' }
		Point { out = 'a point' }
	}
	return out
}

fn main() {
	shapes := [
		Shape(Circle{ radius: 2 }),
		Shape(Square{ side: 3 }),
		Shape(Point{ x: 1, y: 2 }),
	]

	for s in shapes {
		println('${describe(s)} with area ${area(s):.3f}')
	}
}
