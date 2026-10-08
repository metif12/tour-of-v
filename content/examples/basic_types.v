module main

fn main() {
	// Booleans
	_ := true
	_ := false

	// Integers, explicitly sized
	_ := i8(0)
	_ := i16(0)
	_ := i32(0)
	_ := i64(0)

	// Unsigned integers
	_ := u8(0)
	_ := u32(0)
	_ := u64(0)

	// Floating point
	_ := f32(0.0)
	_ := f64(0.0)

	// A rune holds a Unicode code point
	b := u8(65)
	r := `A`
	println(b)
	println(r)

	// Strings
	s := 'V is pleasant'

	println(s)
	println(s.len)
	println(s[0])
}
