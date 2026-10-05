module main

// A generic struct takes its type parameter in square brackets, like a generic
// function. Each field that mentions `T` is a field of the instantiation, so
// `Stack[string]` has a `[]string` inside it and `Stack[int]` has a `[]int`.
struct Stack[T] {
mut:
	items []T
}

// The receiver carries the type parameter too. `mut` on the receiver is what
// lets a method change the struct, and `&` says it only reads it.
fn (mut s Stack[T]) push(item T) {
	s.items << item
}

fn (mut s Stack[T]) pop() ?T {
	if s.items.len == 0 {
		return none
	}
	return s.items.pop()
}

fn (s &Stack[T]) peek() ?T {
	return s.items.last()
}

fn (s &Stack[T]) len() int {
	return s.items.len
}

// Two type parameters is the other shape, and the two are independent: `A` and
// `B` have no relation to each other, so they can be entirely different types.
struct Pair[A, B] {
mut:
	first  A
	second B
}

fn (p &Pair[A, B]) describe() string {
	return '(${p.first}, ${p.second})'
}

// `A` and `B` being unrelated is also why a method cannot move a value from one
// field to the other: the compiler has no conversion between them to offer.
fn (mut p Pair[A, B]) swap() {
	mut held := p.first
	p.first = p.second
	p.second = held
}

fn main() {
	// Two stacks of different types, from one declaration.
	mut numbers := Stack[int]{}
	numbers.push(1)
	numbers.push(2)
	numbers.push(3)
	println('numbers stack holds ${numbers.len()} items')
	println('popped ${numbers.pop() or { -1 }}')
	println('peeking gives ${numbers.peek() or { -1 }}')

	mut words := Stack[string]{}
	words.push('ada')
	words.push('alan')
	println('words stack popped ${words.pop() or { 'nothing' }}')

	// Popping an empty stack gives none rather than a panic.
	println('popping an empty one: ${words.pop() or { 'nothing' }}')
	println('popping it again: ${words.pop() or { 'nothing' }}')

	// Two parameters, two unrelated types. `describe` only reads, so it is
	// happy with any pair.
	mut p := Pair[string, int]{ first: 'age', second: 36 }
	println('before swap: ${p.describe()}')

	// Two parameters, one type. Here the swap is legal, because both fields
	// hold the same type and so there is a conversion to be made or skipped.
	mut coords := Pair[int, int]{ first: 3, second: 4 }
	coords.swap()
	println('swapped coords: ${coords.describe()}')

	// The same struct, instantiated with two other types again.
	mut entry := Pair[string, []int]{ first: 'scores', second: [1, 2, 3] }
	println('before swap: ${entry.describe()}')
}
