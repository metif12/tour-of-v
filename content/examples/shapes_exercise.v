module main

// Exercise: implement a small shape hierarchy.
//
//  1. Give `Shape` a `name()` method.
//  2. Give `Square` and `Triangle` an `area()` method.
//  3. Make `total_area` add up a slice of shapes, using the interface.
//  4. Write `describe(s Shape)`, which reports a shape's name and area without
//     knowing what shape it is.
//
// Note for part 4: it has to be a function taking the interface, not a method
// on `Base`. An embedded struct inherits the outer type's fields and methods,
// but it does not gain access to the outer type's own methods, so `Base` cannot
// call `area()`.

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

// Given: `Base` is embedded in every shape, so this one method gives them all
// a name without each of them having to write it.
fn (b Base) name() string {
	return b.label
}

fn (s Square) area() f64 {
	return 0.0 // your code here
}

fn (t Triangle) area() f64 {
	return 0.0 // your code here
}

fn describe(s Shape) string {
	return s.name()
}

fn total_area(shapes []Shape) f64 {
	if shapes.len == 0 {
		return 0.0
	}
	return 0.0 // your code here
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
