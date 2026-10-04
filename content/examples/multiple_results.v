module main

// Multiple results are returned as a tuple.
fn min_max(values []int) (int, int) {
	mut lo := values[0]
	mut hi := values[0]
	for v in values {
		if v < lo {
			lo = v
		}
		if v > hi {
			hi = v
		}
	}
	return lo, hi
}

fn main() {
	nums := [7, 2, 9, 4, 1]
	lo, hi := min_max(nums)
	println('smallest: ${lo}')
	println('largest:  ${hi}')
}
