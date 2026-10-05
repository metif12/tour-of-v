module main

// A generic function is written once, with a type parameter in square
// brackets. V does not use angle brackets here: `fn max_of<T>(...)` is a parse
// error, not a different syntax.
fn max_of[T](a T, b T) T {
	return if a > b { a } else { b }
}

// A type parameter can also be used for the return type alone, which is how a
// function picks the element type of a collection from its input.
fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}

// Two parameters are enough to build the pipeline shapes: one for the input, one
// for the output. `fn` is spelled out, rather than `f`, so the callback type is
// obvious at the call site.
fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out << f(item)
	}
	return out
}

fn main() {
	// The type argument is worked out from the arguments.
	println('two ints: ${max_of(3, 7)}')
	println('two strings: ${max_of('apple', 'pear')}')

	// Inference reads a variable too, not only a literal.
	n := 42
	println('from a variable: ${max_of(n, 7)}')

	// A `?T` in the return position means the same thing it always has.
	println(first_item([10, 20, 30]) or { -1 })
	println(first_item([]int{}) or { -1 })

	// A generic function is instantiated separately for each argument type it
	// is handed, which is what makes this one function do the work of two.
	nums := [1, 2, 3, 4]
	words := ['one', 'two', 'three']
	println(apply(nums, fn (n int) int { return n * n }))
	println(apply(words, fn (w string) string { return w.to_upper() }))
	println(apply(nums, fn (n int) string { return '${n} items' }))
}
