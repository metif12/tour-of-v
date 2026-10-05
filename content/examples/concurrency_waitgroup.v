module main

import sync
import time

// The long form: `add` before the spawn, `done` inside it. This is the shape
// to reach for when the work needs arguments, because a `spawn` call passes
// them the ordinary way.
//
// The wait group is taken as a reference, `&sync.WaitGroup`, and not `mut`. A
// `mut` reference here compiles and then crashes inside the atomic counter on
// Windows, so the reference without `mut` is the form to use.
fn worker(wg &sync.WaitGroup, ch chan int, n int) {
	ch <- n * n
	wg.done()
}

// `wg.go` bundles the add and the thread start into one call, which removes the
// step where the two drift apart. It takes a closure, so anything the closure
// reads has to be listed in its capture list: `fn [ch, n] () { ... }`.
fn main() {
	mut wg := sync.new_waitgroup()
	ch := chan int{cap: 8}

	for i in 1 .. 4 {
		// Everything is added before anything is waited on.
		wg.add(1)
		spawn worker(wg, ch, i)
	}

	// `wait` returns once every `done` has been called.
	wg.wait()

	mut total := 0
	for _ in 0 .. 3 {
		total += <-ch
	}
	println('three squares from three threads, totalling ${total}')

	// The short form. No `add`, no `done`: `go` does both.
	mut wg2 := sync.new_waitgroup()
	slow := chan int{cap: 8}
	for i in 1 .. 4 {
		wg2.go(fn [slow, i] () {
			time.sleep(20 * time.millisecond)
			slow <- i
		})
	}
	wg2.wait()

	mut sum := 0
	for _ in 0 .. 3 {
		sum += <-slow
	}
	println('the same four values through wg.go, totalling ${sum}')

	// Two rules worth holding onto. Every `add` needs a matching `done`, and a
	// `done` with no `add` panics. And `wait` only sees the work added before
	// it was called, so spawning after `wait` is a race rather than a wait.
}
