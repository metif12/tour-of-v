module main

import json2
import strings
import tour
import content
import locale

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
//
// `locale` is carried in the data rather than only in the URL, because the
// browser needs it to decide the direction of code and to label the language
// it is currently showing.
pub struct PageData {
pub:
	module_id string
	lesson    string
	locale    string
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
//
// `loc` is the locale to render titles in. Translations are applied here rather
// than by rewriting the tour, because the tour is shared by every concurrent
// request and mutating it to suit one language would be a data race.
pub fn build_toc(t &tour.Tour, loc string) string {
	mut sb := strings.new_builder(4096)
	for mod in t.modules {
		module_title := locale.module_title(loc, mod.id, mod.title)
		sb.write_string('<h2 class="toc-module-title">${module_title}</h2>')
		sb.write_string('<div class="toc-desc">${locale.lesson_title(loc, mod.id, mod.description)}</div>')
		for lesson in mod.lessons {
			sb.write_string('<div class="toc-lesson" data-slug="${lesson.slug}">')
			sb.write_string('<a class="toc-lesson-link" href="${locale.href(loc, '/${lesson.slug}/1')}">${locale.lesson_title(loc, lesson.slug, lesson.title)}</a>')
			sb.write_string('<div class="toc-lesson-desc">${lesson.description}</div>')
			sb.write_string('<ol class="toc-pages">')
			for i, page in lesson.pages {
				number := i + 1
				title := page_title(loc, lesson.slug, number, page.title)
				sb.write_string('<li><a href="${locale.href(loc, '/${lesson.slug}/${number}')}">${title}</a></li>')
			}
			sb.write_string('</ol></div>')
		}
	}
	return sb.str()
}

// page_title returns a page's title in the requested locale.
//
// Kept as its own function because the page view and the table of contents both
// need it, and they must agree: a title in the sidebar that differs from the
// heading on the page is the kind of inconsistency nobody notices until it is
// pointed out.
pub fn page_title(loc string, lesson string, number int, english string) string {
	if loc == '' || loc == locale.default_locale {
		return english
	}
	text := locale.page_text(loc, lesson, number) or { return english }
	if text.title == '' {
		return english
	}
	return text.title
}

// page_body returns a page's body in the requested locale.
pub fn page_body(loc string, lesson string, number int, english string) string {
	if loc == '' || loc == locale.default_locale {
		return english
	}
	text := locale.page_text(loc, lesson, number) or { return english }
	if text.body == '' {
		return english
	}
	return text.body
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

// link_view converts a navigation target, or produces an empty link when
// there is none.
//
// It is the only one of the two, because a pager that reads "previous" in the
// language you are reading is the whole point: a translated page whose pager
// drops you into English halfway through the tour is worse than an untranslated
// one. The title is translated and the slug is left alone, so the URL stays
// language neutral and the same page is reachable from either language.
pub fn link_view(ref ?tour.PageRef, loc string) ViewLink {
	p := ref or { return ViewLink{} }
	return ViewLink{
		slug:   p.lesson.slug
		number: p.number
		label:  page_title(loc, p.lesson.slug, p.number, p.page.title)
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

// UiStrings is the interface text one request needs, already resolved for a
// locale.
//
// It is a struct rather than a map because veb resolves a template variable
// from the enclosing function, so the names have to be spelled out somewhere.
// One struct with one constructor keeps the page view and the shared chrome
// from drifting into showing two different languages.
pub struct UiStrings {
pub mut:
	site        string
	toc         string
	theme       string
	help        string
	help_close  string
	language    string
	run         string
	format      string
	reset       string
	solution    string
	output      string
	resize      string
	prev        string
	next        string
	run_program string
	next_page   string
	prev_page   string
	toggle_help string
	move_panes  string
	not_found   string
}

// ui_for resolves the interface catalogue for a locale.
pub fn ui_for(loc string) UiStrings {
	return UiStrings{
		site:        locale.ui_string(loc, 'site_title')
		toc:         locale.ui_string(loc, 'toc')
		theme:       locale.ui_string(loc, 'toggle_theme')
		help:        locale.ui_string(loc, 'help')
		help_close:  locale.ui_string(loc, 'help_close')
		language:    locale.ui_string(loc, 'language')
		run:         locale.ui_string(loc, 'run')
		format:      locale.ui_string(loc, 'format')
		reset:       locale.ui_string(loc, 'reset')
		solution:    locale.ui_string(loc, 'solution')
		output:      locale.ui_string(loc, 'output')
		resize:      locale.ui_string(loc, 'resize_panes')
		prev:        locale.ui_string(loc, 'previous')
		next:        locale.ui_string(loc, 'next')
		run_program: locale.ui_string(loc, 'run_program')
		next_page:   locale.ui_string(loc, 'next_page')
		prev_page:   locale.ui_string(loc, 'prev_page')
		toggle_help: locale.ui_string(loc, 'toggle_help')
		move_panes:  locale.ui_string(loc, 'move_panes')
		not_found:   locale.ui_string(loc, 'not_found_title')
	}
}

// counter_text renders the page counter for a locale.
//
// The catalogue stores `${number} / ${total}` so a translator can reorder it,
// which is why Persian can say "۱ از ۵" rather than "1 / 5". The placeholders are
// substituted rather than interpolated because V would have eaten a literal
// `${` when the catalogue was compiled, so the dollar sign is put back here.
fn counter_text(loc string, number int, total int) string {
	mut s := locale.ui_string(loc, 'page_of')
	s = s.replace('$' + '{number}', number.str())
	s = s.replace('$' + '{total}', total.str())
	return s
}

// PageView is everything the lesson page template needs, already resolved for
// a locale.
pub struct PageView {
pub:
	page_data      PageData
	page_json      string
	has_code       bool
	has_solution   bool
	has_files_tabs bool
	has_tools      bool
	has_format     bool
	has_stdin      bool
	has_prev       bool
	has_next       bool
	prev_page      ViewLink
	next_page      ViewLink
	counter        string
	lang_prefix    string
	ui             UiStrings
}

// build_page_view resolves a lesson page and prepares everything the template
// needs.
pub fn build_page_view(t &tour.Tour, loc string, slug string, number int) !PageView {
	ref := t.resolve(slug, number) or { return error('not found') }

	heading := page_title(loc, ref.lesson.slug, ref.number, ref.page.title)
	prose := page_body(loc, ref.lesson.slug, ref.number, ref.page.body)

	example := ref.page.code or { content.Example{} }
	page_data := PageData{
		module_id: ref.module_id
		lesson:    ref.lesson.slug
		locale:    loc
		title:     heading
		number:    ref.number
		total:     ref.total
		body:      prose
		files:     view_files(example.files)
		solution:  view_files(example.solution)
		prev:      link_view(t.prev(ref), loc)
		next:      link_view(t.next(ref), loc)
	}

	has_code := page_data.files.len > 0
	prev_page := link_view(t.prev(ref), loc)

	return PageView{
		page_data:      page_data
		page_json:      embed_json(json2.encode(page_data))
		has_code:       has_code
		has_solution:   page_data.solution.len > 0
		has_files_tabs: page_data.files.len > 1
		has_tools:      has_code
		has_format:     has_code
		has_stdin:      false
		has_prev:       prev_page.slug != ''
		has_next:       page_data.next.slug != ''
		prev_page:      prev_page
		next_page:      page_data.next
		counter:        counter_text(loc, ref.number, ref.total)
		lang_prefix:    if loc == locale.default_locale { '' } else { '/' + loc }
		ui:             ui_for(loc)
	}
}
