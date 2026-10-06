module main

import sync

// Exercise: build a pool of workers and feed it jobs.
//
//  1. `worker` takes one job from a channel, doubles it, and sends the result
//     to another channel. It gets a `WaitGroup` so the pool knows when it is
//     finished.
//
//  2. `run_all` fills a job channel, closes it, starts `workers` threads, waits
//     for all of them, and returns the results in the order they arrived.
//
// Notes, all of which matter:
//
//  - There is no `for job in jobs` in V. Receive with `<-jobs`, and use
//    `<-jobs or { break }` to stop when the channel is closed and empty.
//  - `jobs.close()` belongs before the workers start, so a worker can never be
//    left waiting for a close that was never going to come.
//  - `wg.add(1)` before each `spawn`, and `wg.done()` inside the worker.
//  - A `done()` with no matching `add()` panics.

fn worker(jobs chan int, results chan int, wg &sync.WaitGroup) {
	// One job per turn, until the channel is closed and empty.
	for {
		job := <-jobs or { break }
		results <- (job * 2)
	}
	wg.done()
}

fn run_all(jobs []int, workers int) []int {
	// The job channel holds every job, so no worker can block on a send and no
	// producer is left waiting on a full buffer.
	mut queue := chan int{cap: jobs.len}
	for job in jobs {
		queue <- job
	}
	// Closed before the workers start, so each one eventually finds the end.
	queue.close()

	// The results channel is buffered to match, so a worker never blocks
	// handing a result back.
	mut results := chan int{cap: jobs.len}

	mut wg := sync.new_waitgroup()
	for _ in 0 .. workers {
		wg.add(1)
		spawn worker(queue, results, wg)
	}
	// After this returns, every worker has called `done`, so nothing else is
	// going to be sent on `results`.
	wg.wait()
	results.close()

	// Drain what is left. There is no `for r in results`, so the loop ends on
	// the fallback from `or` once the closed channel runs dry.
	mut out := []int{}
	for {
		r := <-results or { break }
		out << r
	}
	return out
}

fn main() {
	println(run_all([1, 2, 3, 4], 2))
	println(run_all([10, 20], 4))
	println(run_all([], 2))
}
