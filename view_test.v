module main

import content
import locale
import tour

// A JSON island inside a <script> element ends early on a literal `</script>`,
// no matter how the surrounding quotes are escaped, so every `<` must leave
// as a unicode escape that decodes back on the other side.
fn test_embed_json_escapes_less_than() {
	assert embed_json('<') == '\\u003c'
}

// `>` is escaped alongside `<` so a reflected payload cannot reassemble a tag
// by pairing an escaped `<` with a raw `>`.
fn test_embed_json_escapes_greater_than() {
	assert embed_json('>') == '\\u003e'
}

// `&` is escaped so an entity such as `&lt;` in lesson text cannot be mistaken
// for markup once the island is parsed.
fn test_embed_json_escapes_ampersand() {
	assert embed_json('&') == '\\u0026'
}

// Ordinary prose must pass through byte for byte: over-escaping would corrupt
// the code samples the editor is given.
fn test_embed_json_leaves_plain_text_untouched() {
	assert embed_json('hello world 123') == 'hello world 123'
	assert embed_json('') == ''
	assert embed_json('a<b>&c>d') == 'a\\u003cb\\u003e\\u0026c\\u003ed'
}

// This is the function's whole job: a literal closing script tag in the data
// must not survive, or the page's own JSON would terminate its element.
fn test_embed_json_neutralises_closing_script_tag() {
	r := embed_json('</script><script>alert(1)</script>')
	assert !r.contains('</script>')
	assert !r.contains('<')
	assert !r.contains('>')
}

fn real_tour() &tour.Tour {
	return tour.new_tour(content.modules())
}

// The default locale short-circuits without a catalogue lookup, so English
// pages never depend on the translation maps being populated.
fn test_page_title_returns_english_for_default_locale() {
	assert page_title('en', 'welcome', 1, 'Hello') == 'Hello'
	assert page_title('', 'welcome', 1, 'Hello') == 'Hello'
}

// An unknown locale falls back to English rather than a blank heading, which
// is what keeps a mistyped language prefix readable instead of empty.
fn test_page_title_falls_back_for_unknown_locale() {
	assert page_title('zz', 'welcome', 1, 'Hello') == 'Hello'
}

// A translated page shows its translation: the tour is offered in Persian, so
// this pins the wiring between the catalogue and the heading.
fn test_page_title_returns_fa_translation() {
	t := real_tour()
	ref := t.resolve('welcome', 1)!
	if text := locale.page_text('fa', 'welcome', 1) {
		assert text.title != ''
		assert page_title('fa', 'welcome', 1, ref.page.title) == text.title
	} else {
		assert false, 'expected an fa translation of welcome/1'
	}
}

// A stale or shared link names a page no translation knows; showing English
// beats showing nothing.
fn test_page_title_falls_back_for_bogus_lesson() {
	assert page_title('fa', 'no-such-lesson', 99, 'Fallback') == 'Fallback'
	assert page_body('fa', 'no-such-lesson', 99, 'Fallback body') == 'Fallback body'
}

// Bodies follow the same fallback contract as titles, or a translated heading
// would sit above untranslated prose with no rule saying which wins.
fn test_page_body_returns_fa_translation() {
	t := real_tour()
	ref := t.resolve('welcome', 1)!
	if text := locale.page_text('fa', 'welcome', 1) {
		assert text.body != ''
		assert page_body('fa', 'welcome', 1, ref.page.body) == text.body
	} else {
		assert false, 'expected an fa translation of welcome/1'
	}
}

// The first page has no previous target, and the template checks for an empty
// slug, so none must produce exactly that rather than a link to nowhere.
fn test_link_view_is_empty_for_none() {
	got := link_view(none, 'en')
	assert got.slug == ''
	assert got.number == 0
	assert got.label == ''
}

// The pager keeps the slug for the URL and translates only the label, so
// moving between pages never drops the reader into the wrong language.
fn test_link_view_preserves_slug_and_number() {
	t := real_tour()
	ref := t.resolve('welcome', 1)!
	got := link_view(ref, 'en')
	assert got.slug == ref.lesson.slug
	assert got.number == ref.number
	assert got.label == ref.page.title
	assert link_view(ref, 'fa').label == page_title('fa', 'welcome', 1, ref.page.title)
}

// Editor tabs are built 1:1 from the embedded files; a dropped or reordered
// file would show the learner source the server does not hold.
fn test_view_files_maps_names_and_bodies() {
	files := [
		content.CodeFile{ name: 'main.v', body: 'fn main() {}' },
		content.CodeFile{ name: 'lib.v', body: 'fn f() int { return 1 }' },
	]
	out := view_files(files)
	assert out.len == 2
	assert out[0].name == 'main.v'
	assert out[0].body == 'fn main() {}'
	assert out[1].name == 'lib.v'
	assert out[1].body == 'fn f() int { return 1 }'
	assert view_files([]content.CodeFile{}).len == 0
}

// The counter template lets translators reorder the placeholders, so the
// substitution has to happen here rather than in the template.
fn test_counter_text_shows_number_and_total_for_en() {
	assert counter_text('en', 2, 5) == '2 / 5'
	assert counter_text('en', 1, 12).contains('1')
	assert counter_text('en', 1, 12).contains('12')
}

// The page chrome and the lesson view resolve strings through one constructor,
// so a key renamed in one place cannot silently show two languages at once.
fn test_ui_for_matches_catalogue_in_english() {
	u := ui_for('en')
	assert u.site == locale.ui_string('en', 'site_title')
	assert u.run == locale.ui_string('en', 'run')
	assert u.toc == locale.ui_string('en', 'toc')
}

// Persian is a translated locale, so at least one wired key must actually
// differ from English or the switcher would be decorative.
fn test_ui_for_resolves_fa_where_translated() {
	en_u := ui_for('en')
	fa_u := ui_for('fa')
	assert fa_u.resize == locale.ui_string('fa', 'resize_panes')
	assert fa_u.resize != en_u.resize
}

// The table of contents is rendered in V because the template compiler cannot
// loop with a conditional inside; the hrefs must therefore already carry the
// locale prefix, or switching language would drop the reader on page one.
fn test_build_toc_lists_lessons_with_locale_hrefs() {
	t := real_tour()
	en := build_toc(t, 'en')
	assert en.contains('toc-module-title')
	assert en.contains('data-slug="welcome"')
	assert en.contains('/welcome/1')
	assert !en.contains('/fa/')
	fa := build_toc(t, 'fa')
	assert fa.contains('/fa/welcome/1')
}

// The JSON island must carry exactly what the server holds: the editor runs
// what it is given, so a title in the island that differs from the heading is
// a page that runs something other than what it shows.
fn test_build_page_view_happy_path() {
	t := real_tour()
	pv := build_page_view(t, 'en', 'basics', 1)!
	assert pv.has_code
	assert pv.counter != ''
	assert pv.counter.contains('1')
	ref := t.resolve('basics', 1)!
	assert pv.page_json.contains(ref.page.title)
	assert pv.page_data.title == ref.page.title
}

// A stale or shared link to a missing page is an error, not a clamp to some
// other page that merely looks like it worked.
fn test_build_page_view_rejects_unknown_page() {
	t := real_tour()
	if _ := build_page_view(t, 'en', 'nope', 99) {
		assert false, 'expected an error for an unknown page'
	} else {
	}
}
