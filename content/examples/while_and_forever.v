module main

fn main() {
	// `for` with only a condition is V's while loop.
	mut sum := 1
	mut count := 0
	for sum < 1000 {
		sum *= 2
		count++
	}
	println('sum=${sum} after ${count} doublings')

	// `for {}` with no condition never stops on its own.
	mut i := 0
	for {
		i++
		if i >= 3 {
			break
		}
	}
	println('i=${i}')
}
