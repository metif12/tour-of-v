module main

// A stack is generic, so it can be the value type of a map. The map itself is
// not generic: `map[string]Stack[int]` is a single concrete type, with `Stack`
// instantiated at `int` in the value position.
struct Stack[T] {
mut:
	items []T
}

fn (mut s Stack[T]) push(item T) {
	s.items << item
}

fn (s &Stack[T]) items() []T {
	return s.items
}

// The value type has to be spelled with its type arguments. Bare `Stack` is
// missing what it is a stack of, and the compiler says so.
fn main() {
	// One stack per team, keyed by name.
	mut teams := map[string]Stack[int]{}
	for team in ['red', 'blue', 'green'] {
		teams[team] = Stack[int]{}
	}
	teams['red'].push(10)
	teams['red'].push(20)
	teams['blue'].push(7)

	println('red scored ${teams['red'].items()}')
	println('blue scored ${teams['blue'].items()}')
	println('green scored ${teams['green'].items()}')

	// The map is a map, so it has the map methods.
	println('there are ${teams.len} teams')
	println('keys: ${teams.keys()}')

	// A map of a different instantiation is a different type, and mixing them
	// needs one of them to be declared.
	mut words := map[string]Stack[string]{}
	words['greeting'] = Stack[string]{}
	words['greeting'].push('hello')
	println('greeting stack holds ${words['greeting'].items()}')

	// A generic function works over a map whose value type is a generic type,
	// because it only ever calls methods the instantiation has.
	mut total := 0
	for _, stack in teams {
		for score in stack.items() {
			total += score
		}
	}
	println('every team scored ${total}')
}
