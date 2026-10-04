module main

// A struct can embed another struct, which copies its fields into this one
// and brings its methods with them.
struct Base {
	id int
}

fn (b Base) describe() string {
	return 'base ${b.id}'
}

struct User {
	Base
	name string
}

struct Post {
	Base
	title string
}

// Embedding an interface is also allowed, which is how a type substitutes
// behaviour for a field.
struct Logger {
mut:
	lines []string
}

fn (mut l Logger) log(s string) {
	l.lines << s
}

struct Service {
	Logger
	name string
}

fn (mut s Service) run() {
	s.log('starting ' + s.name)
	s.log('stopping ' + s.name)
}

// The standard library prints a struct with `str` rather than with reflection,
// so a `str` method is how a type controls how it appears.
struct Temperature {
	celsius f64
}

fn (t Temperature) str() string {
	return '${t.celsius:.1f}C'
}

struct Pair {
	a int
	b int
}

fn (p Pair) str() string {
	return '(${p.a}, ${p.b})'
}

fn main() {
	u := User{
		Base: Base{
			id: 7
		}
		name: 'Ada'
	}
	println(u.id)
	println(u.name)
	println(u.describe())

	p := Post{
		Base:  Base{
			id: 7
		}
		title: 'hello'
	}
	println(p.describe())

	mut svc := Service{
		name: 'api'
	}
	svc.run()
	println(svc.lines)

	println(Temperature{ celsius: 21.456 })
	println(Pair{
		a: 1
		b: 2
	})

	// Interpolation uses the same `str` method.
	again := Pair{
		a: 3
		b: 4
	}
	println('interpolated: ${again}')
}
