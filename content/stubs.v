module content

// The lessons below are placeholders. They appear in the table of contents
// and are navigable, so the shape of the whole tour is visible from the
// start, but each one says plainly that it has not been written yet.
//
// Each stub still needs a real lesson, an introduction, and at least one
// worked example under `examples/`.

fn stub(slug string, title string, description string, upcoming string) Module {
	return Module{
		id:          slug
		title:       title
		description: description
		lessons:     [
			Lesson{
				slug:        slug
				title:       title
				description: description
				pages:       [
					Page{
						title: 'Not written yet'
						body:  '<h2>' + title + '</h2>' +
							'<p>This lesson has not been written yet. It is listed here so ' +
							'the shape of the tour is visible, and so that navigation does not ' +
							'dead-end.</p>' +
							'<p>' + upcoming + '</p>'
					},
				]
			},
		]
	}
}

// optionresult covers V's Option and Result types in depth.
pub fn optionresult() Module {
	return stub('optionresult', 'Handling absence and failure.', 'V distinguishes ' +
		'&ldquo;there is no value&rdquo; from &ldquo;this failed&rdquo;. This lesson ' +
		'covers Option, Result, and the propagation patterns that go with them.',
		'Planned pages: Option types, unwrapping in an if guard, Result types, ' +
			'propagating errors with <code>?</code>, custom errors, mapping over a ' +
			'Result, and error messages as values.')
}

// methods covers methods, interfaces and the standard library conventions
// that V code is expected to follow.
pub fn methods() Module {
	return stub('methods', 'Methods and interfaces', 'How to define methods on ' +
		'types, how to declare interfaces, and how the standard library expects ' +
		'you to behave.', 'Planned pages: methods, method receivers, mutating through ' +
		'a pointer, interfaces, implicit implementation, type embedding, embedding ' +
		'struct fields in interfaces, and the Stringer convention.')
}

// generics covers type parameters.
pub fn generics() Module {
	return stub('generics', 'Generics', 'V supports generic programming using ' +
		'type parameters. This lesson shows how.', 'Planned pages: generic ' +
		'functions, generic structs, generic types as map values, and multiple type ' +
		'parameters.')
}

// concurrency covers spawn, channels, lock and rlock, and select.
pub fn concurrency() Module {
	return stub('concurrency', 'Concurrency', 'V provides concurrency ' +
		'constructs as part of the core language. This lesson presents them and ' +
		'gives some examples of how they can be used.', 'Planned pages: spawn, ' +
		'channels, buffered channels, range over a channel, closing, select, ' +
		'shared state with lock and rlock, and wait groups.')
}
