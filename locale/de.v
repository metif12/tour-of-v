module locale

// Deutsch (German) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const de = Text{
	modules: {
		'mechanics':    'Das Tour verwenden'
		'basics':       'Grundtypen'
		'controlflow':  'Kontrollfluss'
		'moretypes':    'Weitere Typen'
		'optionresult': 'Option und Result'
		'methods':      'Methoden und Schnittstellen'
		'generics':     'Generics'
		'concurrency':  'Nebenläufigkeit'
	}
	lessons: {
		'welcome':      'Erste Schritte'
		'basics':       'Grundtypen'
		'controlflow':  'Kontrollfluss'
		'moretypes':    'Weitere Typen'
		'optionresult': 'Option und Result'
		'methods':      'Methoden und Schnittstellen'
		'generics':     'Generics'
		'concurrency':  'Nebenläufigkeit'
	}
	pages:   {}
	ui:      {
		'site_title':       'Eine Tour durch V'
		'toc':              'Inhaltsverzeichnis'
		'toggle_theme':     'Design wechseln'
		'language':         'Sprache'
		'run':              'Ausführen'
		'format':           'Formatieren'
		'reset':            'Zurücksetzen'
		'solution':         'Lösung'
		'output':           'Ausgabe'
		'help':             'Tastenkürzel'
		'help_close':       'Schließen'
		'run_program':      'Programm ausführen'
		'next_page':        'Nächste Seite'
		'prev_page':        'Vorherige Seite'
		'toggle_help':      'Diese Hilfe öffnen oder schließen'
		'move_panes':       'Zwischen Bereichen wechseln'
		'previous':         'Zurück'
		'next':             'Weiter'
		'resize_panes':     'Bereiche skalieren'
		'page_of':          '\${number} / \${total}'
		'no_program':       'Der Sandbox war kein Testprogramm vorhanden.'
		'compile_failed':   'Programm wurde nicht kompiliert.'
		'could_not_reach':  'Server nicht erreichbar: '
		'could_not_format': 'Dieses Programm konnte nicht formatiert werden.'
		'sandbox_busy':     'Die Sandbox ist ausgelastet. Bitte erneut versuchen.'
		'too_large':        'Diese Anfrage ist zu groß.'
		'no_compiler':      'Der Sandbox steht kein Compiler zur Verfügung.'
		'link_counterpart': 'Diese Seite auf \${language} lesen'
		'lang_other':       'Weitere Sprachen'
	}
}
