// Module `tour` turns the content modules into a navigable spine.
//
// The tour has three levels: module -> lesson -> page. Navigation does not
// stop at lesson boundaries, though. Prev and next walk one flat sequence
// of pages spanning every module, which is what lets a learner move through
// the tour without ever choosing what comes next.
module tour

import content

// PageRef addresses one page, uniquely.
pub struct PageRef {
pub:
	module_id string
	lesson    content.Lesson
	page      content.Page
	number    int // 1-based, within the lesson
	total     int // pages in this lesson
}

// prev returns the page before this one, or none at the very start.
pub fn (t &Tour) prev(ref PageRef) ?PageRef {
	idx := t.index_of(ref)
	if idx <= 0 {
		return none
	}
	return t.pages[idx - 1]
}

// next returns the page after this one, or none at the very end.
pub fn (t &Tour) next(ref PageRef) ?PageRef {
	idx := t.index_of(ref)
	if idx < 0 || idx >= t.pages.len - 1 {
		return none
	}
	return t.pages[idx + 1]
}

// index_of finds a page's position in the flat sequence.
//
// Resolution goes back through the tour rather than trusting the caller's
// pointers, so a stale or forged reference simply fails to match instead of
// pointing somewhere unexpected.
fn (t &Tour) index_of(ref PageRef) int {
	for i, candidate in t.pages {
		if candidate.module_id == ref.module_id
			&& candidate.lesson.slug == ref.lesson.slug
			&& candidate.number == ref.number {
			return i
		}
	}
	return -1
}

// resolve finds a lesson by slug and returns its requested page.
//
// A page number outside the lesson is an error rather than a clamp: the Go
// Tour rejects out-of-range page numbers so that stale and shared links
// behave predictably, and a silent clamp would make a link to page 999 of a
// 3 page lesson look like it worked.
pub fn (t &Tour) resolve(slug string, number int) !PageRef {
	for mod in t.modules {
		for lesson in mod.lessons {
			if lesson.slug != slug {
				continue
			}
			if number < 1 || number > lesson.pages.len {
				return error('no page ${number} in lesson "${slug}"')
			}
			return PageRef{
				module_id: mod.id
				lesson:    lesson
				page:      lesson.pages[number - 1]
				number:    number
				total:     lesson.pages.len
			}
		}
	}
	return error('no lesson "${slug}"')
}

// lesson_ref returns the first page of a lesson.
pub fn (t &Tour) lesson_ref(slug string) !PageRef {
	return t.resolve(slug, 1)
}

// has_lesson reports whether a slug is a real lesson.
pub fn (t &Tour) has_lesson(slug string) bool {
	for mod in t.modules {
		for lesson in mod.lessons {
			if lesson.slug == slug {
				return true
			}
		}
	}
	return false
}

// Tour is the assembled, navigable content.
pub struct Tour {
pub:
	modules []content.Module
	pages   []PageRef
}

// new_tour builds the tour from the content modules.
//
// It flattens the pages once, up front, so that navigation is a slice index
// rather than a search, and so that a broken lesson fails at startup instead
// of on the first click.
pub fn new_tour(mods []content.Module) &Tour {
	mut pages := []PageRef{}
	for mod in mods {
		for lesson in mod.lessons {
			total := lesson.pages.len
			for i, page in lesson.pages {
				pages << PageRef{
					module_id: mod.id
					lesson:    lesson
					page:      page
					number:    i + 1
					total:     total
				}
			}
		}
	}
	return &Tour{
		modules: mods
		pages:   pages
	}
}
