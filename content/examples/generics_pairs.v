module main

// A generic function can take a callback as an argument. The callback's type is
// written with `fn`, so the compiler checks the function body against it.
fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out << f(item)
	}
	return out
}

// Two parameters, and the second one is the callback. The key type never
// appears in the body: it only has to be a type the map can hold.
//
// The loop writes `for _, v in m`. A bare underscore is the way to skip the
// key. A name like `_k` is refused: "variable name `_k` cannot start with `_`".
fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _, v in m {
		sum += value_of(v)
	}
	return sum
}

// A generic function returning a generic type is the other shape worth seeing.
fn first_map[K, V](m map[K]V) ?V {
	for _, v in m {
		return v
	}
	return none
}

fn main() {
	nums := [1, 2, 3, 4]

	// One function, three instantiations, decided by the callback.
	println(apply(nums, fn (n int) int { return n * n }))
	println(apply(nums, fn (n int) bool { return n % 2 == 0 }))
	println(apply(nums, fn (n int) string { return 'n is ${n}' }))

	// The map's key type is unconstrained, so an int-keyed map works too.
	ages := {
		'ada':  36
		'alan': 41
	}
	println('ages total ${total_of(ages, fn (n int) int { return n })}')

	prices := {
		'bread':  4
		'milk':   2
		'cheese': 9
	}
	println('prices total ${total_of(prices, fn (p int) int { return p })}')

	// `first_map` returns an option, because an empty map has no first value.
	println(first_map[string, int](ages) or { 0 })
	println(first_map[string, int](map[string]int{}) or { 0 })
}
