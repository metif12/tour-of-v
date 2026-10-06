module locale

// Português (Portuguese) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const pt = Text{
	modules: {
		'mechanics':    'Usar o tour'
		'basics':       'Tipos básicos'
		'controlflow':  'Fluxo de controle'
		'moretypes':    'Mais tipos'
		'optionresult': 'Option e Result'
		'methods':      'Métodos e interfaces'
		'generics':     'Genéricos'
		'concurrency':  'Concorrência'
	}
	lessons: {
		'welcome':      'Primeiros passos'
		'basics':       'Tipos básicos'
		'controlflow':  'Fluxo de controle'
		'moretypes':    'Mais tipos'
		'optionresult': 'Option e Result'
		'methods':      'Métodos e interfaces'
		'generics':     'Genéricos'
		'concurrency':  'Concorrência'
	}
	pages:   {}
	ui:      {
		'site_title':       'Um tour por V'
		'toc':              'Índice'
		'toggle_theme':     'Mudar tema'
		'language':         'Idioma'
		'run':              'Executar'
		'format':           'Formatar'
		'reset':            'Repor'
		'solution':         'Solução'
		'output':           'Saída'
		'help':             'Atalhos de teclado'
		'help_close':       'Fechar'
		'run_program':      'Executar o programa'
		'next_page':        'Página seguinte'
		'prev_page':        'Página anterior'
		'toggle_help':      'Abrir ou fechar esta ajuda'
		'move_panes':       'Mover entre painéis'
		'previous':         'Anterior'
		'next':             'Seguinte'
		'resize_panes':     'Redimensionar painéis'
		'page_of':          '\${number} / \${total}'
		'no_program':       'O sandbox não continha um programa de teste.'
		'compile_failed':   'O programa não compilou.'
		'could_not_reach':  'Não foi possível ligar ao servidor: '
		'could_not_format': 'Não foi possível formatar este programa.'
		'sandbox_busy':     'O sandbox está ocupado. Tente novamente.'
		'too_large':        'Esse pedido é demasiado grande.'
		'no_compiler':      'O sandbox não tem um compilador disponível.'
		'link_counterpart': 'Ler esta página em \${language}'
		'lang_other':       'Outros idiomas'
	}
}
