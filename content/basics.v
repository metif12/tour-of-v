module content

// basics covers the components every V program is built from.
//
// The third page ships deliberately broken code, following the Go Tour:
// run it, read the error, and fix it yourself.
pub fn basics() Module {
	return Module{
		id:          'basics'
		title:       'Basics'
		description: '<p>The starting point. Variables, functions, and the types you need before moving on.</p>'
		lessons:     [
			Lesson{
				slug:        'basics'
				title:       'Modules, variables, and functions.'
				description: 'Learn the basic components of any V program.'
				pages:       [
					Page{
						title: 'Modules'
						body:  basics_modules
						code:  Example{ files: [modules_file] }
					},
					Page{
						title: 'Imports'
						body:  basics_imports
						code:  Example{ files: [imports_file] }
					},
					Page{
						title: 'Variables'
						body:  basics_variables
						code:  Example{ files: [variables_broken_file] }
					},
					Page{
						title: 'Mutable variables'
						body:  basics_mut
						code:  Example{ files: [mut_file] }
					},
					Page{
						title: 'Short declarations'
						body:  basics_short
						code:  Example{ files: [declarations_file] }
					},
					Page{
						title: 'Functions'
						body:  basics_functions
						code:  Example{ files: [functions_file] }
					},
					Page{
						title: 'Multiple results'
						body:  basics_multi
						code:  Example{ files: [multiple_results_file] }
					},
					Page{
						title: 'Basic types'
						body:  basics_types
						code:  Example{ files: [basic_types_file] }
					},
					Page{
						title: 'Zero values'
						body:  basics_zero
						code:  Example{ files: [zero_values_file] }
					},
					Page{
						title: 'Constants'
						body:  basics_constants
						code:  Example{ files: [constants_file] }
					},
					Page{
						title: 'Type conversions'
						body:  basics_conversions
						code:  Example{ files: [conversions_file] }
					},
					Page{
						title: 'Type inference'
						body:  basics_inference
						code:  Example{ files: [declarations_file] }
					},
					Page{
						title: 'Congratulations!'
						body:  basics_done
						code:  Example{
							files: [basics_done_file]
						}
					},
				]
			},
		]
	}
}

const modules_file = CodeFile{
	name: 'modules.v'
	body: $embed_file('examples/modules.v').to_string()
}

// The closing page recaps the basic types in one runnable program, so the code
// panel has something real on it instead of going missing.
const basics_done_file = CodeFile{
	name: 'basics_done.v'
	body: $embed_file('examples/basics_done.v').to_string()
}

const imports_file = CodeFile{
	name: 'imports.v'
	body: $embed_file('examples/imports.v').to_string()
}

const variables_broken_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/variables_broken.v').to_string()
}

const mut_file = CodeFile{
	name: 'main.v'
	body: $embed_file('examples/mut.v').to_string()
}

const declarations_file = CodeFile{
	name: 'declarations.v'
	body: $embed_file('examples/declarations.v').to_string()
}

const functions_file = CodeFile{
	name: 'functions.v'
	body: $embed_file('examples/functions.v').to_string()
}

const multiple_results_file = CodeFile{
	name: 'multiple_results.v'
	body: $embed_file('examples/multiple_results.v').to_string()
}

const basic_types_file = CodeFile{
	name: 'basic_types.v'
	body: $embed_file('examples/basic_types.v').to_string()
}

const zero_values_file = CodeFile{
	name: 'zero_values.v'
	body: $embed_file('examples/zero_values.v').to_string()
}

const constants_file = CodeFile{
	name: 'constants.v'
	body: $embed_file('examples/constants.v').to_string()
}

const conversions_file = CodeFile{
	name: 'conversions.v'
	body: $embed_file('examples/conversions.v').to_string()
}

const basics_modules = '<h2>Modules</h2>
<p>Every V file declares the <em>module</em> it belongs to. The declaration
is the first thing in the file.</p>
<p>A program starts in the module called <code>main</code>, in a function
called <code>main</code>.</p>
<p>This program is using the standard library modules <code>math</code> and
<code>strings</code>.</p>
<p>V has one module per directory, and a module name matches its directory.
A symbol is visible outside its module only if it is marked
<code>pub</code>.</p>'

const basics_imports = '<h2>Imports</h2>
<p>An imported module brings its exported names into the current file.</p>
<p>The standard library is imported by module name:
<code>import math</code>, <code>import strings</code>. Third party
libraries are imported the same way.</p>
<p>Not every operation in a module is written as a function call. Some are
_methods_ on the value instead, so <code>s.to_upper()</code> works on a
string without any import at all.</p>
<p>Both styles appear throughout the standard library, so it is worth
learning to read the signature rather than guessing.</p>'

const basics_variables = '<h2>Variables</h2>
<p>Run the code. Notice the error message.</p>
<p>V variables are declared with <code>:=</code>. Unlike most languages, a
variable in V is <em>immutable by default</em>, and you have to ask for
mutability explicitly.</p>
<p>The compiler says as much. Line 6 tries to assign to <code>sum</code>
without asking permission.</p>
<p>To fix the error, add <code>mut</code> to the declaration on line 4, and
try it again.</p>'

