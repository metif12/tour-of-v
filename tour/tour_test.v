module tour_test

import content
import tour

fn build() &tour.Tour {
	return tour.new_tour(content.modules())
}

fn test_catalog_has_every_lesson() {
	mods := content.modules()
	assert mods.len == 8
	slugs := mods.map(it.lessons[0].slug)
	assert slugs == ['welcome', 'basics', 'controlflow', 'moretypes', 'optionresult', 'methods',
		'generics', 'concurrency']
}

fn test_slugs_are_unique() {
	t := build()
	mut seen := map[string]bool{}
	for m in t.modules {
		for l in m.lessons {
			assert !seen[l.slug], 'duplicate lesson slug ${l.slug}'
			seen[l.slug] = true
		}
	}
}

fn test_module_ids_are_unique() {
	t := build()
	mut seen := map[string]bool{}
	for m in t.modules {
		assert !seen[m.id], 'duplicate module id ${m.id}'
		seen[m.id] = true
	}
}

fn test_every_lesson_has_at_least_one_page_and_a_title() {
	t := build()
	for m in t.modules {
		assert m.title != '' && m.description != ''
		assert m.lessons.len > 0
		for l in m.lessons {
			assert l.title != '' && l.description != ''
			assert l.pages.len > 0
			for p in l.pages {
				assert p.title != '' && p.body != ''
			}
		}
	}
}

// The examples are embedded with $embed_file, which silently produces an
// empty string if the path is wrong. This is the check that catches a
// renamed or moved example file.
fn test_every_embedded_example_is_present() {
	t := build()
	mut checked := 0
	for m in t.modules {
		for l in m.lessons {
			for p in l.pages {
				code := p.code or { continue }
				assert code.files.len > 0
				for f in code.files {
					assert f.name.ends_with('.v'), 'example name should be a .v file: ${f.name}'
					assert f.body != '', 'example ${f.name} embedded as empty'
					assert f.body.contains('fn main()'), 'example ${f.name} has no fn main()'
					checked++
				}
			}
		}
	}
	assert checked >= 15, 'expected at least 15 embedded examples, got ${checked}'
}

// Every page carries a program. The code panel is the tour's main surface, and
// a page without a program would drop it, which is why this is a hard rule
// rather than a style preference: add an example before removing the panel.
fn test_every_page_has_a_program() {
	t := build()
	mut without := 0
	for m in t.modules {
		for l in m.lessons {
			for p in l.pages {
				if (p.code or { content.Example{} }).files.len == 0 {
					without++
					println('page without a program: ${l.slug} / ${p.title}')
				}
			}
		}
	}
	assert without == 0, '${without} page(s) have no program, so the code panel is missing'
}

// Code examples must survive embedding byte for byte. A stray backslash or
// a resolved interpolation would show up here.
fn test_embedded_examples_keep_string_interpolation() {
	t := build()
	// Assembled at runtime: writing '${' in V source would open an
	// interpolation instead of producing those two characters.
	needle := '$' + '{'
	mut found := false
	for m in t.modules {
		for l in m.lessons {
			for p in l.pages {
				code := p.code or { continue }
				for f in code.files {
					if f.body.contains(needle) {
						found = true
					}
				}
			}
		}
	}
	assert found, 'no embedded example kept its dollar-brace interpolation intact'
}

fn test_resolve_finds_the_first_page() {
	t := build()
	ref := t.resolve('basics', 1)!
	assert ref.number == 1
	assert ref.lesson.slug == 'basics'
	assert ref.module_id == 'basics'
	assert ref.total == ref.lesson.pages.len
}

// resolves reports whether a page exists. V has no `is Err` for Result
// types, so unwrap in an if guard and map to a bool.
fn resolves(t &tour.Tour, slug string, n int) bool {
	return if _ := t.resolve(slug, n) { true } else { false }
}

fn has_prev(t &tour.Tour, r tour.PageRef) bool {
	return if _ := t.prev(r) { true } else { false }
}

fn has_next(t &tour.Tour, r tour.PageRef) bool {
	return if _ := t.next(r) { true } else { false }
}

fn test_resolve_rejects_out_of_range_pages() {
	t := build()
	assert !resolves(t, 'basics', 0)
	assert !resolves(t, 'basics', 999)
	assert !resolves(t, 'basics', -1)
}

fn test_resolve_rejects_unknown_lesson() {
	t := build()
	assert !resolves(t, 'nope', 1)
	assert !t.has_lesson('nope')
}

fn test_navigation_walks_the_whole_tour_in_one_line() {
	t := build()
	// Prev and next form a single sequence that crosses lesson and module
	// boundaries, rather than stopping at the end of each lesson.
	mut ref := t.pages[0]
	assert ref.lesson.slug == 'welcome'
	assert !has_prev(t, ref)

	mut seen := 0
	mut page := ref
	for candidate in t.pages {
		n := t.next(candidate) or { break }
		seen++
		page = n
	}
	assert seen == t.pages.len - 1
	assert !has_next(t, t.pages.last())
}

fn test_navigation_covers_every_page_exactly_once() {
	t := build()
	mut counts := map[string]int{}
	for ref in t.pages {
		key := '${ref.lesson.slug}/${ref.number}'
		counts[key]++
	}
	for key, n in counts {
		assert n == 1, 'page ${key} appears ${n} times'
	}
	assert counts.len == t.pages.len
}

