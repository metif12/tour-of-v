module main

import time

// The producer owns the channel and closes it when it is done. Closing from
// anywhere else is a bug waiting to happen.
fn produce(ch chan string, n int) {
	// V's ranges are half-open, so `0 .. n` is exactly n turns.
	for i in 0 .. n {
		ch <- 'value ${i + 1}'
	}
	// Closing hands any values still in the buffer over to the reader, and
	// only then does a receive find nothing.
	ch.close()
}

fn main() {
	ch := chan string{cap: 4}
	spawn produce(ch, 3)
	time.sleep(50 * time.millisecond)
	println('three values are sitting in the buffer, cap is ${ch.cap}')

	// The producer closed it. Closing a channel that still holds values does
	// not throw them away: the three come out first, in order.
	ch.close()
	println('draining a channel that was closed while it still had values:')
	for {
		v := <-ch or { break }
		println('  got ${v}')
	}
	println('now it is empty, and a receive falls through to the fallback')

	// A closed channel and an empty one are told apart by draining it. That is
	// the whole reason `or { break }` is the shape to reach for.
	empty := chan int{cap: 1}
	empty.close()
	println('an empty closed channel gives ${<-empty or { -1 }} straight away')

	// `close` on its own is not how you close a channel. Written as a bare
	// call it is the builtin that closes a file descriptor, so `close(ch)`
	// fails with:
	//
	//     cannot use `chan int` as `i32` in argument 1 to `close`
	//
	// The method form is the one that means a channel.

	// What close does not do is make a send legal. Sending on a closed channel
	// is a runtime panic, so the rule is one per channel: close it once, from
	// the producer, after the last send.
	//
	// Closing twice panics for the same reason.

	// And close is not a wait. Receiving from a channel that is open and empty
	// still blocks, whether or not anyone ever closes it.
	still_open := chan int{cap: 1}
	println('len of an open empty channel is ${still_open.len}')
	still_open.close()
	println('after closing, len is ${still_open.len}')
}
