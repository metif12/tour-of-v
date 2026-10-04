module main

// One set of answers.
//
// The shape of all of them is the same: do the work, and if there is nothing
// to return, return none. Nothing has to be unwrapped along the way.

fn second_largest(values []int) ?int {
	if values.len == 0 {
		return none
	}

	// One pass, tracking the largest seen and the largest seen below it.
	// `found` distinguishes "the second value so far" from "nothing yet",
	// which is why a plain zero would not do: zero is a legitimate answer.
	mut best := values[0]
	mut second := 0
	mut found := false

	for v in values {
		if v > best {
			second = best
			best = v
			found = true
		} else if v < best && (!found || v > second) {
			second = v
			found = true
		}
	}

	// A repeated largest is not a second distinct value, so [5, 5] has none.
	if !found {
		return none
	}
	return second
}

fn first_word(text string) ?string {
	fields := text.fields()
	if fields.len == 0 {
		return none
	}
	return fields[0]
}

fn sum_all(values []?int) int {
	mut total := 0
	for v in values {
		// `or { 0 }` turns the none case into something usable.
		total += v or { 0 }
	}
	return total
}

// The `?` after each call returns none straight out of this function, so no
// unwrapping by hand appears anywhere in the body.
fn describe_all(values []int) ?string {
	if values.len == 0 {
		return none
	}
	largest := second_largest(values)?
	return 'second largest of ' + largest.str() + ' among ' + values.len.str() + ' values'
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
