module main

// Exercise: implement the classic Word Count exercise.
//   - Count how many times each word appears in a string.
//   - Words are separated by anything that is not a letter.
//   - The result must not depend on the case of the letters.
//
// Use a `map[string]int`.
//
// Hints:
//   - `text.fields()` splits on whitespace.
//   - Iterating a string yields bytes, so `c >= 'a' and c <= 'z'` is a test for
//     a lower case ASCII letter.
//   - A `[]u8` becomes a string with `.bytestr()`, and `.to_lower()` on that
//     string finishes the job.
//   - When a map lookup may be missing, `(counts[word] or { 0 })` gives you the
//     count or a zero to start from.

fn word_count(text string) map[string]int {
	if text.len == 0 {
		return {}
	}
	return {} // your code here
}

fn main() {
	println(word_count('the quick brown fox jumps over the lazy dog the fox'))
	println(word_count(''))
	println(word_count('Hello, hello, HELLO!'))
}
