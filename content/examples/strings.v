module main

import strings

fn main() {
	s := 'Hello, World'

	// Strings have methods. They are immutable, so every method here returns a
	// new string rather than changing anything.
	println(s.len)
	println(s.to_lower())
	println(s.to_upper())
	println(s.replace('World', 'V'))
	println(s.split(', '))
	println(s.contains('World'))
	println(s.index('World') or { -1 })
	println(s[7..])

	// A string is a sequence of bytes, so indexing gives a byte and `.len` is
	// a byte count. That is fine for ASCII and wrong for anything else, which
	// is why the rune methods exist.
	println('first byte is ${s[0]}')

	// `.runes()` gives the characters instead, which is what you want for text.
	mut letters := []rune{cap: s.len}
	for r in s.runes() {
		letters << r
	}
	println('rune count is ${letters.len}')

	// A string builder is the efficient way to build a long string.
	mut sb := strings.new_builder(64)
	for i in 1 .. 6 {
		sb.write_string('${i},')
	}
	println(sb.str())

	// Interpolation works for any value, using its `str` method.
	n := 42
	f := 1.5
	println('n=${n} f=${f}')

	// Counting characters is a natural use for a map.
	mut counts := map[rune]int{}
	for r in 'hello'.runes() {
		counts[r] = (counts[r] or { 0 }) + 1
	}
	println(counts)
	println('there are ${counts[`l`] or { 0 }} l characters')
}