const basics_mut = '<h2>Mutable variables</h2>
<p>To declare a mutable variable, add the <code>mut</code> keyword before
the name.</p>
<p>V requires this because mutation is something you have to mean. A
variable that is never reassigned is easier for the compiler to reason
about, and easier for you to reason about when you come back to the code
later.</p>
<p>Try removing the <code>mut</code> and running it again. That is the error
from the previous page.</p>
<p>You will see <code>mut</code> everywhere in V, including on function
parameters and on struct fields.</p>'

const basics_short = '<h2>Short declarations</h2>
<p><code>:=</code> declares a variable and works out its type from the
value.</p>
<p>When the type is not obvious, or when you want to be specific, name it
directly using a _conversion_ such as <code>i64(42)</code> or
<code>f64(1.5)</code>.</p>
<p>There is no separate &ldquo;declare now, assign later&rdquo; form. A V
variable always has a value at the point it comes into scope, which is why
the zero values you meet on a later page are produced by the compiler rather
than by you.</p>'

const basics_functions = '<h2>Functions</h2>
<p>Functions are declared with <code>fn</code>.</p>
<p>A function may take zero or more parameters. Parameters are written with
a name and a type, and consecutive parameters of the same type are written
as <code>x, y int</code>.</p>
<p>The function&rsquo;s result is named after the parameter list. V
functions return exactly one value, unless the return type is a tuple.</p>
<p>A function whose body is a single expression can be written on one line:
<code>fn double(x int) int { return x * 2 }</code></p>'

const basics_multi = '<h2>Multiple results</h2>
<p>A function can return more than one value. Write the return type as a
tuple:</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>Callers destructure the result into variables:</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>V wraps every single return value in a one element tuple under the hood,
so a function that returns one value and a function that returns a tuple of
one value are the same thing.</p>
<p>This is the shape you will see for anything that can fail, which is
covered in a later module.</p>'

const basics_types = '<h2>Basic types</h2>
<p>Boolean values are <code>true</code> and <code>false</code>.</p>
<p>Integers come in the usual sizes, written <code>i8</code> through
<code>i128</code>, and the unsigned sizes <code>u8</code> through
<code>u128</code>. <code>int</code> itself is 32 bits on most platforms and
<code>long</code> is 64.</p>
<p>Floating point types are <code>f32</code> and <code>f64</code>.</p>
<p>A <code>byte</code> is an alias for <code>u8</code>, and a
<code>rune</code> is an alias for <code>u32</code> holding a Unicode code
point.</p>
<p>Strings are immutable and are written in single quotes.
<code>&amp;str</code> is a string literal, which cannot be modified at
all.</p>'

const basics_zero = '<h2>Zero values</h2>
<p>Every type has a <em>zero value</em>, which is what a variable holds
before anything is assigned to it.</p>
<p>The zero value is <code>0</code> for numbers, <code>false</code> for
booleans, the empty string for strings, and the empty collection for
arrays, slices and maps.</p>
<p>For a struct, the zero value is the struct with all of its fields set to
their zero values.</p>
<p>Since V requires a value at the point of declaration, you rarely write
these yourself. The compiler produces them for you, which is why the
example below compiles even though the right hand sides look redundant.</p>'

const basics_constants = '<h2>Constants</h2>
<p>A <code>const</code> is a value the compiler knows while it is building
your program, so it must be a constant expression.</p>
<p>Constants are written with <code>const</code>, either one at a time or as
a group in parentheses.</p>
<p>Unlike a <code>final</code> in some languages, a V <code>const</code>
cannot be shadowed by a variable of the same name. If a name is constant, it
is constant everywhere.</p>'

const basics_conversions = '<h2>Type conversions</h2>
<p>V never converts a type implicitly. Going from one to another is always
written out:</p>
<pre><code>fl := f64(i)</code></pre>
<p>Some conversions lose information and some are refused outright, so the
compiler will tell you when a conversion does not make sense.</p>
<p>Strings are not numbers. To read one as a number, convert it, and remember
that the result may be a zero value if the text did not parse.</p>
<p>You can also ask the compiler for a type&rsquo;s name with
<code>typeof(x).name</code>.</p>'

const basics_inference = '<h2>Type inference</h2>
<p>The type of a <code>:=</code> declaration is inferred from its value, and
the compiler keeps track of it exactly as if you had written it.</p>
<p>So these two declarations are identical:</p>
<pre><code>a := 10
a := int(10)</code></pre>
<p>Inference only happens where a type is not written down. Function
parameters and return types are always explicit, so a function is never a
mystery about what it takes or gives back.</p>
<p>This is the same program as the one two pages ago, which is the point: run
it and compare the output.</p>'

const basics_done = "<p>You finished this lesson!</p>
<p>You can go back to the <a href='/list'>list of modules</a> to find what to
learn next, or continue with <a href='/controlflow/1'>flow control
statements</a>.</p>"
