module main

fn main() {
	// Types never change silently. Converting is always explicit.
	i := 42
	f := f64(i) // int -> f64 is allowed
	println(f)

	// Narrowing a float to an int truncates toward zero.
	n := int(3.99)
	println(n)

	// Strings are not numbers; convert deliberately.
	bad := 'not a number'
	println(bad.int())
	println('42'.i64())

	// You can also ask for a type's name.
	println(typeof(i).name)
	println(typeof(f).name)
}
