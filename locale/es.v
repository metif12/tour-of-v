module locale

// Español (Spanish) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const es = Text{
	modules: {
		'mechanics':    'Usar el tour'
		'basics':       'Tipos básicos'
		'controlflow':  'Flujo de control'
		'moretypes':    'Más tipos'
		'optionresult': 'Option y Result'
		'methods':      'Métodos e interfaces'
		'generics':     'Genéricos'
		'concurrency':  'Concurrencia'
	}
	lessons: {
		'welcome':      'Primeros pasos'
		'basics':       'Tipos básicos'
		'controlflow':  'Flujo de control'
		'moretypes':    'Más tipos'
		'optionresult': 'Option y Result'
		'methods':      'Métodos e interfaces'
		'generics':     'Genéricos'
		'concurrency':  'Concurrencia'
	}
	pages:   {}
	ui:      {
		'site_title':       'Un tour por V'
		'toc':              'Tabla de contenidos'
		'toggle_theme':     'Cambiar tema'
		'language':         'Idioma'
		'run':              'Ejecutar'
		'format':           'Formatear'
		'reset':            'Restablecer'
		'solution':         'Solución'
		'output':           'Salida'
		'help':             'Atajos de teclado'
		'help_close':       'Cerrar'
		'run_program':      'Ejecutar el programa'
		'next_page':        'Página siguiente'
		'prev_page':        'Página anterior'
		'toggle_help':      'Abrir o cerrar esta ayuda'
		'move_panes':       'Mover entre paneles'
		'previous':         'Anterior'
		'next':             'Siguiente'
		'resize_panes':     'Redimensionar paneles'
		'page_of':          '\${number} / \${total}'
		'no_program':       'El sandbox no contenía un programa de prueba.'
		'compile_failed':   'El programa no compiló.'
		'could_not_reach':  'No se pudo conectar con el servidor: '
		'could_not_format': 'No se pudo formatear este programa.'
		'sandbox_busy':     'El sandbox está ocupado. Inténtalo de nuevo.'
		'too_large':        'Esa solicitud es demasiado grande.'
		'no_compiler':      'El sandbox no tiene un compilador disponible.'
		'link_counterpart': 'Leer esta página en \${language}'
		'lang_other':       'Otros idiomas'
	}
}
