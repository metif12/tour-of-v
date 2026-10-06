module locale

// Bahasa Indonesia (Indonesian) translation.

pub const id = Text{
	modules: {
		'mechanics':    'Menggunakan tur'
		'basics':       'Tipe dasar'
		'controlflow':  'Alur kontrol'
		'moretypes':    'Tipe lainnya'
		'optionresult': 'Option dan Result'
		'methods':      'Metode dan antarmuka'
		'generics':     'Generik'
		'concurrency':  'Konkurensi'
	}
	lessons: {
		'welcome':      'Memulai'
		'basics':       'Tipe dasar'
		'controlflow':  'Alur kontrol'
		'moretypes':    'Tipe lainnya'
		'optionresult': 'Option dan Result'
		'methods':      'Metode dan antarmuka'
		'generics':     'Generik'
		'concurrency':  'Konkurensi'
	}
	pages:   {
		'welcome/1':       PageText{
			title: 'Halo, Dunia'
			body:  "<p>Selamat datang di tur <a href='https://vlang.io'>bahasa pemrograman V</a>.</p>
<p>Tur dibagi menjadi modul. Anda dapat mengaksesnya dari <a href='/list'>daftar isi</a> atau dengan tombol menu di kanan atas.</p>
<p>Sepanjang tur Anda akan menemukan slide dan latihan. Navigasi dengan tautan <b>sebelumnya</b> dan <b>berikutnya</b> di bawah teks, atau dengan tombol <code>PageUp</code> dan <code>PageDown</code>.</p>
<p>Tur ini interaktif. Tekan <b>Jalankan</b> (atau <code>Shift</code>+<code>Enter</code>) untuk mengkompilasi dan menjalankan program. Hasil muncul di bawah kode.</p>
<p>Program-program ini adalah titik awal untuk eksperimen Anda sendiri. Edit program dan jalankan lagi.</p>"
		}
		'welcome/2':       PageText{
			title: 'Menggunakan tur ini'
			body:  '<p>Setiap halaman memiliki kolom teks di kiri dan kolom kode di kanan. Di antaranya ada pegangan seret: seret untuk memberi lebih banyak ruang pada kode.</p>'
		}
		'welcome/3':       PageText{
			title: 'V offline (opsional)'
			body:  "<p>Anda tidak perlu instalasi V lokal untuk menggunakan tur ini, tetapi disarankan.</p>"
		}
		'welcome/4':       PageText{
			title: 'Sandbox'
			body:  '<p>Program Anda berjalan di sandbox pada server.</p>'
		}
		'welcome/5':       PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan modul pertama tur!</p>
<p>Kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan langsung dengan <a href='/basics/1'>dasar-dasar bahasa</a>.</p>"
		}
		'basics/1':        PageText{
			title: 'Modul'
			body:  '<h2>Modul</h2>'
		}
		'basics/2':        PageText{
			title: 'Imports'
			body:  '<h2>Imports</h2>'
		}
		'basics/3':        PageText{
			title: 'Variabel'
			body:  '<h2>Variabel</h2>'
		}
		'basics/4':        PageText{
			title: 'Variabel mutable'
			body:  '<h2>Variabel mutable</h2>'
		}
		'basics/5':        PageText{
			title: 'Deklarasi singkat'
			body:  '<h2>Deklarasi singkat</h2>'
		}
		'basics/6':        PageText{
			title: 'Fungsi'
			body:  '<h2>Fungsi</h2>'
		}
		'basics/7':        PageText{
			title: 'Hasil ganda'
			body:  '<h2>Hasil ganda</h2>'
		}
		'basics/8':        PageText{
			title: 'Tipe dasar'
			body:  '<h2>Tipe dasar</h2>'
		}
		'basics/9':        PageText{
			title: 'Nilai nol'
			body:  '<h2>Nilai nol</h2>'
		}
		'basics/10':       PageText{
			title: 'Konstanta'
			body:  '<h2>Konstanta</h2>'
		}
		'basics/11':       PageText{
			title: 'Konversi tipe'
			body:  '<h2>Konversi tipe</h2>'
		}
		'basics/12':       PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/controlflow/1'>alur kontrol</a>.</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For adalah "while" V'
			body:  '<h2>For adalah "while" V</h2>'
		}
		'controlflow/3':   PageText{
			title: 'For lanjutan'
			body:  '<h2>For lanjutan</h2>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':   PageText{
			title: 'If dengan nilai unwrapped'
			body:  '<h2>If dengan nilai unwrapped</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match dan tipe jumlah'
			body:  '<h2>Match dan tipe jumlah</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: 'Latihan: Loop dan Fungsi'
			body:  '<h2>Latihan: Loop dan Fungsi</h2>'
		}
		'controlflow/10':  PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/moretypes/1'>tipe lainnya</a>.</p>"
		}
		'moretypes/1':     PageText{
			title: 'Structs'
			body:  '<h2>Structs</h2>'
		}
		'moretypes/2':     PageText{
			title: 'Arrays'
			body:  '<h2>Arrays</h2>'
		}
		'moretypes/3':     PageText{
			title: 'Slices'
			body:  '<h2>Slices</h2>'
		}
		'moretypes/4':     PageText{
			title: 'Maps'
			body:  '<h2>Maps</h2>'
		}
		'moretypes/5':     PageText{
			title: 'Strings'
			body:  '<h2>Strings</h2>'
		}
		'moretypes/6':     PageText{
			title: 'Metode'
			body:  '<h2>Metode</h2>'
		}
		'moretypes/7':     PageText{
			title: 'Latihan: Penghitungan Kata'
			body:  '<h2>Latihan: Penghitungan Kata</h2>'
		}
		'moretypes/8':     PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/optionresult/1'>penanganan ketiadaan dan kegagalan</a>.</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result dan error'
			body:  '<h2>Result dan error</h2>'
		}
		'optionresult/3':  PageText{
			title: 'Latihan: Options'
			body:  '<h2>Latihan: Options</h2>'
		}
		'optionresult/4':  PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/methods/1'>metode dan antarmuka</a>.</p>"
		}
		'methods/1':       PageText{
			title: 'Antarmuka'
			body:  '<h2>Antarmuka</h2>'
		}
		'methods/2':       PageText{
			title: 'Embedding'
			body:  '<h2>Embedding</h2>'
		}
		'methods/3':       PageText{
			title: 'Tipe yang dapat dicetak'
			body:  '<h2>Tipe yang dapat dicetak</h2>'
		}
		'methods/4':       PageText{
			title: 'Latihan: Bentuk'
			body:  '<h2>Latihan: Bentuk</h2>'
		}
		'methods/5':       PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/generics/1'>generik</a>.</p>"
		}
		'generics/1':      PageText{
			title: 'Fungsi generik'
			body:  '<h2>Fungsi generik</h2>'
		}
		'generics/2':      PageText{
			title: 'Struct generik'
			body:  '<h2>Struct generik</h2>'
		}
		'generics/3':      PageText{
			title: 'Map tipe generik'
			body:  '<h2>Map tipe generik</h2>'
		}
		'generics/4':      PageText{
			title: 'Beberapa parameter tipe'
			body:  '<h2>Beberapa parameter tipe</h2>'
		}
		'generics/5':      PageText{
			title: 'Latihan: Generik'
			body:  '<h2>Latihan: Generik</h2>'
		}
		'generics/6':      PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/concurrency/1'>konkurensi</a>.</p>"
		}
		'concurrency/1':   PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':   PageText{
			title: 'Channels'
			body:  '<h2>Channels</h2>'
		}
		'concurrency/3':   PageText{
			title: 'Channel buffer'
			body:  '<h2>Channel buffer</h2>'
		}
		'concurrency/4':   PageText{
			title: 'Menerima sampai ditutup'
			body:  '<h2>Menerima sampai ditutup</h2>'
		}
		'concurrency/5':   PageText{
			title: 'Penutupan'
			body:  '<h2>Penutupan</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: 'Status bersama'
			body:  '<h2>Status bersama</h2>'
		}
		'concurrency/8':   PageText{
			title: 'Grup tunggu'
			body:  '<h2>Grup tunggu</h2>'
		}
		'concurrency/9':   PageText{
			title: 'Latihan: Worker pool'
			body:  '<h2>Latihan: Worker pool</h2>'
		}
		'concurrency/10':  PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini, dan dengan itu seluruh tur!</p>
