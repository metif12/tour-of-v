module main

// A generic function is written once and works for any type that fits. V spells
// generics with square brackets.
fn max_of[T](a T, b T) T {
	return if a > b { a } else { b }
}

// A generic struct is written the same way.
struct Stack[T] {
mut:
	items []T
}

fn (mut s Stack[T]) push(item T) {
	s.items << item
}

fn (s &Stack[T]) pop() ?T {
	if s.items.len == 0 {
		return none
	}
	return s.items.pop()
}

fn main() {
	println('max of two ints:    ${max_of(3, 7)}')
	println('max of two strings: ${max_of('apple', 'pear')}')

	mut numbers := Stack[int]{}
	numbers.push(1)
	numbers.push(2)
	println('popped an int: ${numbers.pop() or { -1 }}')

	mut names := Stack[string]{}
	names.push('ada')
	println('popped a string: ${names.pop() or { 'nothing' }}')
}
