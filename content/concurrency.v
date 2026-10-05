module content

// concurrency covers threads, channels, and the shared state that needs a lock.
//
// The pages follow the order a program is actually written in: start a thread,
// give it something to talk over, decide how much to buffer, know when to stop,
// wait on more than one thing at a time, and only then reach for a lock.
pub fn concurrency() Module {
	return Module{
		id:          'concurrency'
		title:       'Concurrency'
		description: '<p>V&rsquo;s concurrency constructs are part of the language ' +
			'rather than a library. This lesson covers <code>spawn</code>, channels, ' +
			'<code>select</code>, locks and wait groups.</p>'
		lessons:     [
			Lesson{
				slug:        'concurrency'
				title:       'Concurrency'
				description: 'Threads, channels, locks and wait groups.'
				pages:       [
					Page{
						title: 'Spawn'
						body:  co_spawn
						code:  Example{ files: [concurrency_spawn_file] }
					},
					Page{
						title: 'Channels'
						body:  co_channels
						code:  Example{ files: [concurrency_channels_file] }
					},
					Page{
						title: 'Buffered channels'
						body:  co_buffered
						code:  Example{ files: [concurrency_buffered_file] }
					},
					Page{
						title: 'Receiving until close'
						body:  co_receive
						code:  Example{ files: [concurrency_receive_file] }
					},
					Page{
						title: 'Closing'
						body:  co_close
						code:  Example{ files: [concurrency_close_file] }
					},
					Page{
						title: 'Select'
						body:  co_select
						code:  Example{ files: [concurrency_select_file] }
					},
					Page{
						title: 'Shared state'
						body:  co_shared
						code:  Example{ files: [concurrency_shared_file] }
					},
					Page{
						title: 'Wait groups'
						body:  co_waitgroup
						code:  Example{ files: [concurrency_waitgroup_file] }
					},
					Page{
						title: 'Exercise: A worker pool'
						body:  co_exercise
						code:  Example{
							files:    [concurrency_exercise_file]
							solution: [concurrency_solution_file]
						}
					},
					Page{
						title: 'Congratulations!'
						body:  co_done
						code:  Example{
							files: [concurrency_done_file]
						}
					},
				]
			},
		]
	}
}

const concurrency_spawn_file = CodeFile{
	name: 'concurrency_spawn.v'
	body: $embed_file('examples/concurrency_spawn.v').to_string()
}

const concurrency_channels_file = CodeFile{
	name: 'concurrency_channels.v'
	body: $embed_file('examples/concurrency_channels.v').to_string()
}

// This page carries the fill-before-consumers deadlock as a comment rather than
// as a program to run, because a program that deadlocks is not something to put
// in front of a reader.
const concurrency_buffered_file = CodeFile{
	name: 'concurrency_buffered.v'
	body: $embed_file('examples/concurrency_buffered.v').to_string()
}

const concurrency_receive_file = CodeFile{
	name: 'concurrency_receive.v'
	body: $embed_file('examples/concurrency_receive.v').to_string()
}

const concurrency_close_file = CodeFile{
	name: 'concurrency_close.v'
	body: $embed_file('examples/concurrency_close.v').to_string()
}

const concurrency_select_file = CodeFile{
	name: 'concurrency_select.v'
	body: $embed_file('examples/concurrency_select.v').to_string()
}

const concurrency_shared_file = CodeFile{
	name: 'concurrency_shared.v'
	body: $embed_file('examples/concurrency_shared.v').to_string()
}

const concurrency_waitgroup_file = CodeFile{
	name: 'concurrency_waitgroup.v'
	body: $embed_file('examples/concurrency_waitgroup.v').to_string()
}

const concurrency_exercise_file = CodeFile{
	name: 'concurrency.v'
	body: $embed_file('examples/concurrency_exercise.v').to_string()
}

const concurrency_solution_file = CodeFile{
	name: 'concurrency.v'
	body: $embed_file('examples/concurrency_solution.v').to_string()
}

// The closing page runs a pool, a wait group, a shared counter under a lock and
// a bounded select in one program.
const concurrency_done_file = CodeFile{
	name: 'concurrency_done.v'
	body: $embed_file('examples/concurrency_done.v').to_string()
}

const co_spawn = '<h2>Spawn</h2>
<p><code>spawn</code> starts a thread and returns immediately. It hands back a
handle, and the handle is how you wait for the thread later:</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> itself waits for nothing. A program that ends while a
thread is still working leaves that thread mid-write, so the rule is that every
spawn is eventually waited on.</p>
<p>For a fixed set of tasks, collect the handles in a slice. The element type is
<code>thread</code>, and <code>wait()</code> on the slice joins all of them:</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>When the workers return something, the slice is <code>[]thread int</code> and
<code>wait()</code> hands back the results in order:</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>Ordering is worth being precise about. The results come back in the order the
handles were added, not the order the threads finished, so this is a way of
collecting answers and not a way of imposing an order on the work. Which thread
prints first is not something a program should depend on, and the interleaved
output in the example is the honest version of that.</p>'

