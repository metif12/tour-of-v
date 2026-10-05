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

	// 3. The trap. `len:` also compiles on a channel literal and it does not do
	//    what it looks like: the channel is still unbuffered, so the capacity
	//    is zero and `len()` never rises. Use `cap:`.
	looks_buffered := chan int{len: 4}
	println('3 len is ${looks_buffered.len}, cap is ${looks_buffered.cap}')
	spawn slow_sender(looks_buffered)
	time.sleep(100 * time.millisecond)
	println('3 length is still ${looks_buffered.len}, so it is unbuffered')
	println('3 draining it: ${<-looks_buffered} ${<-looks_buffered} ${<-looks_buffered}')

	// 4. `cap()` is the room available, and it is fixed at creation.
	println('4 cap of the buffered channel is ${buffered.cap}')
}
