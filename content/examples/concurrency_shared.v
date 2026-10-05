module main

import time

// A struct passed between threads. The `shared` keyword on the parameter is
// what makes this one function's copy be everybody's copy, instead of a
// separate copy per thread.
struct Total {
mut:
	n int
}

// `lock` is how a thread takes exclusive access for the shortest possible
// span. The block ends the critical section and releases it.
fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}

// `rlock` is the read version. Several readers may hold it at once, and a
// writer waits for them all.
fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}

fn main() {
	shared total := Total{}

	// Each of these runs on its own thread, all against the same `total`.
	for i in 1 .. 5 {
		spawn add(shared total, i)
	}

	// Nothing waits on those threads yet, so the value read below is whatever
	// they have managed to do by now. Reading shared state while a thread is
	// still writing it is the bug `rlock` exists to prevent, and here the
	// threads may still be running.
	println('read without waiting: ${read(shared total)}')

	// Wait for them properly. A slice of handles is the tidiest way.
	mut handles := []thread{}
	for i in 1 .. 5 {
		handles << spawn add(shared total, i)
	}
	for h in handles {
		h.wait()
	}
	println('after all ten adds: ${read(shared total)}')

	// `lock` and `rlock` are blocks, not calls. There is no `unlock` statement
	// to pair them with: the closing brace releases it. Writing one is a syntax
	// error.

	// A `shared` variable needs the lock spelled out wherever it is touched, so
	// the compiler will not let you forget one by accident.
	shared count := 0
	lock count {
		count = 5
	}
	rlock count {
		println('locked directly: ${count}')
	}
}
