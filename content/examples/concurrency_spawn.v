module main

import time

// `spawn` starts a thread and returns immediately. It gives you back a handle,
// and that handle is how you wait for the thread later.
fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

fn main() {
	// A handle waits for one thread.
	handle := spawn slow_square(7)
	println('the main thread carried on, and got ${handle.wait()}')

	// A slice of handles is the shape for a fixed set of tasks. `wait()` on the
	// slice joins all of them at once.
	mut threads := []thread int{}
	for i in 1 .. 5 {
		threads << spawn slow_square(i)
	}
	results := threads.wait()
	println('all four squares: ${results}')

	// A slice of handles whose threads return nothing is `[]thread`, and you
	// join them by waiting on each one.
	mut quiet := []thread{}
	for _ in 0 .. 3 {
		quiet << spawn noop()
	}
	for t in quiet {
		t.wait()
	}
	println('all three quiet threads finished')
}

fn noop() {
	time.sleep(10 * time.millisecond)
}
