module main

import time

// An unbuffered channel holds nothing, so a send cannot complete until a
// receiver is standing there. That is a handshake on every single value, and
// it is what makes the producer block.
fn slow_sender(ch chan int) {
	for i in 1 .. 4 {
		ch <- i
	}
}

fn main() {
	// 1. Unbuffered. Nothing is waiting yet, so the sender cannot get past its
	//    first value until this thread receives.
	unbuffered := chan int{}
	spawn slow_sender(unbuffered)
	time.sleep(100 * time.millisecond)
	println('1 unbuffered length is ${unbuffered.len}, it has nowhere to put anything')
	println('1 received ${<-unbuffered}')
	println('1 length after one receive is ${unbuffered.len}')

	// 2. Buffered with room for four. All the sends return immediately, and the
	//    values wait in the channel until they are collected.
	buffered := chan int{cap: 4}
	spawn slow_sender(buffered)
	time.sleep(100 * time.millisecond)
	println('2 buffered length is ${buffered.len}, every send finished')

	mut total := 0
	for _ in 0 .. 3 {
		total += <-buffered
	}
	println('2 drained them, total ${total}')

	// 3. The field is `cap:`, and the compiler says so if you get it wrong.
	//    Writing `chan int{len: 4}` does not make a four-slot buffer, and it is
	//    not accepted at all:
	//
	//        `len` cannot be initialized for `chan`. Did you mean `cap`?
	//
	// 4. `cap()` is the room available, and it is fixed at creation.
	println('4 cap of the buffered channel is ${buffered.cap}')

	// 5. The rule that actually bites. Buffering only helps up to the capacity:
	//    a sender with more to send than there is room for blocks on the first
	//    value that does not fit. With four slots and six jobs, and no receiver
	//    started yet, the fifth send waits for a consumer that is not running.
	//    So size the buffer for the whole list, or start the consumers first.
	tight := chan int{cap: 2}
	tight <- 1
	tight <- 2
	println('5 the buffer is full, len is ${tight.len} and cap is ${tight.cap}')
}
