module content

// generics covers type parameters: generic functions, generic structs, and
// what it takes to use them together.
pub fn generics() Module {
	return Module{
		id:          'generics'
		title:       'Generics'
		description: '<p>A type parameter lets one declaration stand in for a family ' +
			'of types. This lesson covers generic functions and structs, and how ' +
			'V spells them.</p>'
		lessons:     [
			Lesson{
				slug:        'generics'
				title:       'Generics'
				description: 'Type parameters on functions and structs.'
				pages:       [
					Page{
						title: 'Generic functions'
						body:  ge_functions
						code:  Example{ files: [generics_functions_file] }
					},
					Page{
						title: 'Generic structs'
						body:  ge_structs
						code:  Example{ files: [generics_structs_file] }
					},
					Page{
						title: 'Maps of generic types'
						body:  ge_maps
						code:  Example{ files: [generics_maps_file] }
					},
					Page{
						title: 'Several type parameters'
						body:  ge_pairs
						code:  Example{ files: [generics_pairs_file] }
					},
					Page{
						title: 'Exercise: Generics'
						body:  ge_exercise
						code:  Example{
							files:    [generics_exercise_file]
							solution: [generics_solution_file]
						}
					},
					Page{
						title: 'Congratulations!'
						body:  ge_done
						code:  Example{
							files: [generics_done_file]
						}
					},
				]
			},
		]
	}
}

const generics_functions_file = CodeFile{
	name: 'generics_functions.v'
	body: $embed_file('examples/generics_functions.v').to_string()
}

const generics_structs_file = CodeFile{
	name: 'generics_structs.v'
	body: $embed_file('examples/generics_structs.v').to_string()
}

const generics_maps_file = CodeFile{
	name: 'generics_maps.v'
	body: $embed_file('examples/generics_maps.v').to_string()
}

const generics_pairs_file = CodeFile{
	name: 'generics_pairs.v'
	body: $embed_file('examples/generics_pairs.v').to_string()
}

const generics_exercise_file = CodeFile{
	name: 'generics.v'
	body: $embed_file('examples/generics_exercise.v').to_string()
}

const generics_solution_file = CodeFile{
	name: 'generics.v'
	body: $embed_file('examples/generics_solution.v').to_string()
}

// The closing page uses a generic function, a generic struct and that struct
// as a map's value type, in one program.
const generics_done_file = CodeFile{
	name: 'generics_done.v'
	body: $embed_file('examples/generics_done.v').to_string()
}

const ge_functions = "<h2>Generic functions</h2>
<p>A type parameter stands in for a type, so one declaration can serve a whole
family of them. V writes it in square brackets, and this is the one piece of
syntax worth memorising:</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>Angle brackets are <em>not</em> the syntax here. Written as
<code>fn max_of&lt;T&gt;(...)</code> it is a parse error rather than a different
spelling, and it is the first thing to get right.</p>
<p>You rarely name the type argument. The compiler works it out from the
arguments, and it reads a variable as well as a literal:</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>A type parameter is only needed where the compiler cannot work it out on its
own. In the return position it often is the point:</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>That <code>?T</code> means exactly what it did in the earlier lesson: a value
or none, of whatever type this instantiation is.</p>
<p>A callback is written as a function type, so <code>fn (T) R</code>. That makes
the input and output types independent, which is what lets one function be a
pipeline:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>One declaration, and a separate instantiation for each argument type it is
handed. There is no boxing and no erasure: <code>apply</code> called with an
<code>int</code> callback and called with a <code>string</code> callback are two
different functions, which is why the callback's type has to be written down
rather than guessed.</p>"

