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
