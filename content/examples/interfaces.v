module main

// V has no classes. A struct plus methods is the whole of it, and that
// combination is usually enough on its own.
//
// Reach for an interface only when you genuinely need one value to stand in
// for several unrelated types.

struct Dog {
	name string
}

fn (d Dog) speak() string {
	return d.name + ' says woof'
}

struct Cat {
	name    string
	indoors bool
}

fn (c Cat) speak() string {
	if c.indoors {
		return c.name + ' says meow (quietly)'
	}
	return c.name + ' says meow'
}

// An interface is a set of methods. A type implements it by having them, with
// no keyword and nothing to declare.
interface Speaker {
	speak() string
}

// This compiles precisely because Dog and Cat both have `speak`.
fn announce(who Speaker) string {
	return who.speak()
}

fn main() {
	d := Dog{
		name: 'Rex'
	}
	c := Cat{
		name:    'Tom'
		indoors: true
	}

	println(d.speak())
	println(c.speak())

	println(announce(d))
	println(announce(c))

	// A slice of the interface, not of the concrete type.
	mut crowd := []Speaker{}
	crowd << d
	crowd << c
	for who in crowd {
		println('the crowd hears: ' + who.speak())
	}
}