<p>Kembali ke <a href='/list'>daftar modul</a> untuk membaca ulang apa pun, atau mulai lagi dari <a href='/welcome/1'>memulai</a>.</p>"
		}
	}
	ui:      {
		'site_title':       'Tur V'
		'toc':              'Daftar isi'
		'toggle_theme':     'Ganti tema'
		'language':         'Bahasa'
		'run':              'Jalankan'
		'format':           'Format'
		'reset':            'Reset'
		'solution':         'Solusi'
		'output':           'Keluaran'
		'help':             'Pintasan keyboard'
		'help_close':       'Tutup'
		'run_program':      'Jalankan program'
		'next_page':        'Halaman berikutnya'
		'prev_page':        'Halaman sebelumnya'
		'toggle_help':      'Buka atau tutup bantuan ini'
		'move_panes':       'Berpindah antar panel'
		'previous':         'Sebelumnya'
		'next':             'Berikutnya'
		'resize_panes':     'Ubah ukuran panel'
		'page_of':          '\${number} / \${total}'
		'no_program':       'Sandbox tidak berisi program uji.'
		'compile_failed':   'Program tidak terkompilasi.'
		'could_not_reach':  'Tidak dapat menghubungi server: '
		'could_not_format': 'Tidak dapat memformat program ini.'
		'sandbox_busy':     'Sandbox sedang sibuk. Coba lagi.'
		'too_large':        'Permintaan ini terlalu besar.'
		'no_compiler':      'Sandbox tidak memiliki kompiler.'
		'link_counterpart': 'Baca halaman ini dalam \${language}'
		'lang_other':       'Bahasa lain'
	}
}
