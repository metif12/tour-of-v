module locale

// Türkçe (Turkish) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const tr = Text{
	modules: {
		'mechanics':    'Turu kullanma'
		'basics':       'Temel türler'
		'controlflow':  'Kontrol akışı'
		'moretypes':    'Daha fazla tür'
		'optionresult': 'Option ve Result'
		'methods':      'Yöntemler ve arayüzler'
		'generics':     'Genel türler'
		'concurrency':  'Eşzamanlılık'
	}
	lessons: {
		'welcome':      'Başlarken'
		'basics':       'Temel türler'
		'controlflow':  'Kontrol akışı'
		'moretypes':    'Daha fazla tür'
		'optionresult': 'Option ve Result'
		'methods':      'Yöntemler ve arayüzler'
		'generics':     'Genel türler'
		'concurrency':  'Eşzamanlılık'
	}
	pages:   {}
	ui:      {
		'site_title':       'V Turu'
		'toc':              'İçindekiler'
		'toggle_theme':     'Tema değiştir'
		'language':         'Dil'
		'run':              'Çalıştır'
		'format':           'Biçimlendir'
		'reset':            'Sıfırla'
		'solution':         'Çözüm'
		'output':           'Çıktı'
		'help':             'Klavye kısayolları'
		'help_close':       'Kapat'
		'run_program':      'Programı çalıştır'
		'next_page':        'Sonraki sayfa'
		'prev_page':        'Önceki sayfa'
		'toggle_help':      'Bu yardımı aç veya kapat'
		'move_panes':       'Bölmeler arasında geç'
		'previous':         'Önceki'
		'next':             'Sonraki'
		'resize_panes':     'Bölmeleri yeniden boyutlandır'
		'page_of':          '\${number} / \${total}'
		'no_program':       'Kum kutusunda test programı yoktu.'
		'compile_failed':   'Program derlenmedi.'
		'could_not_reach':  'Sunucuya ulaşılamadı: '
		'could_not_format': 'Bu program biçimlendirilemedi.'
		'sandbox_busy':     'Kum kutusu meşgul. Lütfen tekrar deneyin.'
		'too_large':        'Bu istek çok büyük.'
		'no_compiler':      'Kum kutusunda kullanılabilir derleyici yok.'
		'link_counterpart': 'Bu sayfayı \${language} olarak oku'
		'lang_other':       'Diğer diller'
	}
}
