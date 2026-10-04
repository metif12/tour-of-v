module content

// methods covers interfaces, embedding and the `str` convention.
pub fn methods() Module {
	return Module{
		id:          'methods'
		title:       'Methods and interfaces'
		description: '<p>V has no classes. This lesson covers methods, ' +
			'interfaces, and the conventions the standard library expects.</p>'
		lessons:     [
			Lesson{
				slug:        'methods'
				title:       'Methods and interfaces'
				description: 'Methods, interfaces, embedding and the str convention.'
				pages:       [
					Page{
						title: 'Interfaces'
						body:  me_interfaces
						code:  Example{ files: [interfaces_file] }
					},
					Page{
						title: 'Embedding'
						body:  me_embedding
						code:  Example{ files: [embedding_file] }
					},
					Page{
						title: 'Printable types'
						body:  me_str
					},
					Page{
						title: 'Exercise: Shapes'
						body:  me_exercise
						code:  Example{
							files:    [shapes_exercise_file]
							solution: [shapes_solution_file]
						}
					},
					Page{
						title: 'Congratulations!'
						body:  me_done
					},
				]
			},
		]
	}
}

const interfaces_file = CodeFile{
	name: 'interfaces.v'
	body: $embed_file('examples/interfaces.v').to_string()
}

const embedding_file = CodeFile{
	name: 'embedding.v'
	body: $embed_file('examples/embedding.v').to_string()
}

const shapes_exercise_file = CodeFile{
	name: 'shapes.v'
	body: $embed_file('examples/shapes_exercise.v').to_string()
}

const shapes_solution_file = CodeFile{
	name: 'shapes.v'
	body: $embed_file('examples/shapes_solution.v').to_string()
}

const me_interfaces = '<h2>Interfaces</h2>
<p>V has no classes. A struct with methods is the whole of it, and for most
programs that is all you need.</p>
<p>An <em>interface</em> is a list of methods. A type implements it simply by
having them: there is no keyword to write and nothing to declare.</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p>Once <code>Dog</code> and <code>Cat</code> both have a
<code>speak</code> method, either can be passed where a
<code>Speaker</code> is wanted:</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>Because the implementation is implicit, an interface keeps working when a
type is added later. A third speaker needs no change to
<code>announce</code>, and no change to the interface.</p>
<p>A slice of the interface is usually what you want rather than a slice of
one concrete type:</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>Two rules worth holding onto. Keep interfaces small: one or two methods is a
sign the abstraction is real, where five usually means you have copied a
concrete type. And declare the interface where it is <em>used</em>, not next
to the implementation. V does not require either, but a reader will look for
the interface in the function that consumes it.</p>'

const me_embedding = "<h2>Embedding</h2>
<p>A struct can embed another struct, written as a bare type name:</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>The embedded struct's fields become fields of the outer one, and its methods
come with it. <code>u.id</code> and <code>u.name</code> are both just fields
of <code>User</code>, and <code>u.describe()</code> is the method that came
from <code>Base</code>.</p>
<p>That is how a common field and a common method are written once. Embedding
an <em>interface</em> works too, which is how a type substitutes behaviour for
a field.</p>
<p>There is one rule that surprises people, and it is worth finding out the hard
way. An embedded struct inherits the outer type's members, but it does
<em>not</em> gain access to the outer type's own methods. So a method on
<code>Base</code> cannot call <code>area()</code> when
<code>area()</code> belongs to the struct that embeds it.</p>
<p>When you need one function to work across several types, take the interface
as a parameter instead:</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>Embedding is for sharing state and behaviour between a type and its parts.
Interfaces are for writing once about several unrelated types. They answer
different questions and it is worth keeping them apart.</p>"

const me_str = "<h2>Printable types</h2>
<p>V prints a value with its <code>str</code> method rather than by reflecting
over its fields, so a type controls how it appears by defining one:</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>From then on <code>println(t)</code>, string interpolation and concatenation
all use it:</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>This is the one method you will most often write, and it is worth writing
early: a type that prints itself sensibly makes every later debugging session
easier.</p>
<p>The standard library has a convention for the other direction. A type with
a <code>str</code> method can be used wherever a string is expected by
conversion, and <code>os</code> functions that take a <code>string</code>
often accept any type with a <code>str</code> method. The compiler finds the
method; there is nothing to register.</p>"

const me_exercise = "<h2>Exercise: Shapes</h2>
<p>Four things to write.</p>
<p>Give <code>Square</code> and <code>Triangle</code> an <code>area</code>
method, and make <code>total_area</code> add up a slice of shapes through the
interface.</p>
<p>Then write <code>describe(s Shape)</code>, which reports a shape's name and
area without knowing what shape it is.</p>
<p>The last part has a trap in it, and finding it is most of the exercise. You
will be tempted to put <code>describe</code> on <code>Base</code> so that every
shape inherits it. That does not work, and the compiler will tell you why.</p>
<p>Press <b>Solution</b> when you have tried, or when you are stuck.</p>"

const me_done = "<p>You finished this lesson!</p>
<p>You can go back to the <a href='/list'>list of modules</a> to find what to
learn next, or continue with <a href='/generics/1'>generics</a>.</p>"
