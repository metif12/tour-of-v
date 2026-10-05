module main

// The closing example puts the whole lesson in one program: a generic function
// with a callback, a generic struct, and that struct used as a map's value type.

// A generic function, with the callback written as `fn (T) R`.
fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out << f(item)
	}
	return out
}

// A generic struct. `T` is the element type of the slice it holds.
struct Stack[T] {
mut:
	items []T
}

fn (mut s Stack[T]) push(item T) {
	s.items << item
}

fn (s &Stack[T]) peek() ?T {
	return s.items.last()
}

// A function over a map whose value type is the generic struct. The type
// arguments are spelled out in the signature: `map[string]Stack[int]`.
fn total_of[T](stacks map[string]Stack[T]) int {
	mut sum := 0
	for _, stack in stacks {
		for item in stack.items {
			sum += item
		}
	}
	return sum
}

fn main() {
	println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
	println(apply(['a', 'bb', 'ccc'], fn (s string) int { return s.len }))

	mut nums := Stack[int]{}
	nums.push(1)
	nums.push(99)
	mut words := Stack[string]{}
	words.push('hello')
	words.push('goodbye')

	// Two stacks of different types, from one declaration.
	println('nums holds ${nums.items}, peeking at ${nums.peek() or { -1 }}')
	println('words holds ${words.items}, peeking at ${words.peek() or { 'nothing' }}')

	// The same struct, instantiated inside a map's value type.
	mut by_name := map[string]Stack[int]{}
	by_name['nums'] = nums
	by_name['more'] = Stack[int]{}
	by_name['more'].push(7)
	println('the map holds ${by_name.keys()}')
	println('nums through the map: ${by_name['nums'].items}')
	println('everything in the map sums to ${total_of(by_name)}')
}
