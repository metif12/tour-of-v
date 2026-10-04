module main

struct Point {
	x int
	y int
}

fn main() {
	// The zero value of every type is what you get before assigning.
	i := 0
	f := 0.0
	b := false
	s := ''
	arr := []int{}
	m := map[string]int{}

	p := Point{}

	println(i)
	println(f)
	println(b)
	println('${s} (length ${s.len})')
	println(arr)
	println(m)
	println('${p.x}, ${p.y}')
}
