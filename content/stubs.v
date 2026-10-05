module content

// The lessons below are placeholders. They appear in the table of contents
// and are navigable, so the shape of the whole tour is visible from the
// start, but each one says plainly that it has not been written yet.
//
// A stub still carries a runnable program. The code panel is the tour's main
// surface and is never dropped, so an unwritten page gets a real example of
// its subject rather than an empty editor. What a stub is missing is the
// lesson: the walk-through, the introduction, and the exercises.

fn stub(slug string, title string, description string, upcoming string, file CodeFile) Module {
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
							'<p>' + upcoming + '</p>' +
							'<p>The program below already runs, so the panel is not dead. ' +
							'Press <b>Solution</b> for nothing to reveal yet.</p>'
						code:  Example{
							files: [file]
						}
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
		'parameters.', generics_stub_file)
}

// concurrency covers spawn, channels, lock and rlock, and select.
pub fn concurrency() Module {
	return stub('concurrency', 'Concurrency', 'V provides concurrency ' +
		'constructs as part of the core language. This lesson presents them and ' +
		'gives some examples of how they can be used.', 'Planned pages: spawn, ' +
		'channels, buffered channels, range over a channel, closing, select, ' +
		'shared state with lock and rlock, and wait groups.', concurrency_stub_file)
}

const generics_stub_file = CodeFile{
	name: 'generics_stub.v'
	body: $embed_file('examples/generics_stub.v').to_string()
}

const concurrency_stub_file = CodeFile{
	name: 'concurrency_stub.v'
	body: $embed_file('examples/concurrency_stub.v').to_string()
}