const co_channels = "<h2>Channels</h2>
<p>A channel moves values of one type from one thread to another. Create it with
the element type and a capacity, and send and receive with the same arrow:</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>Both directions are <code>&lt;-</code>, because both are receiving from the
other side. There is no <code>ch.recv()</code> or <code>ch.pop()</code>: the
compiler rejects both as unknown functions. If you are used to a method here,
that is the thing to unlearn.</p>
<p><code>chan int{}</code> with no capacity is <em>unbuffered</em>, which means
the channel holds nothing at all. A send cannot finish until a receiver is
standing there, and a receive cannot finish until a sender has produced
something. Every value is a handshake between two threads:</p>
<pre><code>fn producer(ch chan int) {
	for i in 0 .. 3 {
		println('sending &dollar;{i}')
		ch &lt;- i
	}
}

ch := chan int{}
spawn producer(ch)
for _ in 0 .. 3 {
	println('received &dollar;{&lt;-ch}')
}</code></pre>
<p>Read the example's output and the handshake is visible: the sends and the
receives alternate, and they are not in a fixed order you should rely on. That
is the point of the unbuffered channel, not a defect in it.</p>
<p>A channel carries exactly one type, so waiting on two different sorts of
message means two channels. <code>select</code>, further on, is how you wait on
more than one at a time.</p>"

const co_buffered = '<h2>Buffered channels</h2>
<p>A capacity gives the channel room, so a sender can get ahead instead of
blocking on every value:</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>That difference is measurable. With a buffer, all the sends complete and
<code>len()</code> reports how many values are waiting. Without one,
<code>len()</code> stays at zero however long you wait, because there is
nowhere to put them:</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>Choose the buffer when a producer should not be held up by a slow consumer.
The capacity is fixed when the channel is created, and a buffered and an
unbuffered channel of the same element type are different types.</p>
<p>Here is a trap worth the half minute it takes to remember.
<code>len:</code> also compiles on a channel literal, and it does not do what it
looks like:</p>
<pre><code>looks_buffered := chan int{len: 4}
println(looks_buffered.cap) // 0</code></pre>
<p>It compiles, and it gives you an unbuffered channel, so the capacity you
thought you had set is silently zero and <code>len()</code> never rises. Write
<code>cap:</code>. The same trap applies to a job queue: filling a channel
before starting the workers that read it deadlocks on the first send that does
not fit, so either buffer the whole list or start the consumers first.</p>'

const co_receive = '<h2>Receiving until close</h2>
<p><strong>There is no <code>for x in ch</code> in V.</strong> A channel is not a
collection, so the for loop has nothing to index, and the compiler says:</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>If you are arriving from a language where a channel can be ranged over, this
is the thing you will get wrong first. Receive with <code>&lt;-ch</code>, and to
read a channel to its end, receive until it stops giving:</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p>The <code>or</code> supplies the value that ends the loop, and this is the
part that is easy to get wrong in the other direction:
<strong><code>or</code> only fires when the channel is closed and empty.</strong>
On an open channel with nothing in it, <code>&lt;-ch or { -1 }</code> still
blocks, waiting for a sender. It is not a non-blocking poll, whatever it looks
like.</p>
<p>When the producer told you the count, the loop is unnecessary:</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>That simpler form has a sharp edge. A plain <code>&lt;-ch</code> on a channel
that is closed and empty does not block and does not panic: it hands back the
<em>zero value</em> for the element type, every time. Ask for one value too many
and you get a silent <code>0</code>, an empty string or a zero struct instead of
an error:</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>So prefer <code>or</code> whenever the count is not certain, and reach for
<code>try_pop</code> when you want to look without waiting at all:</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>'

const co_close = "<h2>Closing</h2>
<p>Close a channel when its producer is finished with it, and close it from the
producer. The producer owns the channel in the same way it owns the decision to
stop:</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>One detail that catches people: <code>close</code> on its own is not how you
close a channel. Written as a bare call it is the builtin that closes a file
descriptor, and it fails on a channel with a confusing message:</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>Closing does not throw away what is still buffered. The values in the channel
are handed to the reader first, in order, and only once it is empty does a
receive find nothing. That ordering is what makes close the signal it is
meant to be.</p>
<p>What close does not do is make a send legal. Sending on a closed channel is a
runtime panic, and so is closing twice, so the rule is one close per channel
from the one place that owns it.</p>
<p>And close is not a wait. Receiving from a channel that is open and empty still
blocks, whether or not anyone ever closes it.</p>"

