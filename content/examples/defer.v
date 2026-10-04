module main

// `defer` runs its statement when the enclosing block exits,
// however it exits: normal end, `return`, or panic.
fn with_defer() {
	defer {
		println('deferred: runs last')
	}
	println('body of with_defer')
}

fn early_return(flag bool) {
	defer {
		println('deferred: still runs on an early return')
	}
	if flag {
		println('returning early')
		return
	}
	println('falling through')
}

fn main() {
	with_defer()
	println('---')
	early_return(true)
	println('---')
	early_return(false)
}
