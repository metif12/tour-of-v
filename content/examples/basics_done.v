module main

// The basic types, all in one place.
fn main() {
	an_int := 42
	a_float := 3.14
	a_bool := true
	a_string := 'hello'
	a_char := `v`

	println('int:    ${an_int}')
	println('float:  ${a_float}')
	println('bool:   ${a_bool}')
	println('string: ${a_string}, length ${a_string.len}')
	// A character is a rune, and `int` is how you see its code point.
	println('char:   ${a_char}, code ${int(a_char)}')
	println('array:  ${[1, 2, 3]}')
}