const co_select = "<h2>Select</h2>
<p><code>select</code> waits on several channels and runs the body of whichever
one is ready. It is how you take the first answer rather than a fixed
order:</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>A branch is a receive or a send, so both directions can compete:</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	v := &lt;-fast {
		// this one answered first
	}
}</code></pre>
<p>Two details about the syntax. A receive branch written after a send branch
needs the <code>v := &lt;-ch</code> form; written bare, <code>&lt;-ch</code> is read
as a timeout and the compiler complains about a string where it wanted
nanoseconds. And <code>mut</code> on the receiving variable matters, because the
branches assign rather than return.</p>
<p>A duration in a branch position is a timeout, and only one per select. This is
how a wait stops being unbounded:</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> is the branch for when nothing is ready, and it does not
wait. This is the non-blocking form:</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>As an expression a select evaluates to a <strong>bool</strong>: true when a
channel branch ran, false when <code>else</code> did. It does not evaluate to
the branch's value, so read the value out in the branch and test the bool
separately.</p>
<pre><code>if select {
	v := &lt;-ch {
		println(v)
	}
	else {
		// nothing ready
	}
} {
	// a channel branch ran
}</code></pre>
<p>One asymmetry to be ready for. Once a channel is closed, receiving from it is
permanently ready, so a closed channel wins the select every time round. In a
loop over several channels, drain the ones you care about and check for closure
yourself rather than relying on select to get past it.</p>"

const co_shared = "<h2>Shared state</h2>
<p>Channels move values. When threads have to change the <em>same</em> value,
that is a lock's job.</p>
<p>The part that is not obvious is how the state gets shared. A struct passed to
a thread by value is a copy, and each thread would get its own. The
<code>shared</code> keyword on the parameter is what makes it one thing:</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>Note <code>shared t</code> in the parameter list and
<code>spawn add(shared total, i)</code> at the call site. Both are needed. Pass
it without the keyword and the thread gets a copy, so the counter never
moves.</p>
<p><code>lock</code> is a block, not a call, and the closing brace releases it.
There is no <code>unlock</code> statement to pair it with, and writing one is a
syntax error. Hold it for as little as possible: not across a spawn, not across
a channel send, and not around the actual work. A lock held across something
that can block is how a program deadlocks.</p>
<p><code>rlock</code> is the read version, and it is for a structure read far
more often than written:</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p>A <code>shared</code> variable also has to be locked at the point of use, so
the compiler will not let the lock be forgotten by accident.</p>
<p>There is one thing to be careful about, and it is the reason the example
reads a value before waiting on its threads. Spawning does not wait, so reading
shared state straight after a spawn is a race: the value you see depends on how
far the threads got. Wait for the writers before you read, or accept that the
number is provisional.</p>"

const co_waitgroup = '<h2>Wait groups</h2>
<p>A wait group counts work in progress. <code>add</code> before the spawn,
<code>done</code> inside it, and <code>wait</code> when you have started
everything:</p>
<pre><code>fn worker(wg &amp;sync.WaitGroup, ch chan int, n int) {
	ch &lt;- n * n
	wg.done()
}

mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.add(1)
	spawn worker(wg, ch, i)
}
wg.wait()</code></pre>
<p>Take the group as <code>&amp;sync.WaitGroup</code> and not
<code>mut &amp;sync.WaitGroup</code>. The <code>mut</code> reference compiles and
then crashes inside the atomic counter at run time, so the plain reference is
the form to use.</p>
<p><code>wg.go</code> bundles the add and the thread start, which removes the
step where the two drift apart:</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>It takes a closure rather than a call, and a closure in V has to name what it
reads. The <code>fn [ch, i] ()</code> list is that declaration, and leaving a
variable out is a compile error naming the variable rather than anything to do
with concurrency.</p>
<p>Three rules, and they are most of what goes wrong. Every <code>add</code>
needs a matching <code>done</code>, and a <code>done</code> with no
<code>add</code> panics. Every spawn has to happen before the
<code>wait</code>, because that is all the wait sees. And a thread that panics
takes the whole process with it, so a spawned function needs its own
<code>defer</code> if it can fail partway.</p>'

const co_exercise = '<h2>Exercise: A worker pool</h2>
<p>Build a pool of workers and feed it jobs.</p>
<p><code>worker</code> takes one job from a channel, doubles it, and sends the
result to another channel. It is handed a wait group so the pool knows when it
is finished.</p>
<p><code>run_all</code> takes a slice of jobs and a worker count, and returns
the results in the order they arrived.</p>
<p>The order of operations is the whole exercise, and four things have to be true
at once:</p>
<ul>
<li>The job channel is closed <em>before</em> the workers start, or a worker can
be left waiting for a close that was never coming.</li>
<li>Every <code>add</code> happens before the <code>wait</code>, and every
<code>done</code> inside the worker.</li>
<li>Both channels are buffered, so a worker never blocks handing a value back.</li>
<li>The results are collected with <code>&lt;-results or { break }</code>, since
there is no <code>for</code> over a channel.</li>
</ul>
<p>Two of those are the deadlock this exercise usually turns up: a job channel
with less room than the job list, or results read before the
<code>wait</code>.</p>
<p>Press <b>Solution</b> when you have tried, or when you are stuck.</p>'

const co_done = "<p>You finished this lesson, and with it the tour.</p>
<p>Everything above lives in the language rather than in a library, which is
worth remembering as you go: a thread, a channel and a lock are ordinary V
declarations you can read in the same file as the code they serve.</p>
<p>You can go back to the <a href='/list'>list of modules</a> to reread
anything, or start again at <a href='/welcome/1'>getting started</a>.</p>"
