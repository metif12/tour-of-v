// Module `content` holds the tour's lessons and the loader that turns the
// on-disk lesson definitions into the runtime catalogue.
//
// Lessons are typed V data compiled into the binary, not files parsed at
// startup. That means a malformed lesson is a compile error rather than a
// runtime surprise, and the compiler's own checks apply to lesson structure.
//
// Runnable code examples are the exception: each file lives in a real `.v`
// file under `examples/` and is embedded verbatim with `$embed_file`. V
// string literals cannot be used for this, because every string form in V
// (`'...'`, `"..."`, `r'...'` and backticks) still interpolates `${...}`,
// and V code examples are full of string interpolation. Embedding real
// files means the source the learner sees is byte-for-byte the source the
// author wrote, with no escaping layer to leak into the editor.
module content

// CodeFile is one file in a page's example program. A page may carry
// several, which is how multi-file lessons (modules, helper types) work.
pub struct CodeFile {
pub:
	name string // shown as the editor tab, e.g. 'hello.v'
	body string // verbatim source, embedded from examples/<name>
}

// Example is the runnable program attached to a page.
//
// `files` is the starting source. `solution` is what the Solution button
// reveals, and is left empty for pages that are demonstrations rather than
// exercises.
pub struct Example {
pub:
	files    []CodeFile
	solution []CodeFile
}

// main_file is the file the compiler is pointed at.
//
// It is the first file whose name is `main.v`, falling back to the first
// file overall, which is how the tour's single-file pages work.
pub fn (e &Example) main_file() string {
	for f in e.files {
		if f.name.all_after('/') == 'main.v' {
			return f.name
		}
	}
	return if e.files.len > 0 { e.files[0].name } else { 'main.v' }
}

// Page is a single slide: a titled chunk of prose plus an optional program.
//
// `body` is trusted HTML. That is safe by construction: lesson text is
// compiled into the binary, so nothing a visitor submits can ever reach it.
// Visitor input flows only through the editor and the /api endpoints, both
// of which escape it.
//
// # Writing page bodies
//
// Page bodies are multi-line double-quoted V strings, which constrains them
// in three ways. All three are load-bearing, so keep them in mind before
// adding a lesson:
//
//   - Write HTML attributes with single quotes: `<a href='/list'>`. A double
//     quote would terminate the V string.
//   - Write a literal dollar-brace as `&#36;{`. Every V string form
//     interpolates `${...}`, so `${` in prose is read as an expression.
//     `&#36;{` renders identically in the browser.
//   - Do not use V backticks for multi-line text. In V a backtick is a
//     single-character literal (`` `A` ``), not a string delimiter.
pub struct Page {
pub:
	title string
	body  string
	code  ?Example
}

// Lesson is a browsable unit addressed by its slug, e.g. 'basics'.
pub struct Lesson {
pub:
	slug        string
	title       string
	description string
	pages       []Page
}

// Module groups lessons. The tour uses a two-level taxonomy (module ->
// lesson -> page) so that related lessons can share an introduction.
pub struct Module {
pub:
	id          string
	title       string
	description string
	lessons     []Lesson
}
