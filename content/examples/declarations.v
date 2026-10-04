module main

fn main() {
	// `:=` declares the variable and infers its type from the value.
	a := 10
	b := 3.5
	c := 'V'
	d := [1, 2, 3]

	println(a)
	println(b)
	println(c)
	println(d)

	// The declaration can be explicit about the type instead.
	e := i64(42)
	f := f64(1.5)
	println(e + 1)
	println(f * 2)
}
