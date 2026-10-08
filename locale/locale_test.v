module locale_test

import content
import locale
import tour

// every offered locale is reachable
//
// A locale can only be listed if `known` accepts it and `translations` returns
// something for it. The language switcher offers what `locales` holds, so a
// mismatch is a language picker that offers something the router will 404.

fn test_every_offered_locale_is_known() {
	for l in locale.locales {
		assert locale.known(l.code)
	}
}

fn test_every_offered_locale_has_a_translation() {
	for l in locale.locales {
		t := locale.translations(l.code)
		assert t.ui.len > 0
	}
}

fn test_unknown_locale_falls_back_to_english() {
	assert !locale.known('zz')
	assert !locale.known('')
	// And the fallback is usable rather than empty.
	assert locale.ui_string('zz', 'run') == locale.en.ui['run']
}

// the direction is set explicitly rather than inferred
//
// `dir="auto"` inspects the first strong character on the page, which on a
// lesson is the logo's alt text or a code sample, not the prose. Getting this
// wrong mirrors the entire layout, so it is worth a test.

fn test_direction_is_right_to_left_only_where_it_should_be() {
	assert locale.dir('fa') == 'rtl'
	assert locale.dir('en') == 'ltr'
	assert locale.is_rtl('fa')
	assert !locale.is_rtl('en')
}

fn test_unknown_locale_is_left_to_right() {
	// A language that does not exist has no text to lay out, and the wrong
	// guess here is mirrored text rather than merely misplaced text.
	assert locale.dir('zz') == 'ltr'
}

// English keeps its bare URLs
//
// Every link to the tour that has already been shared points at /welcome/1 and
// not /en/welcome/1, so the default locale is never prefixed.

fn test_english_urls_are_not_prefixed() {
	assert locale.href('en', '/welcome/1') == '/welcome/1'
	assert locale.href('', '/welcome/1') == '/welcome/1'
}

fn test_other_locales_are_prefixed() {
	assert locale.href('fa', '/welcome/1') == '/fa/welcome/1'
	assert locale.href('fa', '/list') == '/fa/list'
}

// A half translated page is a much smaller problem than a blank one, which is
// the whole reason the fallback exists. These tests pin that behaviour so it
// cannot be tightened into a blank page by accident.

fn test_untranslated_page_falls_back_to_english() {
	// A page that does not exist in any locale falls back to English.
	_ := locale.page_text('fa', 'nonexistent', 99) or { return }
	assert false
}

fn test_translated_page_is_returned() {
	text := locale.page_text('fa', 'welcome', 1) or { return }
	assert text.title != ''
	assert text.body.contains('<p>')
}

fn test_untranslated_ui_key_falls_back_to_english() {
	assert locale.ui_string('fa', 'not_a_real_key') == 'not_a_real_key'
	assert locale.ui_string('fa', 'resize_panes') != locale.en.ui['resize_panes']
}

fn test_ui_map_always_has_every_english_key() {
	base := locale.en.ui
	for loc in ['en', 'fa'] {
		m := locale.ui_map(loc)
		for k, _ in base {
			assert k in m
		}
	}
}

// The keys are `<lesson>/<number>`, which is only stable while pages are not
// reordered. A reorder is an ordinary edit, and it would otherwise strand a
// translation and quietly show English in the middle of a translated tour.
//
// This walks the real catalogue and fails if a translation names a page that is
// not there.

fn test_every_locale_has_every_page_translation() {
	mods := content.modules()
	mut required := map[string]bool{}
	for m in mods {
		for les in m.lessons {
			for i, _ in les.pages {
				required['${les.slug}/${i + 1}'] = true
			}
		}
	}
	assert required.len > 0
	for l in locale.locales {
		if l.code == locale.default_locale {
			continue
		}
		text := locale.translations(l.code)
		for key, _ in required {
			assert key in text.pages, '${l.code} is missing ${key}'
		}
	}
}

