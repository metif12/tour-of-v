module main

import sync
import time

// The closing example runs the whole lesson in one program: a pool of workers,
// a job channel and a results channel, a wait group to join them, a lock for
// state shared between threads, and a select to bound the wait.

fn worker(id int, jobs chan int, results chan string, wg &sync.WaitGroup) {
	for {
		job := <-jobs or { break }
		// Simulated work, so the pool really does overlap.
		time.sleep(20 * time.millisecond)
		results <- 'worker ${id} handled ${job}'
	}
	wg.done()
}

// A shared counter. `shared` on the parameter is what makes every thread's copy
// be the same copy.
struct Stats {
mut:
	done int
}

fn note(shared s Stats) {
	lock s {
		s.done++
	}
}

fn report(shared s Stats) int {
	rlock s {
		return s.done
	}
}

fn main() {
	// The buffer has to be at least as big as the job list here, because every
	// job is queued before the first worker starts. A buffer of 4 and 6 jobs
	// would block on the fifth send, with nothing running to drain it.
	//
	// Ranges are half-open, so `1 .. 6` is five jobs and `1 .. 3` is two
	// workers.
	mut jobs := chan int{cap: 8}
	for i in 1 .. 6 {
		jobs <- i
	}
	jobs.close()

	mut results := chan string{cap: 8}
	shared stats := Stats{}

	mut wg := sync.new_waitgroup()
	for id in 1 .. 3 {
		wg.add(1)
		spawn worker(id, jobs, results, wg)
	}
	wg.wait()
	results.close()

	mut lines := []string{}
	for {
		line := <-results or { break }
		lines << line
		note(shared stats)
	}
	println('collected ${lines.len} lines:')
	for l in lines {
		println('  ${l}')
	}
	println('the shared counter agrees: ${report(shared stats)}')

	// A select with a timeout bounds the last wait, so a program can never hang
	// on a producer that stopped early.
	mut gave_up := false
	select {
		never := <-chan int{} {
			println('never: ${never}')
		}
		100 * time.millisecond {
			gave_up = true
		}
	}
	println('the final bounded wait gave up: ${gave_up}')
}
