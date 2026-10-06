module locale

// Bahasa Indonesia (Indonesian) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const id = Text{
	modules: {
		'mechanics':    'Menggunakan tur'
		'basics':       'Tipe dasar'
		'controlflow':  'Alur kendali'
		'moretypes':    'Lebih banyak tipe'
		'optionresult': 'Option dan Result'
		'methods':      'Metode dan antarmuka'
		'generics':     'Generik'
		'concurrency':  'Konkurensi'
	}
	lessons: {
		'welcome':      'Memulai'
		'basics':       'Tipe dasar'
		'controlflow':  'Alur kendali'
		'moretypes':    'Lebih banyak tipe'
		'optionresult': 'Option dan Result'
		'methods':      'Metode dan antarmuka'
		'generics':     'Generik'
		'concurrency':  'Konkurensi'
	}
	pages:   {}
	ui:      {
		'site_title':       'Tur V'
		'toc':              'Daftar isi'
		'toggle_theme':     'Ganti tema'
		'language':         'Bahasa'
		'run':              'Jalankan'
		'format':           'Format'
		'reset':            'Atur ulang'
		'solution':         'Solusi'
		'output':           'Keluaran'
		'help':             'Pintasan keyboard'
		'help_close':       'Tutup'
		'run_program':      'Jalankan program'
		'next_page':        'Halaman berikutnya'
		'prev_page':        'Halaman sebelumnya'
		'toggle_help':      'Buka atau tutup bantuan ini'
		'move_panes':       'Pindah antar panel'
		'previous':         'Sebelumnya'
		'next':             'Berikutnya'
		'resize_panes':     'Ubah ukuran panel'
		'page_of':          '\${number} / \${total}'
		'no_program':       'Sandbox tidak berisi program uji.'
		'compile_failed':   'Program tidak terkompilasi.'
		'could_not_reach':  'Tidak dapat terhubung ke server: '
		'could_not_format': 'Tidak dapat memformat program ini.'
		'sandbox_busy':     'Sandbox sedang sibuk. Silakan coba lagi.'
		'too_large':        'Permintaan itu terlalu besar.'
		'no_compiler':      'Sandbox tidak memiliki kompiler yang tersedia.'
		'link_counterpart': 'Baca halaman ini dalam \${language}'
		'lang_other':       'Bahasa lain'
	}
}