const ge_structs = '<h2>Generic structs</h2>
<p>A struct takes a type parameter the same way a function does, and each field
that mentions it belongs to the instantiation:</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>So <code>Stack[int]</code> holds a <code>[]int</code> and
<code>Stack[string]</code> holds a <code>[]string</code>, and they are two
different types. That is worth sitting with, because it means you cannot put an
<code>int</code> stack and a <code>string</code> stack in one slice without
erasing the type somewhere.</p>
<p>Methods carry the parameter as well. <code>mut</code> on the receiver is what
lets a method change the struct, and <code>&amp;</code> says it only reads
it:</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p>The <code>?T</code> is the option type parameterised the same way, so popping
an empty stack gives <code>none</code> rather than a panic.</p>
<p>Two parameters is the same idea twice, and they are independent of each
other:</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>Here is the limit that catches people, and it is worth being precise about,
because the error message does not point at the method you are looking at.
<code>A</code> and <code>B</code> have no relation, so there is no conversion
between them to offer, and a method cannot move a value from one field to the
other:</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>The reason is a property of generic methods rather than of pairs, and it is
worth understanding rather than memorising. A generic method body is checked
against <em>every</em> instantiation that gets used, so it has to be valid for
all of them at once. That is why the method is fine on
<code>Pair[int, int]</code>, where both fields hold one type, and still refused
as soon as <code>Pair[string, int]</code> uses it. The error names the offending
instantiation rather than the declaration:</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>So the rule to hold onto is that a generic method may only promise something
true of every type it will be instantiated with. Reading both fields always
qualifies, which is why <code>describe</code> works for every instantiation:</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return "(&dollar;{p.first}, &dollar;{p.second})"
}</code></pre>'

const ge_maps = "<h2>Maps of generic types</h2>
<p>A generic type can be the value type of a map, and the type argument is
spelled out at the point of use. The map is then an ordinary map of one
concrete type:</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p>Bare <code>Stack</code> is not enough here. The map has to know what its values
are stacks <em>of</em>, and leaving the argument off is an error rather than
something the compiler infers later.</p>
<p>A consequence worth knowing: <code>map[string]Stack[int]</code> and
<code>map[string]Stack[string]</code> are different types, so a program that
needs both has to say so rather than letting one stand in for the other.</p>
<p>Generic methods are available on the values the map hands out, which is what
makes the map useful rather than merely legal:</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>Note the <code>_,</code> in the map loop. Naming the key would be
<code>for team, stack in teams</code>; the bare underscore says the key is not
needed. It has to be bare: an underscore followed by a name is refused, so
<code>_k</code> will not do.</p>
<p>Maps are reference types, which is what makes the two-step write work:
<code>teams['red'].push(10)</code> finds the stack in the map and mutates the
same struct, rather than copying it and losing the change.</p>"

const ge_pairs = "<h2>Several type parameters</h2>
<p>Type parameters stack. Two on a function is usually the input and the output
type, which is what makes a generic function work as a mapping:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>A type parameter does not have to appear in the body. That sounds like a way
to write a useless function, and often it is exactly right: the parameter
constrains the signature without costing anything at the call site.</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>Nothing in the body mentions <code>K</code>, so this is the same function for
a map keyed by strings and for one keyed by ints. The <code>?V</code> is
deliberate: an empty map has no first value, so the function returns none
rather than inventing one.</p>
<p>The shape that comes up most is a generic function over a map, with a
callback deciding what to do with each value:</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p>Both <code>K</code> and <code>V</code> are inferred from the map, and
<code>R</code> is fixed at <code>int</code> because that is what the callback
returns. Where inference has nothing to work from, name the arguments
explicitly: <code>first_map[string, int](m)</code>.</p>
<p>One thing inference will not do is rescue a mismatched argument. If you pass
a <code>Counter[V]</code> where a <code>map[K]Counter[V]</code> is wanted, the
error names an uninferrable <code>K</code> rather than the real problem, which
is a confusing first encounter. Check the argument's type before you go looking
for a generics bug.</p>"

const ge_exercise = "<h2>Exercise: Generics</h2>
<p>Four things to write, and between them they use every shape from this
lesson.</p>
<p><code>index_of[T]</code> returns the position of a value in a slice, or -1.
It works on any type that supports <code>==</code>.</p>
<p><code>count_matching[T]</code> counts how many items satisfy a predicate. The
predicate is a callback, so its type is written <code>fn (T) bool</code>.</p>
<p>Then <code>Counter[K]</code>, a generic struct holding a count per key. Give
it <code>add</code> and <code>get</code>, and notice that <code>K</code> is used
inside another generic type here: a map whose key is the type parameter.</p>
<p>Last, <code>grand_total[K, V]</code>, which adds up a map of counters
weighted by a callback of the key. Two type parameters, and a generic struct as
the map's value type.</p>
<p>Press <b>Solution</b> when you have tried, or when you are stuck.</p>"

const ge_done = "<p>You finished this lesson!</p>
<p>You can go back to the <a href='/list'>list of modules</a> to find what to
learn next, or continue with <a href='/concurrency/1'>concurrency</a>.</p>"
