module main

fn main() {
	// V has a single loop keyword. `for i := 0; i < 3; i++ {}`
	// is the classic counted form.
	for i := 0; i < 3; i++ {
		println(i)
	}

	// `for condition {}` is V's while loop.
	mut n := 0
	for n < 5 {
		n++
	}
	println('n is now ${n}')

	// `for {}` is an infinite loop.
	mut i := 0
	for {
		i++
		if i >= 3 {
			break
		}
	}
	println('i=${i}')

	// `continue` skips to the next iteration.
	mut total := 0
	for k := 0; k < 10; k++ {
		if k % 2 == 0 {
			continue
		}
		total += k
	}
	println('sum of odd numbers below 10: ${total}')
}
