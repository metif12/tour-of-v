module content

// optionresult covers Option and Result, the two ways V says "there might not
// be a value here".
pub fn optionresult() Module {
	return Module{
		id:          'optionresult'
		title:       'Handling absence and failure.'
		description: '<p>V keeps &ldquo;no value&rdquo; and &ldquo;this failed&rdquo; apart. ' +
			'This lesson covers Option, Result, and the propagation that goes with them.</p>'
		lessons:     [
			Lesson{
				slug:        'optionresult'
				title:       'Handling absence and failure.'
				description: 'Option, Result, and how to propagate them.'
				pages:       [
					Page{
						title: 'Option'
						body:  or_option
						code:  Example{ files: [options_file] }
					},
					Page{
						title: 'Result and errors'
						body:  or_result
						code:  Example{ files: [errors_file] }
					},
					Page{
						title: 'Exercise: Options'
						body:  or_exercise
						code:  Example{
							files:    [options_exercise_file]
							solution: [options_solution_file]
						}
					},
					Page{
						title: 'Congratulations!'
						body:  or_done
					},
				]
			},
		]
	}
}

const options_file = CodeFile{
	name: 'options.v'
	body: $embed_file('examples/options.v').to_string()
}

const errors_file = CodeFile{
	name: 'errors.v'
	body: $embed_file('examples/errors.v').to_string()
}

const options_exercise_file = CodeFile{
	name: 'options.v'
	body: $embed_file('examples/options_exercise.v').to_string()
}

const options_solution_file = CodeFile{
	name: 'options.v'
	body: $embed_file('examples/options_solution.v').to_string()
}

const or_option = "<h2>Option</h2>
<p>V distinguishes two situations that many languages run together, and gives
each its own type.</p>
<p>An <code>?T</code> is a value or <em>none</em>. It is for the case where
there is nothing to return and nothing went wrong: a lookup that found
nothing, a search that ran out of candidates.</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>An option is unwrapped with <code>or</code>, which supplies a value for the
none case:</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>Or with an <code>if</code>, which runs a different branch instead:</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>The variable is only bound in the branch where there is a value. In the
<code>else</code> branch the option was <code>none</code>.</p>
<p>Options compose without ceremony. A function returning <code>?int</code> can
return another function's option directly:</p>
<pre><code>n := name?.len</code></pre>
<p>That <code>?</code> means &ldquo;if that is none, return none from this
function too&rdquo;. It is the difference between propagating a value and
inventing a default, and it is why the body above needs no unwrapping at
all.</p>
<p>Printing an option shows which half you have, so
<code>Option(3)</code> and <code>Option(none)</code> are self describing while
you are working out what went wrong.</p>"

const or_result = "<h2>Result and errors</h2>
<p>An option says there is nothing. A <code>!T</code> says something
<em>failed</em>, and carries a message about how.</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>Returning a plain value needs no unwrapping; V wraps it. Returning
<code>error(...)</code> makes the failure. That is the whole contract.</p>
<p>The call site is the same shape as an option, and binds <code>err</code> in
the <code>else</code> branch:</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code> gives the message on its own, without anything the
error type may have added around it. Both forms are used in the example.</p>
<p>Propagation works the same way as it does for options. Note the
<code>!</code> on each call in <code>parse_pair</code>: either half failing
fails the whole thing, and the message travels with it.</p>
<p>The standard library follows this convention throughout, which is why
<code>json2.decode</code> can report where your JSON went wrong:</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>So the rule for choosing between them is short. If nothing was found, use an
option. If something was attempted and did not work, return a result. And when
a function has to hand on a failure it did not cause, propagate it with
<code>?</code> or <code>!</code> rather than flattening it into a default.</p>"

const or_exercise = '<h2>Exercise: Options</h2>
<p>Write four functions, each returning an option.</p>
<p><code>second_largest</code> returns the second largest <em>distinct</em>
value in a slice, or none when there is not one. A repeated largest does not
count, so <code>[5, 5]</code> has no second largest.</p>
<p><code>first_word</code> returns the first word of a string, or none for an
empty one.</p>
<p><code>sum_all</code> takes a slice of options and returns an int, skipping
the ones that are none.</p>
<p>Then <code>describe_all</code>, which summarises the input. Write it with
<code>?</code> propagation so it contains no unwrapping at all.</p>
<p>Press <b>Solution</b> when you have tried, or when you are stuck.</p>'

const or_done = "<p>You finished this lesson!</p>
<p>You can go back to the <a href='/list'>list of modules</a> to find what to
learn next, or continue with <a href='/methods/1'>methods and
interfaces</a>.</p>"
