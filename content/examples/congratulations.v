module main

// You have reached the end of the tour.
//
// Everything from here on is ordinary V: the same structs, the same functions,
// the same compiler you have been using. Keep going.

struct Tour {
mut:
	lessons  int
	pages    int
	examples int
}

fn (t &Tour) summary() string {
	return '${t.lessons} lessons, ${t.pages} pages, ${t.examples} programs run'
}

fn main() {
	t := Tour{
		lessons:  8
		pages:    45
		examples: 48
	}
	println(t.summary())

	methods := ['spawn', 'channels', 'select', 'lock'] as []string
	for m in methods {
		println('next: ${m}')
	}
}
