module main

// Exercise: write these three, each returning an option.
//
//  1. `second_largest` takes a slice of ints and returns the second largest
//     distinct value, or none when there is not one.
//  2. `first_word` takes a string and returns its first word, or none for an
//     empty string.
//  3. `sum_all` takes a slice of options and returns an int, skipping the ones
//     that are none.
//
// Then write `describe_all`, which returns an option of a string summarising
// the input. Use `?` propagation so it does not need to unwrap anything by
// hand.
//
// Hints: `text.fields()` gives the words. `v or { 0 }` turns an option into a
// value you can use. A trailing `?` on a call returns none straight out of the
// function it appears in.

fn second_largest(values []int) ?int {
	if values.len == 0 {
		return none
	}
	return none // your code here
}

fn first_word(text string) ?string {
	if text.trim_space() == '' {
		return none
	}
	return none // your code here
}

fn sum_all(values []?int) int {
	if values.len == 0 {
		return 0
	}
	return 0 // your code here
}

fn describe_all(values []int) ?string {
	if values.len == 0 {
		return none
	}
	return none // your code here
}

fn main() {
	println(second_largest([]))
	println(second_largest([5]))
	println(second_largest([5, 5]))
	println(second_largest([1, 9, 3]))

	println(first_word(''))
	println(first_word('  the quick brown fox '))

	println(sum_all([?int(1), none, ?int(3), ?int(4)]))
	println(sum_all([]))

	println(describe_all([]))
	println(describe_all([1, 9, 3]))
}
