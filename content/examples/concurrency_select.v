module main

import time

// Two producers with very different delays, and one consumer that has to take
// whichever answers first.
fn main() {
	fast := chan string{cap: 1}
	slow := chan string{cap: 1}

	spawn fn (c chan string) {
		time.sleep(10 * time.millisecond)
		c <- 'the quick answer'
	}(fast)
	spawn fn (c chan string) {
		time.sleep(300 * time.millisecond)
		c <- 'the slow answer'
	}(slow)

	// `select` waits on several channels and runs the body of whichever one is
	// ready. The others are left alone. The winning value is assigned in the
	// branch, because the select itself is not what evaluates to it.
	mut start := time.now()
	mut winner := ''
	mut branch := ''
	select {
		v := <-fast {
			winner = v
			branch = 'the fast channel'
		}
		v := <-slow {
			winner = v
			branch = 'the slow channel'
		}
	}
	println('${branch} won with ${winner}, after ${time.now() - start}')

	// A branch can be a send as well as a receive. Here the channel has room, so
	// the send branch is the one that can run.
	//
	// Keep the two shapes in separate selects. A select holding a send branch
	// *and* a receive branch crashes the compiler rather than reporting an
	// error, so pair a send with a timeout instead.
	out := chan int{cap: 1}
	mut sent := ''
	select {
		out <- 5 {
			sent = 'the send branch ran'
		}
		100 * time.millisecond {
			sent = 'the buffer was full'
		}
	}
	// The value is in the channel: `len` says so. Do not read it back here.
	// A value that went in through a send branch comes out as garbage rather
	// than as what was sent, in this compiler, so the example checks the
	// length and leaves the value alone.
	println('${sent}, and the channel holds ${out.len} value(s)')

	// A timeout branch is a duration sitting in a branch position. It is how a
	// wait stops being unbounded, and only one per select.
	quiet := chan int{cap: 1}
	mut start2 := time.now()
	select {
		v := <-quiet {
			println('unexpected value ${v}')
		}
		100 * time.millisecond {
			println('nothing arrived within 100ms, gave up after ${time.now() - start2}')
		}
	}

	// `else` is the branch for when nothing at all is ready, and it does not
	// wait. This is the non-blocking form.
	empty := chan int{cap: 1}
	mut start3 := time.now()
	mut took_else := ''
	select {
		_ := <-empty {
			took_else = 'took a value'
		}
		else {
			took_else = 'nothing was ready'
		}
	}
	println('${took_else}, immediately: ${time.now() - start3}')

	// As an expression, a select evaluates to a bool: true when a channel branch
	// ran, false when `else` did. It does not evaluate to the branch's value,
	// so read the value out in the branch and test the bool separately.
	if select {
		_ := <-empty {
			println('a value arrived')
		}
		else {
			println('the else branch ran instead')
		}
	} {
		println('so the select reports a channel branch ran')
	} else {
		println('so the select reports none did')
	}

	// Once a channel is closed, receiving from it is always ready, so a closed
	// channel wins the select every time round.
	//
	// Bind the value in the branch. A bare `<-empty {` is read as a timeout
	// rather than a receive, so the loop waits for a branch that can never run
	// and the program hangs until the sandbox gives up on it.
	empty.close()
	mut spins := 0
	for spins < 3 {
		select {
			_ := <-empty {
				spins++
			}
		}
	}
	println('the closed channel was ready ${spins} times')
}
