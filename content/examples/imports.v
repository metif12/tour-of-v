module main

import math
import strings

fn main() {
	// `math` and `strings` are part of the standard library.
	println(math.sqrt(144.0))
	println(strings.split_capital('lowercaseWords'))

	// Some operations are methods on the value instead of functions
	// in the module. Both styles appear in the standard library.
	s := 'imports'
	println(s.to_upper())
	println(s.repeat(3))
	println(s.split_into_lines())
}
