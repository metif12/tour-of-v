module main

import strings
import tour
import content

// The templates cannot compute, so everything a template needs is prepared
// here as plain data.
//
// Two constraints from veb shape this. Its `@for` has no index variable, which
// is why page numbers are baked in rather than derived while rendering. And its
// template compiler does not reliably handle more than two levels of nested
// loops, so the module/lesson/page hierarchy is flattened one level here and
// the templates iterate a single list of entries.

// ViewFile is one file in the editor.
pub struct ViewFile {
pub:
	name string
	body string
}

// ViewLink is a previous or next target.
pub struct ViewLink {
pub:
	slug   string
	number int
	label  string
}

// PageData is the whole lesson page as the browser sees it.
//
// It is serialised once into a JSON island in the page rather than read back
// out of the DOM, so what the editor is given is exactly what the server
// holds.
pub struct PageData {
pub:
	module_id string
	lesson    string
	title     string
	number    int
	total     int
	body      string
	files     []ViewFile
	solution  []ViewFile
	prev      ViewLink
	next      ViewLink
}

// build_toc renders the whole table of contents to HTML, in reading order.
//
// This is done entirely in V rather than in a template, and the result is
// handed to the template as a single string.
//
// The reason is a hard constraint of the veb template compiler in the V version
// this project targets: `@veb.raw(...)` is not usable inside an `@for`, and a
// loop may not contain a conditional or another loop. Anything the template
// would have to decide therefore has to be decided here, in code that a test
// can check. What the template is left with is one interpolation.
//
// The trade-off is that this markup is built by string concatenation rather than
// by a template. It is trusted content compiled into the binary, never visitor
// input, so there is nothing to escape here.
pub fn build_toc(t &tour.Tour) string {
	mut sb := strings.new_builder(4096)
	for mod in t.modules {
		sb.write_string('<h2 class="toc-module-title">${mod.title}</h2>')
		sb.write_string('<div class="toc-desc">${mod.description}</div>')
		for lesson in mod.lessons {
			sb.write_string('<div class="toc-lesson" data-slug="${lesson.slug}">')
			sb.write_string('<a class="toc-lesson-link" href="/${lesson.slug}/1">${lesson.title}</a>')
			sb.write_string('<div class="toc-lesson-desc">${lesson.description}</div>')
			sb.write_string('<ol class="toc-pages">')
			for i, page in lesson.pages {
				number := i + 1
				sb.write_string('<li><a href="/${lesson.slug}/${number}">${page.title}</a></li>')
			}
			sb.write_string('</ol></div>')
		}
	}
	return sb.str()
}

// view_files converts embedded example files into editor files.
fn view_files(files []content.CodeFile) []ViewFile {
	mut out := []ViewFile{}
	for f in files {
		out << ViewFile{
			name: f.name
			body: f.body
		}
	}
	return out
}

// view_link converts a navigation target, or produces an empty link when
// there is none.
fn view_link(ref ?tour.PageRef) ViewLink {
	p := ref or { return ViewLink{} }
	return ViewLink{
		slug:   p.lesson.slug
		number: p.number
		label:  p.page.title
	}
}

// embed_json renders a value as JSON safe to place inside a <script> element.
//
// A JSON island cannot be escaped by the template engine alone, because the
// danger is a literal `</script>` in the data, which would end the element
// early no matter how the surrounding quotes are escaped. Every `<` is
// therefore encoded as a JSON unicode escape, which decodes back to `<` on
// the other side and cannot terminate the element early.
//
// This is the one place a learner's text reaches the page, and it is the
// boundary worth being careful about: the code the browser will later POST
// back to /api/run arrives here.
// lt_escape, gt_escape and amp_escape are the JSON unicode escapes used to
// make a payload safe inside a <script> element.
const lt_escape = '\\u003c'
const gt_escape = '\\u003e'
const amp_escape = '\\u0026'

pub fn embed_json(raw string) string {
	mut sb := strings.new_builder(raw.len + 16)
	for c in raw {
		if c == u8(`<`) {
			sb.write_string(lt_escape)
		} else if c == u8(`>`) {
			sb.write_string(gt_escape)
		} else if c == u8(`&`) {
			sb.write_string(amp_escape)
		} else {
			sb.write_u8(c)
		}
	}
	return sb.str()
}
