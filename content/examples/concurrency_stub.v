// V channel receive is the `<-` operator, not a method, and `for x in ch` does
// not iterate a channel. Reducing that to the smallest programs that compile,
// so the lesson page states only what this compiler version accepts.
module main

fn worker(ch chan int) {
	ch <- 42
	ch.close()
}

fn main() {
	// 1. The operator, on a buffered channel.
	ch := chan int{cap: 1}
	spawn worker(ch)
	println('1 operator: ${<-ch}')

	// 2. The same, with a fallback for when the channel is closed and empty.
	ch2 := chan int{cap: 1}
	spawn worker(ch2)
	v := <-ch2 or { -1 }
	println('2 or-block: ${v}')

	// 3. select, which is how you wait on more than one channel.
	slow := chan string{cap: 1}
	fast := chan string{cap: 1}
	slow <- 'slow'
	fast <- 'fast'
	select {
		<-slow {
			println('3 select: slow')
		}
		<-fast {
			println('3 select: fast')
		}
	}

	// 4. Closing is what tells the receiver there is nothing more coming, and it
	// is what makes `<-ch or {}` fall through instead of blocking.
	mut q := chan int{cap: 2}
	q <- 1
	q.close()
	mut n := 0
	for _ in 0 .. 3 {
		// `or` gives the fallback when the channel is closed and empty, so the
		// loop ends instead of waiting for a value that will never arrive.
		got := <-q or { -1 }
		if got < 0 {
			break
		}
		n++
	}
	println('4 closed: read ${n} value(s) then stopped')
}
