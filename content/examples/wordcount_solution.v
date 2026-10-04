module main

// One solution: split on whitespace, keep only the letters from each token,
// lower case it, and count it.
//
// `is_letter` is deliberately ASCII only, because iterating a V string yields
// bytes. The `unicode` module has `is_letter`, which handles every script, and
// that is the better answer for real text once this works.

fn is_letter(c u8) bool {
	return (c >= `a` && c <= `z`) || (c >= `A` && c <= `Z`)
}

fn word_count(text string) map[string]int {
	mut counts := map[string]int{}

	for token in text.fields() {
		mut buf := []u8{cap: token.len}
		for c in token {
			if is_letter(c) {
				buf << c
			}
		}
		if buf.len == 0 {
			continue
		}
		word := buf.bytestr().to_lower()
		counts[word] = (counts[word] or { 0 }) + 1
	}

	return counts
}

fn main() {
	println(word_count('the quick brown fox jumps over the lazy dog the fox'))
	println(word_count(''))
	println(word_count('Hello, hello, HELLO!'))

	// A map has no inherent order, so the words come out in whatever order the
	// runtime walks them. When the order matters, collect the pairs into a
	// slice of structs and sort that instead.
	counts := word_count('a b b c c c')
	mut words := []string{cap: counts.len}
	for w, _ in counts {
		words << w
	}
	for w in words {
		println('${w}: ${counts[w]}')
	}
}
