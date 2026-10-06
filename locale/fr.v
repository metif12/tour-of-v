module locale

// Français (French) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const fr = Text{
	modules: {
		'mechanics':    'Utiliser le tour'
		'basics':       'Types de base'
		'controlflow':  'Flux de contrôle'
		'moretypes':    'Plus de types'
		'optionresult': 'Option et Result'
		'methods':      'Méthodes et interfaces'
		'generics':     'Génériques'
		'concurrency':  'Concurrence'
	}
	lessons: {
		'welcome':      'Premiers pas'
		'basics':       'Types de base'
		'controlflow':  'Flux de contrôle'
		'moretypes':    'Plus de types'
		'optionresult': 'Option et Result'
		'methods':      'Méthodes et interfaces'
		'generics':     'Génériques'
		'concurrency':  'Concurrence'
	}
	pages:   {}
	ui:      {
		'site_title':       'Un tour de V'
		'toc':              'Table des matières'
		'toggle_theme':     'Changer de thème'
		'language':         'Langue'
		'run':              'Exécuter'
		'format':           'Formater'
		'reset':            'Réinitialiser'
		'solution':         'Solution'
		'output':           'Sortie'
		'help':             'Raccourcis clavier'
		'help_close':       'Fermer'
		'run_program':      'Exécuter le programme'
		'next_page':        'Page suivante'
		'prev_page':        'Page précédente'
		'toggle_help':      'Ouvrir ou fermer cette aide'
		'move_panes':       'Se déplacer entre les panneaux'
		'previous':         'Précédent'
		'next':             'Suivant'
		'resize_panes':     'Redimensionner les panneaux'
		'page_of':          '\${number} / \${total}'
		'no_program':       'Le sandbox ne contenait pas de programme de test.'
		'compile_failed':   "Le programme n'a pas compilé."
		'could_not_reach':  'Impossible de joindre le serveur : '
		'could_not_format': 'Impossible de formater ce programme.'
		'sandbox_busy':     'Le sandbox est occupé. Veuillez réessayer.'
		'too_large':        'Cette requête est trop grande.'
		'no_compiler':      "Le sandbox n'a pas de compilateur disponible."
		'link_counterpart': 'Lire cette page en \${language}'
		'lang_other':       'Autres langues'
	}
}
