module main

fn abs(x f64) f64 {
	if x < 0 {
		return -x
	}
	return x
}

fn classify(n int) string {
	if n < 0 {
		return 'negative'
	} else if n == 0 {
		return 'zero'
	} else if n < 10 {
		return 'small'
	}
	return 'large'
}

fn main() {
	println(abs(-3.5))
	println(abs(3.5))
	println(classify(-1))
	println(classify(0))
	println(classify(5))
	println(classify(500))
}
