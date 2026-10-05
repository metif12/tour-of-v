module main

// Solution: write these four, using type parameters throughout.
//
//  1. `index_of[T]` returns the position of `target` in `items`, or -1 when it
//     is not there. It works on any type that supports `==`.
//  2. `count_matching[T]` counts how many items satisfy a predicate. The
//     predicate arrives as a callback, so its type is written with `fn`.
//  3. `Counter[K]` is a generic struct holding a count per key. Give it `add`
//     and `get`, and note that `K` is used inside another generic type: a map
//     whose key type is the type parameter.
//  4. `grand_total[K, V]` adds up a map of counters, weighting each count by
//     `value_of` of its key. Two type parameters, and the value type is
//     `Counter[V]` with its own argument spelled out.
//
// Hints: a type parameter goes in square brackets: `fn index_of[T](...)`.
// Methods carry it too: `fn (mut c Counter[K]) add(k K, n int)`. A map field
// needs its own brackets: `map[K]int`.

fn index_of[T](items []T, target T) int {
	for i, item in items {
		if item == target {
			return i
		}
	}
	return -1
}

fn count_matching[T](items []T, predicate fn (T) bool) int {
	mut n := 0
	for item in items {
		if predicate(item) {
			n++
		}
	}
	return n
}

struct Counter[K] {
mut:
	counts map[K]int
}

// `K` is a map key here, which is why the map has to be built before it is
// written to. A struct literal with an empty map is not enough.
fn (mut c Counter[K]) add(key K, n int) {
	c.counts[key] = c.counts[key] + n
}

fn (c &Counter[K]) get(key K) int {
	return c.counts[key] or { 0 }
}

// Two type parameters, and a generic struct as the map's value type. `K` is
// never used in the body, only in the signature, which is allowed and is what
// makes the function work for any key type.
fn grand_total[K, V](counters map[K]Counter[V], value_of fn (V) int) int {
	mut sum := 0
	for _, counter in counters {
		for key, n in counter.counts {
			sum += n * value_of(key)
		}
	}
	return sum
}

fn main() {
	println(index_of(['a', 'b', 'c'], 'b'))
	println(index_of(['a', 'b', 'c'], 'z'))
	println(index_of([10, 20, 30], 30))

	println(count_matching([1, 2, 3, 4, 5], fn (n int) bool { return n % 2 == 0 }))
	println(count_matching(['one', 'two'], fn (s string) bool {
		return s.len > 3
	}))

	mut hits := Counter[string]{}
	hits.add('/', 12)
	hits.add('/', 5)
	hits.add('/about', 3)
	println('hits on /: ${hits.get('/')}')
	println('hits on /docs: ${hits.get('/docs')}')

	mut words := Counter[string]{}
	for w in ['alpha', 'beta', 'apple', 'avocado', 'bus'] {
		words.add(w, 1)
	}

	// Grouped by the first letter. The map's value type is `Counter[string]`,
	// so `V` in the signature is `string` and `K` is `string`.
	mut by_letter := map[string]Counter[string]{}
	for w in ['alpha', 'beta', 'apple', 'avocado', 'bus'] {
		letter := w[0..1]
		if letter !in by_letter {
			by_letter[letter] = Counter[string]{}
		}
		by_letter[letter].add(w, 1)
	}
	println('grouped under: ${by_letter.keys()}')

	println('total weighted by length: ' +
		'${grand_total(by_letter, fn (s string) int { return s.len })}')
}
