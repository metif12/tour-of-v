module main

// A method is a function with a receiver. Nothing here is special to V: it is
// the same idea as in most languages, spelled the same way as in V.
struct Counter {
mut:
	n int
}

fn (mut c Counter) inc() {
	c.n++
}

fn (c &Counter) get() int {
	return c.n
}

interface HasArea {
	area() int
}

struct Rect {
mut:
	w int
	h int
}

fn (r &Rect) area() int {
	return r.w * r.h
}

fn main() {
	mut c := Counter{}
	c.inc()
	c.inc()
	println('counter: ${c.get()}')

	rect := Rect{
		w: 3
		h: 4
	}
	println('a 3 by 4 rectangle has area ${rect.area()}')

	// An interface is a list of methods a type promises to have.
	shapes := [HasArea(rect)]
	for s in shapes {
		println('area from the interface: ${s.area()}')
	}
}
