module content

// controlflow covers loops, conditionals, match and defer.
pub fn controlflow() Module {
	return Module{
		id:          'controlflow'
		title:       'Control flow'
		description: '<p>Learn how to control the flow of your code with loops, conditionals, matching and deferred work.</p>'
		lessons:     [
			Lesson{
				slug:        'controlflow'
				title:       'Flow control statements: for, if, match and defer'
				description: 'Loops, conditionals, pattern matching and deferred work.'
				pages:       [
					Page{
						title: 'For'
						body:  cf_for
						code:  Example{ files: [for_file] }
					},
					Page{
						title: 'For is V\'s "while"'
						body:  cf_while
						code:  Example{ files: [while_and_forever_file] }
					},
					Page{
						title: 'For continued'
						body:  cf_for_continued
						code:  Example{ files: [for_range_file] }
					},
					Page{
						title: 'If'
						body:  cf_if
						code:  Example{ files: [if_file] }
					},
					Page{
						title: 'If with an unwrapped value'
						body:  cf_if_guard
						code:  Example{ files: [if_guard_file] }
					},
					Page{
						title: 'Match'
						body:  cf_match
						code:  Example{ files: [match_file] }
					},
					Page{
						title: 'Match and sum types'
						body:  cf_match_sum
						code:  Example{ files: [match_sumtypes_file] }
					},
					Page{
						title: 'Defer'
						body:  cf_defer
						code:  Example{ files: [defer_file] }
					},
					Page{
						title: 'Exercise: Loops and Functions'
						body:  cf_exercise
						code:  Example{
							files:    [loops_exercise_file]
							solution: [loops_exercise_solution_file]
						}
					},
					Page{
						title: 'Congratulations!'
						body:  cf_done
						code:  Example{
							files: [controlflow_done_file]
						}
					},
				]
			},
		]
	}
}

const for_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/for.v').to_string()
}

// The closing page puts the three looping forms side by side, so the code panel
// stays on the page and shows the lesson rather than a stub.
const controlflow_done_file = CodeFile{
	name: 'controlflow_done.v'
	body: $embed_file('examples/controlflow_done.v').to_string()
}

const while_and_forever_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/while_and_forever.v').to_string()
}

const for_range_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/for_range.v').to_string()
}

const if_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/if.v').to_string()
}

const if_guard_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/if_guard.v').to_string()
}

const match_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/match.v').to_string()
}

const match_sumtypes_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/match_sumtypes.v').to_string()
}

const defer_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/defer.v').to_string()
}

const loops_exercise_file = CodeFile{
	name: 'loops.v'
	body: $embed_file('examples/loops_exercise.v').to_string()
}

const loops_exercise_solution_file = CodeFile{
	name: 'loops.v'
	body: $embed_file('examples/loops_exercise_solution.v').to_string()
}

const cf_for = '<h2>For</h2>
<p>V has one loop keyword, and it comes in three forms.</p>
<p>The counted form looks like C:</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>A condition on its own is a while loop, and no condition at all loops
forever.</p>
<p><code>break</code> leaves the loop and <code>continue</code> skips to the
next iteration.</p>
<p>Try changing the loop so it counts down from 5 instead of up to 3, and run
it again.</p>'

