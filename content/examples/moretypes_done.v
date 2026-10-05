module main

struct Point {
	x int
	y int
}

fn (p Point) sum() int {
	return p.x + p.y
}

fn main() {
	points := [Point{ x: 1, y: 2 }, Point{ x: 3, y: 4 }]
	mut total := 0
	for p in points {
		total += p.sum()
	}
	println('points: ${points} sum to ${total}')

	// An array has a fixed length, a slice does not.
	mut names := ['ada', 'grace', 'alan']
	names << 'edsger'
	println('names: ${names}, length ${names.len}')

	mut ages := map[string]int{}
	ages['ada'] = 36
	ages['grace'] = 45
	println('ages: ${ages}')
}
