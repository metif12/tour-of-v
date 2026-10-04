module main

// One set of answers.
//
// Note that `Base` never mentions `Square` or `Triangle`. It knows the
// interface and nothing else, which is the whole reason the last part works.

struct Base {
	label string
}

struct Square {
	Base
	side f64
}

struct Triangle {
	Base
	base   f64
	height f64
}

interface Shape {
	name() string
	area() f64
}

// Embedded in every shape, so one method gives them all a name.
fn (b Base) name() string {
	return b.label
}

fn (s Square) area() f64 {
	return s.side * s.side
}

fn (t Triangle) area() f64 {
	return 0.5 * t.base * t.height
}

// A free function taking the interface, not a method on Base. An embedded
// struct inherits the outer type's fields and methods, but it does not gain
// access to the outer type's own methods, so Base cannot call area(). Passing
// the interface is what lets one function describe every shape.
fn describe(s Shape) string {
	return '${s.name()} covers ${s.area():.1f}'
}

fn total_area(shapes []Shape) f64 {
	mut total := 0.0
	for s in shapes {
		total += s.area()
	}
	return total
}

fn main() {
	shapes := [
		Shape(Square{
			Base: Base{
				label: 'big square'
			}
			side: 3.0
		}),
		Shape(Triangle{
			Base:   Base{
				label: 'triangle'
			}
			base:   4.0
			height: 5.0
		}),
	]

	for s in shapes {
		println('${s.name()} has area ${s.area()}')
	}

	println('total ${total_area(shapes)}')

	for s in shapes {
		println(describe(s))
	}
}
