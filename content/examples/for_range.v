module main

fn main() {
	nums := [10, 20, 30, 40, 50]

	// `for i, v in xs` gives both the index and the value.
	for i, v in nums {
		println('index ${i}: ${v}')
	}

	// Ignore the index with `_`.
	for _, v in nums {
		println(v)
	}

	// Arrays and slices have a length, so `range` works too.
	for i in 0 .. nums.len {
		println('${i} -> ${nums[i]}')
	}

	// Maps iterate key-value pairs.
	ages := {
		'Ada':  36
		'Alan': 41
	}
	for name, age in ages {
		println('${name} is ${age}')
	}
}
