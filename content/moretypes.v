module content

// moretypes covers structs, arrays, slices, maps and strings.
pub fn moretypes() Module {
	return Module{
		id:          'moretypes'
		title:       'More types: structs, slices, and maps.'
		description: '<p>Build your own types with structs, and work with the ' +
			'collections V offers: arrays, slices and maps.</p>'
		lessons:     [
			Lesson{
				slug:        'moretypes'
				title:       'More types: structs, slices, and maps.'
				description: 'Structs, arrays, slices, maps and strings.'
				pages:       [
					Page{
						title: 'Structs'
						body:  mt_structs
						code:  Example{ files: [structs_file] }
					},
					Page{
						title: 'Arrays'
						body:  mt_arrays
						code:  Example{ files: [arrays_file] }
					},
					Page{
						title: 'Slices'
						body:  mt_slices
						code:  Example{ files: [slices_file] }
					},
					Page{
						title: 'Maps'
						body:  mt_maps
						code:  Example{ files: [maps_file] }
					},
					Page{
						title: 'Strings'
						body:  mt_strings
						code:  Example{ files: [strings_file] }
					},
					Page{
						title: 'Methods'
						body:  mt_methods
						code:  Example{ files: [methods_intro_file] }
					},
					Page{
						title: 'Exercise: Word Count'
						body:  mt_exercise
						code:  Example{
							files:    [wordcount_exercise_file]
							solution: [wordcount_solution_file]
						}
					},
					Page{
						title: 'Congratulations!'
						body:  mt_done
					},
				]
			},
		]
	}
}

const structs_file = CodeFile{
	name: 'structs.v'
	body: $embed_file('examples/structs.v').to_string()
}

const arrays_file = CodeFile{
	name: 'arrays.v'
	body: $embed_file('examples/arrays.v').to_string()
}

const slices_file = CodeFile{
	name: 'slices.v'
	body: $embed_file('examples/slices.v').to_string()
}

const maps_file = CodeFile{
	name: 'maps.v'
	body: $embed_file('examples/maps.v').to_string()
}

const strings_file = CodeFile{
	name: 'strings.v'
	body: $embed_file('examples/strings.v').to_string()
}

const methods_intro_file = CodeFile{
	name: 'methods.v'
	body: $embed_file('examples/methods_intro.v').to_string()
}

const wordcount_exercise_file = CodeFile{
	name: 'wordcount.v'
	body: $embed_file('examples/wordcount_exercise.v').to_string()
}

const wordcount_solution_file = CodeFile{
	name: 'wordcount.v'
	body: $embed_file('examples/wordcount_solution.v').to_string()
}

const mt_structs = "<h2>Structs</h2>
<p>A <em>struct</em> groups values under one name. It is V's way of saying
&ldquo;these belong together&rdquo;.</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>A value is made with <code>Point{ x: 3, y: 4 }</code>, and fields are read
with <code>p.x</code>.</p>
<p>Two things are worth noticing.</p>
<p>First, a struct can print itself, so <code>println(p)</code> shows every
field without any extra work.</p>
<p>Second, mutability works the same way it does for ordinary variables. The
variable needs <code>mut</code>:</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>and the field itself has to be declared under <code>mut</code> in the
struct:</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p>A field that is not under <code>mut</code> cannot be assigned to at all. It
can still be read, and passed around, and copied.</p>
<p>Try removing <code>mut:</code> from the struct and running the example. The
compiler will point at the line that assigns to <code>x</code>.</p>"

const mt_arrays = '<h2>Arrays</h2>
<p>An array has a fixed length, and its element type comes from its first
element:</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>An array can also be made with a length and a starting value:</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>Arrays are indexed with <code>[]</code>, and carry their length:</p>
<pre><code>println(numbers.len)</code></pre>
<p>When two values must not share their contents, ask for a copy explicitly
with <code>clone</code>:</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>Worth reaching for whenever you are passing a collection to something you do
not want to be able to change it, because it says so at the point of use rather
than relying on a rule you have to remember.</p>
<p>The usual transformations are methods rather than free functions:</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> stands for the current element.</p>'

const mt_slices = "<h2>Slices</h2>
<p>A slice is a view onto a range of an array or another slice, written with
the same <code>[]</code> syntax:</p>
<pre><code>part := arr[1..3]</code></pre>
<p>Slices can also be built from nothing and grown. Growing can move the data,
so the variable has to be <code>mut</code>:</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> appends. It works on any slice, and on a fixed size
array it is a compile error rather than a surprise at runtime.</p>
<p>Slicing another slice gives a slice of it. As with arrays, <code>clone</code>
when you need an independent copy:</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>Note that ranges are <em>exclusive</em>: <code>0 .. n</code> runs
<code>n</code> times. Ranges inside <code>match</code> are written
<code>...</code> and are inclusive, which is the one asymmetry worth memorising
in this lesson.</p>"

const mt_maps = "<h2>Maps</h2>
<p>A map holds key and value pairs, and is written as a literal:</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>The value type is inferred. Adding a key, and asking whether one is
present:</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>Looking up a key that is not there gives the <em>zero value</em>, so a
lookup where missing and zero must be told apart uses <code>or</code>:</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>Iterating gives the key and the value:</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>Maps are reference types, so a plain assignment would leave you with two
names for one map. <code>clone</code> is how you get an independent one:</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p>Without <code>clone</code> the compiler will tell you that a map cannot be
copied, and ask you to choose between <code>move</code>, <code>clone</code> or
a reference. That question is the point: sharing a map by accident is easy, so
V makes you say which you meant.</p>"

const mt_strings = "<h2>Strings</h2>
<p>A V string is a sequence of bytes, which has one consequence you will meet
immediately: indexing gives a byte, and <code>.len</code> counts bytes.</p>
<pre><code>println(s[0])</code></pre>
<p>That is exactly right for ASCII and wrong for anything else, which is why
<code>.runes()</code> exists. It walks the characters instead:</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>Strings are immutable, so every method on one returns a new string:</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>These are methods rather than functions in a module, so there is nothing to
import for them. Some operations do live in <code>strings</code>, notably the
builder:</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>Use a builder rather than repeated <code>+</code> when you are building a
long string in a loop.</p>"

const mt_methods = "<h2>Methods</h2>
<p>A method is a function with a <em>receiver</em>: the value it is called
on.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>The receiver type comes before the method name, and the method is then
called as <code>p.sum()</code>.</p>
<p>A receiver with no <code>&amp;</code> is a <em>copy</em>, so the method cannot
change the original. To write through it, declare the receiver as a reference
and make it <code>mut</code>:</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>That distinction is the whole of V's method story, and it is the same
distinction you met with ordinary values: assignment gives you a value, and a
reference is something you ask for by name.</p>
<p>Reach for a value receiver unless the method genuinely has to modify the
receiver. A method that only reads should not be able to.</p>"

const mt_exercise = '<h2>Exercise: Word Count</h2>
<p>Implement <code>word_count</code> so that it counts how many times each word
appears in a string.</p>
<p>Words are separated by anything that is not a letter, and the count must not
depend on the case of the letters. Use a <code>map[string]int</code>.</p>
<p>Once that works, make the output ordered rather than whatever order the map
happens to walk in.</p>
<p>Press <b>Solution</b> when you have tried, or when you are stuck.</p>'

const mt_done = "<p>You finished this lesson!</p>
<p>You can go back to the <a href='/list'>list of modules</a> to find what to
learn next, or continue with
<a href='/optionresult/1'>handling absence and failure</a>.</p>"
