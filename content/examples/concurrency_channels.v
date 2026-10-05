module main

import time

// A channel of one element type. `chan int{}` with no capacity is unbuffered:
// every send waits for a receiver to take the value, and every receive waits
// for a send.
fn producer(ch chan int) {
	for i in 1 .. 4 {
		println('sending ${i}')
		ch <- i
	}
}

// The receive operator is `<-`. It is an operator, not a method: `ch.recv()`
// and `ch.pop()` are both rejected by the compiler as unknown functions.
fn main() {
	ch := chan int{}

	// Nothing has been sent yet, so this thread has to be started first.
	spawn producer(ch)

	// Each receive here pairs with the send on the other side. The order is
	// fixed because there is only one producer.
	mut total := 0
	for _ in 0 .. 3 {
		v := <-ch
		println('received ${v}')
		total += v
	}
	println('total ${total}')

	// A channel carries exactly one type, so a second channel is a second
	// type. `select` later is how you wait on more than one at a time.
	words := chan string{}
	numbers := chan int{}

	spawn fn (w chan string) {
		time.sleep(10 * time.millisecond)
		w <- 'from the word channel'
	}(words)
	spawn fn (n chan int) {
		n <- 42
	}(numbers)

	// Take one from each. Both threads are already running, so neither
	// receive has to wait long.
	println(<-words)
	println(<-numbers)
}
