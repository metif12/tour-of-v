module main

fn main() {
	// A map is created with a literal. The value type is inferred.
	mut ages := {
		'Ada':   36
		'Alan':  41
		'Grace': 45
	}
	println(ages)
	println('Ada is ${ages['Ada']}')

	// Adding a key, and asking whether one is there.
	ages['Edsger'] = 39
	if 'Edsger' in ages {
		println('Edsger is present')
	}

	// A key that is not present yields the zero value, so a lookup that
	// distinguishes missing from zero uses `or`.
	println('a missing key gives ${ages['Nobody']}')
	println('an existing key gives ${ages['Alan'] or { -1 }}')

	// Iterating gives keys and values.
	for name, age in ages {
		println('${name} is ${age}')
	}

	// Maps are reference types, so a plain assignment would give two names for
	// one map. `clone` is the way to get an independent one.
	mut backup := ages.clone()
	backup['Ada'] = 99
	println('original Ada: ${ages['Ada']}')
	println('copied Ada:    ${backup['Ada']}')

	// Useful things to ask a map.
	println(ages.len)
	for key, _ in ages {
		println(key)
	}
}