fn test_page_numbers_are_local_to_their_lesson() {
	t := build()
	for ref in t.pages {
		assert ref.number >= 1 && ref.number <= ref.total
	}
}

fn test_the_deliberately_broken_example_is_the_only_one() {
	// Exactly one example is meant not to compile: the page that teaches
	// `mut`. If that changes, the prose on that page needs to change too.
	t := build()
	mut broken := 0
	for page_ref in t.pages {
		code := page_ref.page.code or { continue }
		for f in code.files {
			if f.body.contains('sum = sum + 10') && !f.body.contains('mut sum := 1') {
				broken++
			}
		}
	}
	assert broken == 1
}

// Page bodies are V strings, so a literal `${` in prose has to be written
// `&#36;{`. An unescaped one is normally a compile error, but it compiles
// happily when it names something in scope, and then the lesson silently loses
// the text it meant to show. This is the check for that case.
fn test_no_page_body_contains_an_unescaped_dollar_brace() {
	t := build()
	needle := '$' + '{'
	for ref in t.pages {
		assert !ref.page.body.contains(needle), 'page ${ref.lesson.slug}/${ref.number} ' +
			'has an unescaped dollar-brace: write it as &#36;{ instead'
	}
}

// The escaped form must survive all the way to the browser as a plain dollar
// brace, so a lesson can show V string interpolation without losing it.
fn test_escaped_dollar_brace_is_used_where_a_lesson_shows_interpolation() {
	t := build()
	mut found := false
	for ref in t.pages {
		if ref.page.body.contains('&#36;{') {
			found = true
		}
	}
	assert found, 'no lesson demonstrates interpolation, so the escaping is untested'
}

fn test_exercise_pages_carry_a_solution() {
	t := build()
	mut exercises := 0
	for page_ref in t.pages {
		code := page_ref.page.code or { continue }
		if code.solution.len == 0 {
			continue
		}
		exercises++
		assert code.solution.len == code.files.len
		for sf in code.solution {
			assert sf.body != ''
		}
	}
	assert exercises >= 1, 'expected at least one exercise with a solution'
}

// An example declares its module exactly once.
//
// `congratulations.v` shipped with two `module main` lines and the sandbox
// compiler rejected it with "unexpected keyword `module`", so the final page of
// the first lesson ran nothing. Nothing else in the suite notices: the example
// embeds fine, contains a `fn main()`, and the page has a program. Counting is
// cheap; compiling 66 programs in a unit test is not, so this pins the cheap
// half and CONTRIBUTING points at the other half.
fn test_every_example_declares_its_module_once() {
	t := build()
	for ref in t.pages {
		code := ref.page.code or { continue }
		for f in code.files {
			// Only declarations count. A mention inside a comment or a string
			// is not a second module clause, and the deliberately broken page
			// quotes this text while explaining its own error.
			mut declared := 0
			for raw_line in f.body.split_into_lines() {
				if raw_line.trim_space().starts_with('module ') {
					declared++
				}
			}
			// At most once. Not exactly once: `hello.v` is a bare program with
			// no module clause at all, which V allows.
			assert declared <= 1, 'example ${f.name} declares a module ' +
				'${declared} times, expected at most once'
		}
	}
}

// Send statements need a bracketed right-hand side.
//
// `ch <- i * i` does not send the product: the send expression stops at the
// arrow, so the compiler multiplies the void the send produced and reports
// "mismatched types `void` and `int literal`". The host compiler accepted it
// and the sandbox compiler did not, which is why the rule is asserted rather
// than left to review.
fn test_computed_sends_are_bracketed() {
	t := build()
	for ref in t.pages {
		code := ref.page.code or { continue }
		for f in code.files {
			for raw_line in f.body.split_into_lines() {
				line := raw_line.trim_space()
				// A line that is a comment, or a commented-out line, is prose
				// about the rule and cannot break it.
				if line.starts_with('//') {
					continue
				}
				if !line.contains('<-') {
					continue
				}
				// The text after the last arrow on the line.
				after := line.all_after_last('<-').trim_space()
				// Already bracketed, a bare value, or a string literal. A
				// string may contain any operator it likes: an interpolation
				// such as `ch <- 'value ${i + 1}'` is one operand.
				if after == '' || after.starts_with('(') || after.starts_with("'")
					|| after.starts_with('r') || after.starts_with('`') {
					continue
				}
				// An operator after an operand means the right hand side is
				// computed, so it has to be bracketed.
				if after.contains(' * ') || after.contains(' + ') || after.contains(' / ')
					|| after.contains(' - ') || after.contains(' % ') {
					assert false, 'example ${f.name} sends an unbracketed expression: ${line}'
				}
			}
		}
	}
}

fn test_main_file_picks_main_v() {
	e := content.Example{
		files: [
			content.CodeFile{ name: 'helper.v', body: 'fn main() {}' },
			content.CodeFile{ name: 'main.v', body: 'fn main() {}' },
		]
	}
	assert e.main_file() == 'main.v'
}

fn test_main_file_falls_back_to_first() {
	e := content.Example{
		files: [content.CodeFile{ name: 'only.v', body: 'fn main() {}' }]
	}
	assert e.main_file() == 'only.v'
}