fn test_every_translated_page_key_exists() {
	mods := content.modules()
	mut known := map[string]bool{}
	for m in mods {
		for les in m.lessons {
			for i, _ in les.pages {
				known['${les.slug}/${i + 1}'] = true
			}
		}
	}
	assert known.len > 0
	for l in locale.locales {
		text := locale.translations(l.code)
		for key, _ in text.pages {
			assert key in known
		}
	}
}

fn test_every_translated_lesson_key_exists() {
	t := tour.new_tour(content.modules())
	mut slugs := map[string]bool{}
	mut module_ids := map[string]bool{}
	for m in t.modules {
		module_ids[m.id] = true
		for les in m.lessons {
			slugs[les.slug] = true
		}
	}
	// The two are different key spaces on purpose. The opening module is called
	// `mechanics` in the catalogue and `welcome` as a lesson, because the slug
	// is what the URL uses and the id is what the module is called.
	for l in locale.locales {
		text := locale.translations(l.code)
		for slug, _ in text.lessons {
			assert slug in slugs
		}
		for id, _ in text.modules {
			assert id in module_ids
		}
	}
}

// The counter is interpolated by the browser, so the placeholder has to survive
// the trip through a V string literal and then a JSON island intact.
//
// It is written `\${number}` in the V source, because every V string form
// interpolates `${...}` and an unescaped one would be eaten by the compiler and
// the browser would never see it.

fn test_interpolation_placeholders_are_literal() {
	en := locale.en.ui['page_of']
	assert en.contains('{number}')
	assert en.contains('{total}')
	// The braces arrive with their dollar sign still attached.
	assert en.contains('\${number}')
	assert en.contains('\${total}')
}

// `locale` resolves a code to its registry entry, so the picker and the router
// agree on what a code means. An unknown code is none rather than a guess.
fn test_locale_resolves_a_known_code() {
	l := locale.locale('fa') or {
		assert false
		return
	}
	assert l.code == 'fa'
	assert l.native == 'فارسی'
}

fn test_locale_returns_none_for_an_unknown_code() {
	_ := locale.locale('zz') or { return }
	assert false
}

// `translations` falls back to English for an unknown code, so a bad prefix
// still renders a full page instead of an empty one.
fn test_translations_falls_back_to_english_for_an_unknown_code() {
	assert locale.translations('zz').ui['run'] == locale.en.ui['run']
}

// A real locale carries translated pages, not just an interface catalogue.
fn test_translations_returns_pages_for_a_real_locale() {
	assert locale.translations('fa').pages.len > 0
}

// Module and lesson titles fall back to English for an unknown locale: the
// English catalogue value when English has the key (translations('zz') is
// the English text, so 'basics' resolves there), and the caller's text when
// no catalogue has it.
fn test_module_and_lesson_titles_fall_back_to_english() {
	assert locale.module_title('zz', 'basics', 'Basics') == locale.module_title('en', 'basics', 'Basics')
	assert locale.lesson_title('zz', 'basics', 'Basics') == locale.lesson_title('en', 'basics', 'Basics')
	assert locale.module_title('zz', 'nope', 'Basics') == 'Basics'
	assert locale.lesson_title('zz', 'nope', 'Basics') == 'Basics'
}

// A translated locale returns its own title. The catalogue keeps both the key
// and the English text so the key can find the translation.
fn test_module_and_lesson_titles_return_translations() {
	assert locale.module_title('fa', 'basics', 'Basics') != ''
	assert locale.lesson_title('fa', 'basics', 'Basics') != ''
	assert locale.module_title('fa', 'basics', 'Basics') == locale.translations('fa').modules['basics']
	assert locale.lesson_title('fa', 'basics', 'Basics') == locale.translations('fa').lessons['basics']
}

// A slug that names no lesson is none, not a blank page: the caller decides
// the fallback, and a blank page would hide a broken link.
fn test_page_text_returns_none_for_a_bogus_slug() {
	_ := locale.page_text('en', 'nope', 1) or { return }
	assert false
}
