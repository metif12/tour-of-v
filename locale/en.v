module locale

// en is the source of truth for every interface string.
//
// Two rules make this usable as a fallback. Every string the interface shows
// appears here, so a locale that has not translated a key shows readable
// English rather than nothing. And the key is the English text nowhere: it is
// a short opaque name, so changing a string's wording does not silently orphan
// the translations that point at it.
pub const en = Text{
	modules: {
		'mechanics':    'Using the tour'
		'basics':       'Basic types'
		'controlflow':  'Control flow'
		'moretypes':    'More types'
		'optionresult': 'Option and Result'
		'methods':      'Methods and interfaces'
		'generics':     'Generics'
		'concurrency':  'Concurrency'
	}
	lessons: {
		'welcome':      'Getting started'
		'basics':       'Basic types'
		'controlflow':  'Control flow'
		'moretypes':    'More types'
		'optionresult': 'Option and Result'
		'methods':      'Methods and interfaces'
		'generics':     'Generics'
		'concurrency':  'Concurrency'
	}
	pages:   {}
	ui:      {
		'site_title':       'A Tour of V'
		'toc':              'Table of contents'
		'toggle_theme':     'Toggle theme'
		'language':         'Language'
		'run':              'Run'
		'format':           'Format'
		'reset':            'Reset'
		'solution':         'Solution'
		'output':           'Output'
		'help':             'Keyboard shortcuts'
		'help_close':       'Close'
		'run_program':      'Run the program'
		'next_page':        'Next page'
		'prev_page':        'Previous page'
		'toggle_help':      'Open or close this help'
		'move_panes':       'Move between panes'
		'previous':         'Previous'
		'next':             'Next'
		'resize_panes':     'Resize panes'
		'page_of':          '\${number} / \${total}'
		'not_written':      'Not written yet'
		'not_written_body': 'This lesson has not been written yet.'
		'no_program':       'The sandbox did not contain a test program.'
		'compile_failed':   'Program did not compile.'
		'could_not_reach':  'Could not reach the server: '
		'could_not_format': 'Could not format this program.'
		'sandbox_busy':     'The sandbox is busy. Please try again.'
		'too_large':        'That request is too large.'
		'no_compiler':      'The sandbox has no compiler available.'
		'link_counterpart': 'Read this page in \${language}'
		'lang_other':       'Other languages'
	}
}
