module main

enum State {
	pending
	running
	done
}

fn main() {
	x := 2

	// match on a value
	match x {
		1 { println('one') }
		2 { println('two') }
		3 { println('three') }
		else { println('something else') }
	}

	// Ranges in a match are inclusive on both ends: `1 ... 3`.
	for i in 0 .. 4 {
		match i {
			0 { println('zero') }
			1...3 { println('one, two or three') }
			else { println('more') }
		}
	}

	// Matching an enum is exhaustive: every value needs an arm.
	for state in [State.pending, State.running, State.done] {
		match state {
			.pending { println('still waiting') }
			.running { println('working') }
			.done { println('finished') }
		}
	}
}
