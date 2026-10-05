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
}

fn run_all(jobs []int, workers int) []int {
	return [] // your code here
}

fn main() {
	println(run_all([1, 2, 3, 4], 2))
	println(run_all([10, 20], 4))
	println(run_all([], 2))
}