const cf_while = '<h2>For is V&rsquo;s &ldquo;while&rdquo;</h2>
<p>A <code>for</code> with a single condition keeps going until that condition
is false.</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p>A <code>for</code> with no condition at all is an <em>infinite loop</em>:</p>
<pre><code>for {</code></pre>
<p>The example breaks out of the second loop after three iterations. If you
delete the <code>if</code> and the <code>break</code>, the sandbox will stop
the program when it runs out of CPU time.</p>'

const cf_for_continued = '<h2>For continued</h2>
<p>Looping over a collection uses <code>in</code> rather than an index. This
is the form you should reach for by default, because it cannot go out of
bounds.</p>
<pre><code>for i, v in items {</code></pre>
<p>Use <code>_</code> to ignore the index:</p>
<pre><code>for _, v in items {</code></pre>
<p>To iterate a known number of times, use a range:
<code>for i in 0 .. n</code>. Note that <code>..</code> is exclusive: it runs
<code>n</code> times, from <code>0</code> to <code>n-1</code>.</p>
<p>Maps give you the key and the value.</p>'

const cf_if = '<h2>If</h2>
<p>An <code>if</code> is written like this:</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>There is no condition around the parentheses, and no <code>then</code>
keyword.</p>
<p>Because an <code>if</code> is an expression that can return a value, the
pattern above is idiomatic: handle the interesting case and return early,
then fall through to the ordinary one.</p>
<p>Use <code>else if</code> for a chain of tests. V takes every branch at
face value, so check the chain yourself: a branch whose test can never be
true simply never runs, and the compiler will not point it out.</p>'

const cf_if_guard = "<h2>If with an unwrapped value</h2>
<p>A V function can return a value <em>or</em> an error. The return type is
written with a <code>!</code> before it:</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>Inside the body, <code>return</code> a plain value and V wraps it for you.
To fail, return an <code>error(...)</code> instead.</p>
<p>At the call site, an <code>if</code> can unwrap the result. The successful
value binds to <code>v</code>, and if there was an error, the <code>else</code>
branch runs with the error bound to <code>err</code>:</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>Run it twice. The first call succeeds and the second does not, and both take
the branch you would expect.</p>
<p>This is how most V code handles things that can go wrong. The
<a href='/optionresult/1'>next module</a> covers it properly.</p>"

const cf_match = '<h2>Match</h2>
<p>V does not have a <code>switch</code> keyword. It has <code>match</code>,
which covers more cases than a switch usually does.</p>
<p>Match on a value:</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>Match on a range. Ranges in a <code>match</code> are <em>inclusive</em> on
both ends, which is the opposite of the <code>..</code> you use in a
<code>for</code>:</p>
<pre><code>1 ... 3 { }</code></pre>
<p>Match on an enum. Every value needs an arm, or the <code>match</code> needs
an <code>else</code>, so a new value cannot be added without the compiler
pointing at every <code>match</code> that needs updating.</p>'

const cf_match_sum = '<h2>Match and sum types</h2>
<p>A <em>sum type</em> is declared with <code>=</code> and a list of
alternatives:</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>A value of that type is exactly one of the alternatives, never more than
one.</p>
<p>Matching one tells you which. Inside an arm, the original variable is
<em>smart cast</em> to that variant, so its fields are available directly
without any casting.</p>
<p>Every alternative needs an arm, or the match needs an <code>else</code>.
The compiler enforces this, so a new alternative cannot be silently
ignored.</p>
<p>Try adding a fourth shape to the sum type and run it. The compiler will
tell you exactly which <code>match</code> statements you missed.</p>'

const cf_defer = "<h2>Defer</h2>
<p><code>defer</code> schedules a statement to run when the enclosing block
exits.</p>
<p>It runs however the block exits: by reaching the end, by an early
<code>return</code>, or while unwinding from a panic. That is what makes it
useful for cleanup.</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>In the example, <code>with_defer</code> runs its body, then the deferred
statement. <code>early_return</code> returns in the middle, and the deferred
statement still runs.</p>"

const cf_exercise = '<h2>Exercise: Loops and Functions</h2>
<p>Write <code>sum_to</code> so it returns the sum of the numbers from
<code>0</code> to <code>n</code>, and <code>sum_squares</code> so it returns
the sum of their squares.</p>
<p>Do it twice: once with whatever is most direct, and once with an explicit
<code>for</code> loop.</p>
<p>Then rewrite both to run in <em>O(1)</em> time.</p>
<p>Press <b>Solution</b> when you have tried, or when you are stuck.</p>'

const cf_done = "<p>You finished this lesson!</p>
<p>Go back to the <a href='/list'>list of modules</a> to find what to learn
next, or continue with <a href='/moretypes/1'>more types</a>.</p>"
