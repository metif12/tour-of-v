module main

// A producer that says how many values it sends, and then closes. Closing is
// what tells the consumer the count is not a guess.
fn counted(ch chan int, n int) {
	// V's ranges are half-open, so `0 .. n` is exactly n turns.
	for i in 0 .. n {
		// The parentheses are needed. A send expression stops at the arrow, so
		// without them the compiler tries to multiply the void that the send
		// produced, and reports `mismatched types `void` and `int literal``.
		ch <- (i * i)
	}
	ch.close()
}

fn main() {
	// There is no `for x in ch` in V. A channel is not a collection, so the
	// for loop has nothing to index, and the compiler says:
	//
	//     for in: cannot index `chan int`
	//
	// The way to read a channel to the end is to receive until it stops
	// giving, which is `for { v := <-ch or { break } ... }`.
	ch := chan int{cap: 8}
	spawn counted(ch, 5)

	mut squares := []int{}
	mut received := 0
	for {
		// `or` supplies the break value. It runs when the channel is closed
		// and empty, which is the only time it runs: on an open channel with
		// nothing in it, this receive still blocks.
		v := <-ch or { break }
		squares << v
		received++
	}
	println('read ${received} values: ${squares}')

	// When the producer told you the count, receiving that many times is
	// simpler than closing and testing for the end.
	ch2 := chan int{cap: 8}
	spawn counted(ch2, 4)
	mut running := 0
	for _ in 0 .. 4 {
		running += <-ch2
	}
	println('received exactly four, summing to ${running}')

	// The dangerous version of that loop. A plain `<-ch` on a channel that is
	// closed and empty does not block and does not panic: it hands back the
	// zero value for the element type. Ask for one value too many and you get
	// a silent 0 rather than an error, which is the reason to prefer `or` when
	// the count is not certain.
	silent := chan int{cap: 4}
	silent.close()
	println('a plain receive on a closed empty channel gives ${<-silent}')
	println('and again, and again: ${<-silent} ${<-silent}')
	println('the or-block gives you a value you chose: ${<-silent or { -1 }}')

	// A receive with a fallback is also how you notice that a channel has
	// nothing to offer, once it has been closed.
	ch3 := chan int{cap: 2}
	ch3 <- 7
	ch3.close()
	println('buffered value first: ${<-ch3}')
	println('then the closed channel gives ${<-ch3 or { -1 }}')

	// An open channel with nothing in it is not the same thing, and a receive
	// from one still waits for a sender that may never come. `try_pop` is the
	// non-blocking way to look.
	open_empty := chan int{cap: 1}
	mut v := 0
	println('try_pop on an open empty channel: ${open_empty.try_pop(mut v)}')
	open_empty.close()
	println('try_pop on a closed empty one: ${open_empty.try_pop(mut v)}')
}
