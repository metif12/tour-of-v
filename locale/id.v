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
		'welcome/1':      PageText{
			title: 'Halo, Dunia'
			body:  "<p>Selamat datang di tur <a href='https://vlang.io'>bahasa pemrograman V</a>.</p>
<p>Tur dibagi menjadi modul. Anda dapat mengaksesnya dari <a href='/list'>daftar isi</a> atau dengan tombol menu di kanan atas.</p>
<p>Sepanjang tur Anda akan menemukan slide dan latihan. Navigasi dengan tautan <b>sebelumnya</b> dan <b>berikutnya</b> di bawah teks, atau dengan tombol <code>PageUp</code> dan <code>PageDown</code>.</p>
<p>Tur ini interaktif. Tekan <b>Jalankan</b> (atau <code>Shift</code>+<code>Enter</code>) untuk mengkompilasi dan menjalankan program. Hasil muncul di bawah kode.</p>
<p>Program-program ini adalah titik awal untuk eksperimen Anda sendiri. Edit program dan jalankan lagi.</p>"
		}
		'welcome/2':      PageText{
			title: 'Menggunakan tur ini'
			body:  '<p>Setiap halaman memiliki kolom teks di kiri dan kolom kode di kanan. Di antaranya ada pegangan seret: seret untuk memberi lebih banyak ruang pada kode.</p>'
		}
		'welcome/3':      PageText{
			title: 'V offline (opsional)'
			body:  '<p>Anda tidak perlu instalasi V lokal untuk menggunakan tur ini, tetapi disarankan.</p>'
		}
		'welcome/4':      PageText{
			title: 'Sandbox'
			body:  '<p>Program Anda berjalan di sandbox pada server.</p>'
		}
		'welcome/5':      PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan modul pertama tur!</p>
<p>Kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan langsung dengan <a href='/basics/1'>dasar-dasar bahasa</a>.</p>"
		}
		'basics/1':       PageText{
			title: 'Modul'
			body:  "<h2>Modul</h2>
<p>Setiap berkas V mendeklarasikan <em>modul</em> tempatnya berada. Deklarasi itu hal pertama dalam berkas.</p>
<p>Program dimulai di modul bernama <code>main</code>, dalam fungsi bernama <code>main</code>.</p>
<p>Program ini memakai modul pustaka standar <code>math</code> dan <code>strings</code>.</p>
<p>Di V ada satu modul per direktori, dan nama modul cocok dengan direktorinya. Sebuah simbol hanya terlihat di luar modulnya jika ditandai <code>pub</code>.</p>"
		}
		'basics/2':       PageText{
			title: 'Imports'
			body:  "<h2>Imports</h2>
<p>Modul yang diimpor membawa nama-nama yang diekspor ke berkas saat ini.</p>
<p>Pustaka standar diimpor dengan nama modul: <code>import math</code>, <code>import strings</code>. Pustaka pihak ketiga diimpor dengan cara sama.</p>
<p>Tidak setiap operasi dalam modul ditulis sebagai pemanggilan fungsi. Ada yang berupa _metode_ pada nilai, jadi <code>s.to_upper()</code> bekerja pada string tanpa impor apa pun.</p>
<p>Kedua gaya muncul di seluruh pustaka standar, jadi ada baiknya membaca tanda tangannya daripada menebak.</p>"
		}
		'basics/3':       PageText{
			title: 'Variabel'
			body:  "<h2>Variabel</h2>
<p>Jalankan kodenya. Perhatikan pesan kesalahannya.</p>
<p>Variabel V dideklarasikan dengan <code>:=</code>. Berbeda dengan kebanyakan bahasa, variabel di V <em>tak berubah secara bawaan</em>, dan mutabilitas harus diminta eksplisit.</p>
<p>Kompilator mengatakan hal yang sama. Baris 6 mencoba memberi nilai pada <code>sum</code> tanpa meminta izin.</p>
<p>Untuk memperbaiki kesalahan itu, tambahkan <code>mut</code> pada deklarasi di baris 4, dan coba lagi.</p>"
		}
		'basics/4':       PageText{
			title: 'Variabel mutable'
			body:  "<h2>Variabel mutable</h2>
<p>Untuk mendeklarasikan variabel yang bisa berubah, tambahkan kata kunci <code>mut</code> sebelum namanya.</p>
<p>V menuntut ini karena mutasi adalah sesuatu yang harus dimaksudkan. Variabel yang tak pernah diberi nilai ulang lebih mudah dianalisis kompiler, dan lebih mudah untukmu saat kembali ke kode nanti.</p>
<p>Hapus <code>mut</code>-nya dan jalankan lagi. Itulah kesalahan dari halaman sebelumnya.</p>
<p>Kamu akan melihat <code>mut</code> di mana-mana di V, termasuk pada parameter fungsi dan field struct.</p>"
		}
		'basics/5':       PageText{
			title: 'Deklarasi singkat'
			body:  "<h2>Deklarasi singkat</h2>
<p><code>:=</code> mendeklarasikan variabel dan menyimpulkan tipenya dari nilainya.</p>
<p>Bila tipenya tak jelas, atau bila kamu ingin spesifik, namai langsung dengan _konversi_ seperti <code>i64(42)</code> atau <code>f64(1.5)</code>.</p>
<p>Tidak ada bentuk terpisah «deklarasi sekarang, beri nilai nanti». Variabel V selalu punya nilai pada titik ia masuk scope, maka nilai nol yang akan kamu temui di halaman nanti diproduksi kompiler, bukan olehmu.</p>"
		}
		'basics/6':       PageText{
			title: 'Fungsi'
			body:  "<h2>Fungsi</h2>
<p>Fungsi dideklarasikan dengan <code>fn</code>.</p>
<p>Fungsi boleh mengambil nol atau lebih parameter. Parameter ditulis dengan nama dan tipe, dan parameter berurutan dengan tipe sama ditulis sebagai <code>x, y int</code>.</p>
<p>Hasil fungsi dinamai setelah daftar parameter. Fungsi V mengembalikan tepat satu nilai, kecuali tipe kembaliannya tuple.</p>
<p>Fungsi yang badannya satu ekspresi bisa ditulis sebaris: <code>fn double(x int) int { return x * 2 }</code></p>"
		}
		'basics/7':       PageText{
			title: 'Hasil ganda'
			body:  "<h2>Hasil ganda</h2>
<p>Fungsi bisa mengembalikan lebih dari satu nilai. Tulis tipe kembaliannya sebagai tuple:</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>Pemanggil menguraikannya ke variabel:</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>Tipe kembalian sekadar mendaftar tiap nilai, dan pemanggil menguraikannya ke variabel. Nilai yang tak dibutuhkan diabaikan dengan <code>_</code>.</p>
<p>Inilah bentuk yang akan kamu lihat untuk apa pun yang bisa gagal, yang dibahas di modul berikutnya.</p>"
		}
		'basics/8':       PageText{
			title: 'Tipe dasar'
			body:  "<h2>Tipe dasar</h2>
<p>Nilai boolean adalah <code>true</code> dan <code>false</code>.</p>
<p>Integer hadir dalam ukuran tetap, <code>i8</code>, <code>i16</code>, <code>i32</code> dan <code>i64</code>, serta ukuran unsigned <code>u8</code> sampai <code>u64</code>. <code>int</code> sendiri 32 bit, dan <code>isize</code> adalah lebar platform, jadi namai <code>i32</code> atau <code>i64</code> bila lebarnya penting.</p>
<p>Tipe floating point adalah <code>f32</code> dan <code>f64</code>.</p>
<p><code>rune</code> menampung satu titik kode Unicode.</p>
<p>String tak berubah dan ditulis dengan kutip tunggal.</p>"
		}
		'basics/9':       PageText{
			title: 'Nilai nol'
			body:  "<h2>Nilai nol</h2>
<p>Setiap tipe punya <em>nilai nol</em>, yaitu yang dipegang variabel sebelum apa pun diberikan padanya.</p>
<p>Nilai nol adalah <code>0</code> untuk angka, <code>false</code> untuk boolean, string kosong untuk string, dan koleksi kosong untuk array, slice dan map.</p>
<p>Untuk struct, nilai nol adalah struct dengan semua field-nya pada nilai nolnya.</p>
<p>Karena V menuntut nilai pada titik deklarasi, kamu jarang menulisnya sendiri. Kompiler memproduksinya untukmu, maka contoh di bawah terkompilasi walau sisi kanannya tampak berlebihan.</p>"
		}
		'basics/10':      PageText{
			title: 'Konstanta'
			body:  "<h2>Konstanta</h2>
<p><code>const</code> adalah nilai yang diketahui kompiler saat membangun programmu, jadi harus berupa ekspresi konstan.</p>
<p>Konstanta ditulis dengan <code>const</code>, satu per satu atau berkelompok dalam kurung.</p>
<p>Berbeda dengan <code>final</code> di beberapa bahasa, memakai ulang nama <code>const</code> untuk variabel hanya menghasilkan peringatan kompiler. Perlakukan peringatan itu sebagai kesalahan: bila sebuah nama konstan, ia harus tetap konstan di mana-mana.</p>"
		}
		'basics/11':      PageText{
			title: 'Konversi tipe'
			body:  "<h2>Konversi tipe</h2>
<p>V tak pernah mengonversi tipe secara implisit. Berpindah dari satu ke lain selalu ditulis:</p>
<pre><code>fl := f64(i)</code></pre>
<p>Sebagian konversi kehilangan informasi dan sebagian ditolak mentah-mentah, jadi kompiler akan memberitahumu bila konversi tak masuk akal.</p>
<p>String bukan angka. Untuk membacanya sebagai angka, konversikan, dan ingat hasilnya bisa jadi nilai nol bila teksnya tak terurai.</p>
<p>Kamu juga bisa menanyakan nama tipe pada kompiler dengan <code>typeof(x).name</code>.</p>"
		}
		'basics/12':      PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/controlflow/1'>alur kontrol</a>.</p>"
		}
		'basics/13':      PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/controlflow/1'>alur kontrol</a>.</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  "<h2>For</h2>
<p>V punya satu kata kunci loop, dan hadir dalam tiga bentuk.</p>
<p>Bentuk berhitungnya tampak seperti C:</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>Kondisi sendirian adalah loop while, dan tanpa kondisi sama sekali mengulang selamanya.</p>
<p><code>break</code> keluar dari loop dan <code>continue</code> melompat ke iterasi berikut.</p>
<p>Coba ubah loop agar menghitung mundur dari 5, bukan naik sampai 3, lalu jalankan lagi.</p>"
		}
		'controlflow/2':  PageText{
			title: 'For adalah "while" V'
			body:  "<h2>For adalah «while» V</h2>
<p><code>for</code> dengan satu kondisi terus berjalan sampai kondisi itu salah.</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p><code>for</code> tanpa kondisi sama sekali adalah <em>loop tak berujung</em>:</p>
<pre><code>for {</code></pre>
<p>Contoh keluar dari loop kedua setelah tiga iterasi. Bila kamu menghapus <code>if</code> dan <code>break</code>-nya, sandbox akan menghentikan program saat jatah CPU-nya habis.</p>"
		}
		'controlflow/3':  PageText{
			title: 'For lanjutan'
			body:  "<h2>For lanjutan</h2>
<p>Mengulang koleksi memakai <code>in</code>, bukan indeks. Inilah bentuk yang harus dijangkau secara bawaan, karena ia tak bisa keluar batas.</p>
<pre><code>for i, v in items {</code></pre>
<p>Pakai <code>_</code> untuk mengabaikan indeks:</p>
<pre><code>for _, v in items {</code></pre>
<p>Untuk mengulang sekian kali yang diketahui, pakai rentang: <code>for i in 0 .. n</code>. Perhatikan <code>..</code> itu eksklusif: ia berjalan <code>n</code> kali, dari <code>0</code> sampai <code>n-1</code>.</p>
<p>Map memberikan kunci dan nilainya.</p>"
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  "<h2>If</h2>
<p><code>if</code> ditulis begini:</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>Tidak ada kondisi dalam kurung, dan tidak ada kata kunci <code>then</code>.</p>
<p>Karena <code>if</code> adalah ekspresi yang bisa mengembalikan nilai, pola di atas itu idiomatis: tangani kasus menarik dan kembalilah dini, lalu lanjut ke yang biasa.</p>
<p>Pakai <code>else if</code> untuk rantai pengujian. V menerima setiap cabang apa adanya, jadi periksa rantainya sendiri: cabang yang pengujiannya tak pernah bisa benar sederhananya tak pernah jalan, dan kompiler tak akan menunjukkannya.</p>"
		}
		'controlflow/5':  PageText{
			title: 'If dengan nilai unwrapped'
			body:  "<h2>If dengan nilai unwrapped</h2>
<p>Fungsi V bisa mengembalikan nilai <em>atau</em> kesalahan. Tipe kembaliannya ditulis dengan <code>!</code> di depannya:</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>Di dalam badan, <code>return</code>-kan nilai biasa dan V membungkusnya untukmu. Untuk gagal, kembalikan <code>error(...)</code> sebagai gantinya.</p>
<p>Di sisi pemanggil, <code>if</code> bisa membuka hasilnya. Nilai sukses terikat ke <code>v</code>, dan bila ada kesalahan, cabang <code>else</code> berjalan dengan kesalahan terikat ke <code>err</code>:</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>Jalankan dua kali. Panggilan pertama sukses dan yang kedua tidak, dan keduanya mengambil cabang yang kamu harapkan.</p>
<p>Begini kebanyakan kode V menangani hal yang bisa salah. <a href='/optionresult/1'>Modul berikut</a> membahasnya dengan benar.</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  "<h2>Match</h2>
<p>V tidak punya kata kunci <code>switch</code>. Ia punya <code>match</code>, yang mencakup lebih banyak kasus daripada switch biasa.</p>
<p>Cocokkan nilai:</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>Cocokkan rentang. Rentang dalam <code>match</code> <em>inklusif</em> di kedua ujung, kebalikan dari <code>..</code> yang kamu pakai di <code>for</code>:</p>
<pre><code>1 ... 3 { }</code></pre>
<p>Cocokkan enum. Setiap nilai butuh cabang, atau <code>match</code>-nya butuh <code>else</code>, jadi nilai baru tak bisa ditambahkan tanpa kompiler menunjuk setiap <code>match</code> yang perlu dimutakhirkan.</p>"
		}
		'controlflow/7':  PageText{
			title: 'Match dan tipe jumlah'
			body:  "<h2>Match dan tipe jumlah</h2>
<p><em>Tipe jumlah</em> dideklarasikan dengan <code>=</code> dan daftar alternatif:</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>Nilai dari tipe itu tepat satu dari alternatif, tak pernah lebih dari satu.</p>
<p>Mencocokkannya memberitahu yang mana. Di dalam cabang, variabel aslinya di-<em>cast cerdas</em> ke varian itu, jadi field-nya tersedia langsung tanpa casting apa pun.</p>
<p>Setiap alternatif butuh cabang, atau match butuh <code>else</code>. Kompiler menegakkannya, jadi alternatif baru tak bisa diabai diam-diam.</p>
<p>Coba tambah bentuk keempat ke tipe jumlah dan jalankan. Kompiler akan memberitahumu tepat pernyataan <code>match</code> mana yang terlewat.</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  "<h2>Defer</h2>
<p><code>defer</code> menjadwalkan pernyataan untuk berjalan saat blok pembungkus keluar.</p>
<p>Ia berjalan bagaimanapun blok keluar: dengan mencapai akhir, dengan <code>return</code> dini, atau saat melepas dari panic. Itulah yang membuatnya berguna untuk beres-beres.</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>Dalam contoh, <code>with_defer</code> menjalankan badannya, lalu pernyataan yang ditunda. <code>early_return</code> kembali di tengah, dan pernyataan yang ditunda tetap berjalan.</p>"
		}
		'controlflow/9':  PageText{
			title: 'Latihan: Loop dan Fungsi'
			body:  "<h2>Latihan: Loop dan Fungsi</h2>
<p>Tulis <code>sum_to</code> agar mengembalikan jumlah angka dari <code>0</code> sampai <code>n</code>, dan <code>sum_squares</code> agar mengembalikan jumlah kuadratnya.</p>
<p>Kerjakan dua kali: sekali dengan cara paling langsung, dan sekali dengan loop <code>for</code> eksplisit.</p>
<p>Lalu tulis ulang keduanya agar berjalan dalam waktu <em>O(1)</em>.</p>
<p>Tekan <b>Solution</b> bila sudah mencoba, atau bila buntu.</p>"
		}
		'controlflow/10': PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/moretypes/1'>tipe lainnya</a>.</p>"
		}
		'moretypes/1':    PageText{
			title: 'Structs'
			body:  "<h2>Structs</h2>
<p><em>struct</em> mengelompokkan nilai di bawah satu nama. Ini cara V mengatakan «ini saling berkaitan».</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>Nilai dibuat dengan <code>Point{ x: 3, y: 4 }</code>, dan field dibaca dengan <code>p.x</code>.</p>
<p>Dua hal yang patut diperhatikan.</p>
<p>Pertama, struct bisa mencetak dirinya, jadi <code>println(p)</code> menunjukkan setiap field tanpa kerja ekstra.</p>
<p>Kedua, mutabilitas bekerja sama seperti pada variabel biasa. Variabelnya butuh <code>mut</code>:</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>dan field-nya sendiri harus dideklarasikan di bawah <code>mut</code> dalam struct:</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p>Field yang tidak di bawah <code>mut</code> sama sekali tak bisa diberi nilai. Ia masih bisa dibaca, dilewatkan, dan disalin.</p>
<p>Coba hapus <code>mut:</code> dari struct dan jalankan contohnya. Kompiler akan menunjuk baris yang memberi nilai pada <code>x</code>.</p>"
		}
		'moretypes/2':    PageText{
			title: 'Arrays'
			body:  "<h2>Arrays</h2>
<p>Array panjangnya tetap, dan tipe elemennya berasal dari elemen pertama:</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>Array juga bisa dibuat dengan panjang dan nilai awal:</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>Array diindeks dengan <code>[]</code>, dan membawa panjangnya:</p>
<pre><code>println(numbers.len)</code></pre>
<p>Bila dua nilai tak boleh berbagi isinya, mintalah salinan eksplisit dengan <code>clone</code>:</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>Capailah setiap kali kamu melewatkan koleksi ke sesuatu yang tak boleh mengubahnya, karena ia mengatakannya pada titik pakai daripada mengandalkan aturan yang harus diingat.</p>
<p>Transformasi biasa adalah metode, bukan fungsi bebas:</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> berarti elemen saat ini.</p>"
		}
		'moretypes/3':    PageText{
			title: 'Slices'
			body:  "<h2>Slices</h2>
<p>Slice adalah tampilan ke rentang array atau slice lain, ditulis dengan sintaks <code>[]</code> yang sama:</p>
<pre><code>part := arr[1..3]</code></pre>
<p>Slice juga bisa dibangun dari nol dan ditumbuhkan. Menumbuhkan bisa memindah data, jadi variabelnya harus <code>mut</code>:</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> menambahkan. Ia bekerja pada slice apa pun, dan pada array berukuran tetap itu kesalahan kompiler, bukan kejutan saat jalan.</p>
<p>Mengiris slice lain memberikan slice darinya. Seperti array, <code>clone</code> bila butuh salinan independen:</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>Perhatikan rentang itu <em>eksklusif</em>: <code>0 .. n</code> berjalan <code>n</code> kali, dan loop <code>for</code> hanya menerima bentuk ini. Rentang di dalam <code>match</code> ditulis <code>...</code> dan inklusif di kedua ujung.</p>"
		}
		'moretypes/4':    PageText{
			title: 'Maps'
			body:  "<h2>Maps</h2>
<p>Map menampung pasangan kunci dan nilai, dan ditulis sebagai literal:</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>Tipe nilai disimpulkan. Menambah kunci, dan menanyakan apakah ada:</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>Mencari kunci yang tak ada memberikan <em>nilai nol</em>, jadi pencarian di mana hilang dan nol harus dibedakan memakai <code>or</code>:</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>Iterasi memberikan kunci dan nilainya:</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>Map adalah tipe referensi, jadi penugasan biasa akan meninggalkan dua nama untuk satu map. <code>clone</code> adalah cara mendapat yang independen:</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p>Tanpa <code>clone</code> kompiler akan memberitahumu map tak bisa disalin, dan meminta memilih antara <code>move</code>, <code>clone</code> atau referensi. Pertanyaan itu intinya: berbagi map tanpa sengaja itu mudah, jadi V membuatmu mengatakan mana yang kamu maksud.</p>"
		}
		'moretypes/5':    PageText{
			title: 'Strings'
			body:  "<h2>Strings</h2>
<p>String V adalah deretan byte, yang punya satu konsekuensi langsung: pengindeksan memberikan byte, dan <code>.len</code> menghitung byte.</p>
<pre><code>println(s[0])</code></pre>
<p>Itu tepat sekali untuk ASCII dan salah untuk apa pun selainnya, maka <code>.runes()</code> ada. Ia menapaki karakter sebagai gantinya:</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>String tak berubah, jadi setiap metode padanya mengembalikan string baru:</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>Ini metode, bukan fungsi dalam modul, jadi tak ada yang perlu diimpor untuknya. Sebagian operasi hidup di <code>strings</code>, terutama builder:</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>Pakai builder daripada <code>+</code> berulang bila membangun string panjang dalam loop.</p>"
		}
		'moretypes/6':    PageText{
			title: 'Metode'
			body:  "<h2>Metode</h2>
<p>Metode adalah fungsi dengan <em>penerima</em>: nilai tempat ia dipanggil.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>Tipe penerima datang sebelum nama metode, dan metode lalu dipanggil sebagai <code>p.sum()</code>.</p>
<p>Penerima tanpa <code>&amp;</code> adalah <em>salinan</em>, jadi metode tak bisa mengubah yang asli. Untuk menulis tembus, deklarasikan penerima sebagai referensi dan buat <code>mut</code>:</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>Pembedaan itu seluruh kisah metode di V, dan pembedaan yang sama yang kamu temui pada nilai biasa: penugasan memberikan nilai, dan referensi adalah sesuatu yang kamu minta dengan nama.</p>
<p>Capailah penerima nilai kecuali metode memang harus mengubah penerima. Metode yang hanya membaca seharusnya tak bisa.</p>"
		}
		'moretypes/7':    PageText{
			title: 'Latihan: Penghitungan Kata'
			body:  "<h2>Latihan: Penghitungan Kata</h2>
<p>Terapkan <code>word_count</code> agar menghitung berapa kali tiap kata muncul dalam string.</p>
<p>Kata dipisah oleh apa pun yang bukan huruf, dan hitungan tak boleh bergantung pada besar kecil huruf. Pakai <code>map[string]int</code>.</p>
<p>Bila sudah berjalan, buat keluarannya terurut, bukan urutan apa pun yang dilewati map.</p>
<p>Tekan <b>Solution</b> bila sudah mencoba, atau bila buntu.</p>"
		}
		'moretypes/8':    PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/optionresult/1'>penanganan ketiadaan dan kegagalan</a>.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>V membedakan dua situasi yang banyak bahasa campur aduk, dan memberi masing-masing tipenya sendiri.</p>
<p><code>?T</code> adalah nilai atau <em>none</em>. Ini untuk kasus di mana tak ada yang perlu dikembalikan dan tak ada yang salah: pencarian yang tak menemukan apa pun, penelusuran yang kehabisan kandidat.</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>Option dibuka dengan <code>or</code>, yang menyediakan nilai untuk kasus none:</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>Atau dengan <code>if</code>, yang menjalankan cabang berbeda sebagai gantinya:</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>Variabel hanya terikat di cabang di mana ada nilai. Di cabang <code>else</code> option itu adalah <code>none</code>.</p>
<p>Option tersusun tanpa basa-basi. Fungsi yang mengembalikan <code>?int</code> bisa langsung mengembalikan option fungsi lain:</p>
<pre><code>n := name?.len</code></pre>
<p><code>?</code> itu berarti «bila itu none, kembalikan none dari fungsi ini juga». Itulah beda antara meneruskan nilai dan mengarang bawaan, dan maka badan di atas sama sekali tak perlu dibuka.</p>
<p>Mencetak option menunjukkan paruh mana yang kamu punya, jadi <code>Option(3)</code> dan <code>Option(none)</code> menjelaskan diri selagi kamu mencari tahu apa yang salah.</p>"
		}
		'optionresult/2': PageText{
			title: 'Result dan error'
			body:  "<h2>Result dan error</h2>
<p>Option mengatakan tak ada apa pun. <code>!T</code> mengatakan sesuatu <em>gagal</em>, dan membawa pesan tentang bagaimana.</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>Mengembalikan nilai biasa tak perlu dibuka; V membungkusnya. Mengembalikan <code>error(...)</code> membuat kegagalan. Itulah seluruh kontraknya.</p>
<p>Sisi pemanggil bentuknya sama seperti option, dan mengikat <code>err</code> di cabang <code>else</code>:</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code> memberikan pesannya saja, tanpa apa pun yang mungkin ditambahkan tipe kesalahan di sekitarnya. Kedua bentuk dipakai dalam contoh.</p>
<p>Propagasi bekerja sama seperti pada option. Perhatikan <code>!</code> pada tiap panggilan di <code>parse_pair</code>: separuh mana pun yang gagal menggagalkan semuanya, dan pesannya ikut serta.</p>
<p>Pustaka standar mengikuti konvensi ini di mana-mana, maka <code>json2.decode</code> bisa melaporkan di mana JSON-mu salah:</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>Jadi aturan memilih di antara keduanya singkat. Bila tak ada yang ditemukan, option. Bila sesuatu dicoba dan tak berhasil, result. Dan bila fungsi harus meneruskan kegagalan yang bukan ia sebabkan, propagasikan dengan <code>?</code> atau <code>!</code> daripada meratakannya jadi bawaan.</p>"
		}
		'optionresult/3': PageText{
			title: 'Latihan: Options'
			body:  "<h2>Latihan: Options</h2>
<p>Tulis empat fungsi, masing-masing mengembalikan option.</p>
<p><code>second_largest</code> mengembalikan nilai <em>berbeda</em> terbesar kedua dalam slice, atau none bila tak ada. Terbesar yang berulang tak dihitung, jadi <code>[5, 5]</code> tak punya terbesar kedua.</p>
<p><code>first_word</code> mengembalikan kata pertama string, atau none untuk yang kosong.</p>
<p><code>sum_all</code> mengambil slice option dan mengembalikan int, melewatkan yang none.</p>
<p>Lalu <code>describe_all</code>, yang merangkum masukan. Tulis dengan propagasi <code>?</code> agar sama sekali tak berisi pembukaan.</p>
<p>Tekan <b>Solution</b> bila sudah mencoba, atau bila buntu.</p>"
		}
		'optionresult/4': PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/methods/1'>metode dan antarmuka</a>.</p>"
		}
		'methods/1':      PageText{
			title: 'Antarmuka'
			body:  "<h2>Antarmuka</h2>
<p>V tidak punya kelas. Struct bermetode adalah seluruhnya, dan untuk kebanyakan program itu sudah cukup.</p>
<p><em>Antarmuka</em> adalah daftar metode. Tipe mengimplementasikannya cukup dengan memilikinya: tak ada kata kunci untuk ditulis dan tak ada yang perlu dideklarasikan.</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p>Bila <code>Dog</code> dan <code>Cat</code> keduanya punya metode <code>speak</code>, keduanya bisa dilewatkan ke mana <code>Speaker</code> diinginkan:</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>Karena implementasinya implisit, antarmuka tetap bekerja bila tipe ditambah belakangan. Pembicara ketiga tak butuh perubahan pada <code>announce</code>, maupun pada antarmuka.</p>
<p>Slice dari antarmuka biasanya yang kamu mau, bukan slice dari satu tipe konkret:</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>Dua aturan yang layak dipegang. Jagalah antarmuka tetap kecil: satu atau dua metode tanda abstraksinya nyata, di mana lima biasanya berarti kamu menyalin tipe konkret. Dan deklarasikan antarmuka di mana ia <em>dipakai</em>, bukan di samping implementasi. V tak menuntut keduanya, tapi pembaca akan mencari antarmuka dalam fungsi yang mengonsumsinya.</p>"
		}
		'methods/2':      PageText{
			title: 'Embedding'
			body:  "<h2>Embedding</h2>
<p>Struct bisa menanam struct lain, ditulis sebagai nama tipe polos:</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>Field struct yang ditanam menjadi field struct luar, dan metodenya ikut serta. <code>u.id</code> dan <code>u.name</code> keduanya hanyalah field <code>User</code>, dan <code>u.describe()</code> adalah metode yang datang dari <code>Base</code>.</p>
<p>Begitulah field umum dan metode umum ditulis sekali. Menanam <em>antarmuka</em> juga bekerja, dan begitulah tipe menggantikan perilaku dengan field.</p>
<p>Ada satu aturan yang mengejutkan, dan layak dipelajari dengan cara sulit. Struct yang ditanam mewarisi anggota tipe luar, tetapi <em>tidak</em> mendapat akses ke metode tipe luar itu sendiri. Jadi metode pada <code>Base</code> tak bisa memanggil <code>area()</code> bila <code>area()</code> milik struct yang menanamnya.</p>
<p>Bila butuh satu fungsi bekerja lintas beberapa tipe, ambil antarmukanya sebagai parameter sebagai gantinya:</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>Penanaman untuk berbagi keadaan dan perilaku antara tipe dan bagian-bagiannya. Antarmuka untuk menulis sekali tentang beberapa tipe tak berkaitan. Keduanya menjawab pertanyaan berbeda dan layak dijaga terpisah.</p>"
		}
		'methods/3':      PageText{
			title: 'Tipe yang dapat dicetak'
			body:  "<h2>Tipe yang dapat dicetak</h2>
<p>V mencetak nilai dengan metode <code>str</code>-nya, bukan dengan merefleksikan field-nya, jadi tipe mengendalikan tampilannya dengan mendefinisikan satu:</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>Sejak itu <code>println(t)</code>, interpolasi string dan penggabungan semuanya memakainya:</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>Ini metode yang paling akan sering kamu tulis, dan layak ditulis dini: tipe yang mencetak dirinya dengan masuk akal membuat setiap sesi debug berikutnya lebih mudah.</p>
<p>Itu hanya memengaruhi pencetakan. Di mana pun <code>string</code> diharapkan, berikan satu secara eksplisit dengan memanggil <code>.str()</code>: tipe bermetode <code>str</code> tetap tipenya sendiri, dan kompiler tak akan mengonversinya untukmu.</p>"
		}
		'methods/4':      PageText{
			title: 'Latihan: Bentuk'
			body:  "<h2>Latihan: Bentuk</h2>
<p>Empat hal untuk ditulis.</p>
<p>Beri <code>Square</code> dan <code>Triangle</code> metode <code>area</code>, dan buat <code>total_area</code> menjumlahkan slice bentuk lewat antarmuka.</p>
<p>Lalu tulis <code>describe(s Shape)</code>, yang melaporkan nama dan luas bentuk tanpa tahu bentuk apa itu.</p>
<p>Bagian terakhir ada jebakannya, dan menemukannya adalah sebagian besar latihan. Kamu akan tergoda menaruh <code>describe</code> pada <code>Base</code> agar setiap bentuk mewarisinya. Itu tak bekerja, dan kompiler akan memberitahumu mengapa.</p>
<p>Tekan <b>Solution</b> bila sudah mencoba, atau bila buntu.</p>"
		}
		'methods/5':      PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/generics/1'>generik</a>.</p>"
		}
		'generics/1':     PageText{
			title: 'Fungsi generik'
			body:  "<h2>Fungsi generik</h2>
<p>Parameter tipe menggantikan tipe, jadi satu deklarasi bisa melayani seluruh keluarganya. V menulisnya dalam kurung siku, dan inilah satu potong sintaks yang layak dihafal:</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>Kurung sudut <em>bukan</em> sintaksnya di sini. Ditulis sebagai <code>fn max_of&lt;T&gt;(...)</code> itu kesalahan urai, bukan ejaan berbeda, dan inilah hal pertama yang harus benar.</p>
<p>Kamu jarang menamai argumen tipe. Kompiler menyimpulkannya dari argumen, dan ia membaca variabel sebaik literal:</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>Parameter tipe hanya dibutuhkan di mana kompiler tak bisa menyimpulkannya sendiri. Di posisi kembalian sering itulah intinya:</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p><code>?T</code> itu berarti tepat seperti di pelajaran sebelumnya: nilai atau none, dari tipe apa pun instantiasi ini.</p>
<p>Callback ditulis sebagai tipe fungsi, jadi <code>fn (T) R</code>. Itu membuat tipe masukan dan keluaran independen, yang membuat satu fungsi bisa menjadi pipa:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>Satu deklarasi, dan instantiasi terpisah untuk tiap tipe argumen yang diberikan. Tanpa boxing dan tanpa penghapusan: <code>apply</code> dipanggil dengan callback <code>int</code> dan dengan callback <code>string</code> adalah dua fungsi berbeda, maka tipe callback harus ditulis, bukan ditebak.</p>"
		}
		'generics/2':     PageText{
			title: 'Struct generik'
			body:  "<h2>Struct generik</h2>
<p>Struct mengambil parameter tipe seperti fungsi, dan tiap field yang menyebutnya milik instantiasi:</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>Jadi <code>Stack[int]</code> menampung <code>[]int</code> dan <code>Stack[string]</code> menampung <code>[]string</code>, dan keduanya dua tipe berbeda. Itu layak direnungkan, karena artinya kamu tak bisa menaruh tumpukan <code>int</code> dan tumpukan <code>string</code> dalam satu slice tanpa menghapus tipe di suatu tempat.</p>
<p>Metode membawa parameter juga. <code>mut</code> pada penerima adalah yang membiarkan metode mengubah struct, dan <code>&amp;</code> mengatakan ia hanya membaca:</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p><code>?T</code> adalah tipe option yang diparameterkan sama, jadi mengambil dari tumpukan kosong memberikan <code>none</code>, bukan panic.</p>
<p>Dua parameter adalah ide sama dua kali, dan keduanya independen satu sama lain:</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>Inilah batas yang menjebak orang, dan layak presisi soal itu, karena pesan kesalahan tak menunjuk metode yang kamu lihat. <code>A</code> dan <code>B</code> tak berhubungan, jadi tak ada konversi untuk ditawarkan di antaranya, dan metode tak bisa memindah nilai dari satu field ke lain:</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>Alasannya adalah sifat metode generik, bukan pasangan, dan layak dipahami daripada dihafal. Badan metode generik diperiksa terhadap <em>setiap</em> instantiasi yang dipakai, jadi harus valid untuk semuanya sekaligus. Itu mengapa metode baik-baik saja pada <code>Pair[int, int]</code>, di mana kedua field menampung satu tipe, dan tetap ditolak begitu <code>Pair[string, int]</code> memakainya. Kesalahan menamai instantiasi yang melanggar, bukan deklarasinya:</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>Jadi aturan yang dipegang adalah metode generik hanya boleh menjanjikan sesuatu yang benar untuk setiap tipe yang akan diinstansiasikan dengannya. Membaca kedua field selalu lolos, maka <code>describe</code> bekerja untuk setiap instantiasi:</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: 'Map tipe generik'
			body:  "<h2>Map tipe generik</h2>
<p>Tipe generik bisa menjadi tipe nilai map, dan argumen tipe dieja pada titik pakai. Map lalu adalah map biasa dari satu tipe konkret:</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p><code>Stack</code> polos tak cukup di sini. Map harus tahu nilai-nilainya tumpukan <em>dari</em> apa, dan menghilangkan argumen adalah kesalahan, bukan sesuatu yang disimpulkan kompiler belakangan.</p>
<p>Konsekuensi yang layak diketahui: <code>map[string]Stack[int]</code> dan <code>map[string]Stack[string]</code> adalah tipe berbeda, jadi program yang butuh keduanya harus mengatakannya, bukan membiarkan satu menggantikan lain.</p>
<p>Metode generik tersedia pada nilai yang diserahkan map, yang membuat map berguna, bukan sekadar legal:</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>Perhatikan <code>_,</code> dalam loop map. Menamai kuncinya adalah <code>for team, stack in teams</code>; garis bawah polos mengatakan kunci tak dibutuhkan. Ia harus polos: garis bawah diikuti nama ditolak, jadi <code>_k</code> tak akan bisa.</p>
<p>Map adalah tipe referensi, yang membuat tulisan dua langkah bekerja: <code>teams['red'].push(10)</code> menemukan tumpukan dalam map dan memutasi struct yang sama, bukan menyalinnya dan kehilangan perubahan.</p>"
		}
		'generics/4':     PageText{
			title: 'Beberapa parameter tipe'
			body:  "<h2>Beberapa parameter tipe</h2>
<p>Parameter tipe bertumpuk. Dua pada fungsi biasanya tipe masukan dan tipe keluaran, yang membuat fungsi generik bekerja sebagai pemetaan:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>Parameter tipe tak harus muncul di badan. Itu terdengar seperti cara menulis fungsi sia-sia, dan sering tepat sekali: parameter membatasi tanda tangan tanpa biaya apa pun di sisi pemanggil.</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>Tak ada di badan yang menyebut <code>K</code>, jadi inilah fungsi sama untuk map berkunci string dan untuk yang berkunci int. <code>?V</code>-nya disengaja: map kosong tak punya nilai pertama, jadi fungsi mengembalikan none, bukan mengarang satu.</p>
<p>Bentuk yang paling muncul adalah fungsi generik atas map, dengan callback memutuskan apa yang dilakukan dengan tiap nilai:</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p><code>K</code> dan <code>V</code> keduanya disimpulkan dari map, dan <code>R</code> ditetapkan pada <code>int</code> karena itulah yang dikembalikan callback. Di mana inferensi tak punya bahan kerja, namai argumen eksplisit: <code>first_map[string, int](m)</code>.</p>
<p>Satu hal yang tak akan dilakukan inferensi adalah menyelamatkan argumen yang tak cocok. Bila kamu melewatkan <code>Counter[V]</code> di mana <code>map[K]Counter[V]</code> diinginkan, kesalahan menamai <code>K</code> yang tak tersimpulkan, bukan masalah sebenarnya, yang merupakan perkenalan pertama yang membingungkan. Periksa tipe argumen sebelum berburu bug generik.</p>"
		}
		'generics/5':     PageText{
			title: 'Latihan: Generik'
			body:  "<h2>Latihan: Generik</h2>
<p>Empat hal untuk ditulis, dan di antaranya mereka memakai setiap bentuk dari pelajaran ini.</p>
<p><code>index_of[T]</code> mengembalikan posisi nilai dalam slice, atau -1. Ia bekerja pada tipe apa pun yang mendukung <code>==</code>.</p>
<p><code>count_matching[T]</code> menghitung berapa item memenuhi predikat. Predikat adalah callback, jadi tipenya ditulis <code>fn (T) bool</code>.</p>
<p>Lalu <code>Counter[K]</code>, struct generik yang menampung hitungan per kunci. Beri <code>add</code> dan <code>get</code>, dan perhatikan <code>K</code> dipakai di dalam tipe generik lain di sini: map yang kuncinya parameter tipe.</p>
<p>Terakhir <code>grand_total[K, V]</code>, yang menjumlahkan map penghitung yang dibobot oleh callback kunci. Dua parameter tipe, dan struct generik sebagai tipe nilai map.</p>
<p>Tekan <b>Solution</b> bila sudah mencoba, atau bila buntu.</p>"
		}
		'generics/6':     PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini!</p>
<p>Anda dapat kembali ke <a href='/list'>daftar modul</a> untuk melihat apa yang dipelajari selanjutnya, atau lanjutkan dengan <a href='/concurrency/1'>konkurensi</a>.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p><code>spawn</code> memulai thread dan langsung kembali. Ia menyerahkan handle, dan handle adalah cara menunggu thread nanti:</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> sendiri tak menunggu apa pun. Program yang berakhir selagi thread masih bekerja meninggalkan thread itu di tengah tulis, jadi aturannya setiap spawn pada akhirnya ditunggu.</p>
<p>Untuk sekumpulan tugas tetap, kumpulkan handle dalam slice. Tipe elemennya <code>thread</code>, dan <code>wait()</code> pada slice menggabungkan semuanya:</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>Bila pekerja mengembalikan sesuatu, slice-nya <code>[]thread int</code> dan <code>wait()</code> menyerahkan hasilnya berurutan:</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>Urutan layak presisi. Hasil kembali menurut urutan handle ditambahkan, bukan urutan thread selesai, jadi ini cara mengumpulkan jawaban, bukan cara memaksakan urutan pada kerja. Thread mana yang mencetak dulu bukanlah sesuatu yang harus digantungi program, dan keluaran bersalin dalam contoh adalah versi jujurnya.</p>"
		}
		'concurrency/2':  PageText{
			title: 'Channels'
			body:  "<h2>Channels</h2>
<p>Channel memindahkan nilai satu tipe dari satu thread ke lain. Buat dengan tipe elemen dan kapasitas, dan kirim serta terima dengan panah yang sama:</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>Kedua arah adalah <code>&lt;-</code>, karena keduanya menerima dari sisi lain. Tak ada <code>ch.recv()</code> atau <code>ch.pop()</code>: kompiler menolak keduanya sebagai fungsi tak dikenal. Bila kamu terbiasa dengan metode di sini, itulah yang harus dilupakan.</p>
<p><code>chan int{}</code> tanpa kapasitas <em>tak berbuffer</em>, artinya channel sama sekali tak menampung apa pun. Pengiriman tak bisa selesai sampai penerima berdiri di sana, dan penerimaan tak bisa selesai sampai pengirim telah memproduksi sesuatu. Setiap nilai adalah jabat tangan antara dua thread:</p>
<pre><code>fn producer(ch chan int) {
	for i in 0 .. 3 {
		println('sending &dollar;{i}')
		ch &lt;- i
	}
}

ch := chan int{}
spawn producer(ch)
for _ in 0 .. 3 {
	println('received &dollar;{&lt;-ch}')
}</code></pre>
<p>Baca keluaran contoh dan jabat tangannya terlihat: pengiriman dan penerimaan bergantian, dan keduanya tidak dalam urutan tetap yang harus kamu andalkan. Itulah inti channel tak berbuffer, bukan cacatnya.</p>
<p>Channel membawa tepat satu tipe, jadi menunggu dua macam pesan berbeda berarti dua channel. <code>select</code>, nanti, adalah cara menunggu lebih dari satu sekaligus.</p>"
		}
		'concurrency/3':  PageText{
			title: 'Channel buffer'
			body:  "<h2>Channel buffer</h2>
<p>Kapasitas memberi channel ruang, jadi pengirim bisa mendahului, bukan memblokir pada tiap nilai:</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>Bedanya terukur. Dengan buffer, semua pengiriman selesai dan <code>len()</code> melaporkan berapa nilai menunggu. Tanpanya, <code>len()</code> tetap nol berapa pun lama menunggu, karena tak ada tempat menaruhnya:</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>Pilih buffer bila produsen tak boleh tertahan oleh konsumen lambat. Kapasitas ditetapkan saat channel dibuat, dan channel berbuffer dan tak berbuffer dari tipe elemen sama adalah tipe berbeda.</p>
<p>Inilah jebakan yang layak setengah menit untuk diingat. Field yang mengatur ukuran adalah <code>cap:</code>, dan menulis <code>len:</code> sebagai gantinya ditolak, bukan diabai diam-diam:</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>Pesan menamai field yang kamu maksud, yang kira-kira sebagus mungkin. Jebakan lain bukan soal ejaan. Buffering hanya membantu sampai kapasitas: pengirim dengan lebih banyak untuk dikirim daripada ruang memblokir pada nilai pertama yang tak muat. Jadi dengan empat slot dan enam pekerjaan, dan tanpa konsumen berjalan, pengiriman kelima menunggu konsumen yang tak berjalan. Entah buffer seluruh daftar atau jalankan dulu konsumennya.</p>"
		}
		'concurrency/4':  PageText{
			title: 'Menerima sampai ditutup'
			body:  "<h2>Menerima sampai ditutup</h2>
<p><strong>Tak ada <code>for x in ch</code> di V.</strong> Channel bukan koleksi, jadi loop for tak punya apa pun untuk diindeks, dan kompiler berkata:</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>Bila kamu datang dari bahasa di mana channel bisa direntang, inilah yang akan pertama kamu salahi. Terimalah dengan <code>&lt;-ch</code>, dan untuk membaca channel sampai habis, terimalah sampai ia berhenti memberi:</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p><code>or</code> menyediakan nilai yang mengakhiri loop, dan inilah bagian yang mudah salah ke arah lain: <strong><code>or</code> hanya menyala bila channel ditutup dan kosong.</strong> Pada channel terbuka tanpa apa pun di dalamnya, <code>&lt;-ch or { -1 }</code> tetap memblokir, menunggu pengirim. Itu bukan jajak tak memblokir, tampak apa pun.</p>
<p>Satu detail soal pengiriman yang akan menghabiskan si sore bila tak ada yang menyebut. Ekspresi pengiriman berhenti di panah, jadi nilai terhitung di kanan butuh kurung:</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>Tanpanya kompiler mencoba mengalikan void yang dihasilkan <code>ch &lt;- i</code>, dan mengatakannya dengan cara yang tak jelas menunjuk panah.</p>
<p>Bila produsen memberitahumu hitungannya, loop tak perlu:</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>Bentuk sederhana itu ada tajamnya. <code>&lt;-ch</code> polos pada channel yang ditutup dan kosong tak memblokir dan tak panic: ia menyerahkan <em>nilai nol</em> untuk tipe elemen, setiap kali. Minta satu nilai terlalu banyak dan kamu dapat <code>0</code> diam, string kosong atau struct nol, bukan kesalahan:</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>Jadi pilih <code>or</code> kapan pun hitungan tak pasti, dan capai <code>try_pop</code> bila ingin mengintip tanpa menunggu sama sekali:</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: 'Penutupan'
			body:  "<h2>Penutupan</h2>
<p>Tutup channel bila produsennya selesai dengannya, dan tutuplah dari produsen. Produsen memiliki channel sama seperti ia memiliki keputusan berhenti:</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>Satu detail yang menjebak orang: <code>close</code> sendirian bukanlah cara menutup channel. Ditulis sebagai panggilan polos, itu builtin yang menutup deskriptor berkas, dan ia gagal pada channel dengan pesan membingungkan:</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>Menutup tak membuang apa yang masih dibuffer. Nilai dalam channel diserahkan dulu ke pembaca, berurutan, dan hanya bila kosong penerimaan tak menemukan apa pun. Urutan itulah yang membuat close menjadi sinyal sebagaimana mestinya.</p>
<p>Yang tak dilakukan close adalah membuat pengiriman legal. Mengirim pada channel tertutup adalah panic saat jalan, dan menutup dua kali juga, jadi aturannya satu penutupan per channel dari satu tempat yang memilikinya.</p>
<p>Dan close bukanlah penantian. Menerima dari channel yang terbuka dan kosong tetap memblokir, entah seseorang menutupnya atau tidak.</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  "<h2>Select</h2>
<p><code>select</code> menunggu pada beberapa channel dan menjalankan badan mana pun yang siap. Begitulah cara mengambil jawaban pertama, bukan urutan tetap:</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>Cabang adalah penerimaan atau pengiriman, jadi kedua arah bisa berlomba:</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>Dua kendala yang layak diketahui sebelum menulis satu, keduanya diukur terhadap kompiler, bukan didokumentasikan.</p>
<p><strong>Pisahkan kedua bentuk dalam select terpisah.</strong> Select yang menampung cabang kirim <em>dan</em> cabang terima menabrakkan kompiler mentah, bukan melaporkan kesalahan, jadi pasangkan kiriman dengan timeout atau dengan kiriman lain.</p>
<p><strong>Cabang harus menamai channel yang sudah ada.</strong> Menulis channel sebaris ditolak:</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>Dan cabang menugaskan, bukan mengembalikan, jadi variabel yang ditulisinya harus <code>mut</code>. Durasi pada posisi cabang adalah timeout, dan hanya satu per select. Begitulah penantian berhenti tanpa batas:</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> adalah cabang untuk bila tak ada yang siap, dan ia tak menunggu. Inilah bentuk tak memblokir:</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>Sebagai ekspresi, select mengevaluasi ke <strong>bool</strong>: true bila cabang channel berjalan, false bila <code>else</code> yang berjalan. Ia tak mengevaluasi ke nilai cabang, jadi bacalah nilai di cabang dan uji bool terpisah.</p>
<pre><code>if select {
	v := &lt;-ch {
		println(v)
	}
	else {
		// nothing ready
	}
} {
	// a channel branch ran
}</code></pre>
<p>Satu asimetri untuk disiapkan. Bila channel ditutup, menerimanya siap permanen, jadi channel tertutup memenangkan select setiap putaran. Dalam loop atas beberapa channel, keringkan yang kamu pedulikan dan periksa sendiri penutupannya, bukan mengandalkan select melewatinya.</p>"
		}
		'concurrency/7':  PageText{
			title: 'Status bersama'
			body:  "<h2>Status bersama</h2>
<p>Channel memindahkan nilai. Bila thread harus mengubah nilai yang <em>sama</em>, itulah pekerjaan kunci.</p>
<p>Bagian yang tak jelas adalah bagaimana status dibagikan. Struct yang dilewatkan ke thread by value adalah salinan, dan tiap thread akan mendapat miliknya. Kata kunci <code>shared</code> pada parameter adalah yang membuatnya satu:</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>Perhatikan <code>shared t</code> dalam daftar parameter dan <code>spawn add(shared total, i)</code> di sisi pemanggil. Keduanya dibutuhkan. Lewatkan tanpa kata kunci dan thread mendapat salinan, jadi penghitung tak pernah bergerak.</p>
<p><code>lock</code> adalah blok, bukan panggilan, dan kurung tutup melepaskannya. Tak ada pernyataan <code>unlock</code> untuk dipasangkan, dan menulis satu adalah kesalahan sintaks. Tahan sesedikit mungkin: tidak lintas spawn, tidak lintas kiriman channel, dan tidak di sekitar kerja sebenarnya. Kunci yang ditahan lintas sesuatu yang bisa memblokir adalah cara program deadlock.</p>
<p><code>rlock</code> adalah versi bacanya, dan untuk struktur yang dibaca jauh lebih sering daripada ditulis:</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p>Variabel <code>shared</code> juga harus dikunci pada titik pakai, jadi kompiler tak akan membiarkan kunci terlupakan tanpa sengaja.</p>
<p>Ada satu hal yang perlu hati-hati, dan itulah alasan contoh membaca nilai sebelum menunggu thread-nya. Spawn tak menunggu, jadi membaca status bersama tepat setelah spawn adalah balapan: nilai yang kamu lihat bergantung sejauh mana thread sampai. Tunggulah penulis sebelum membaca, atau terimalah angkanya sementara.</p>"
		}
		'concurrency/8':  PageText{
			title: 'Grup tunggu'
			body:  "<h2>Grup tunggu</h2>
<p>Grup tunggu menghitung kerja berjalan. <code>add</code> sebelum spawn, <code>done</code> di dalamnya, dan <code>wait</code> bila sudah memulai semuanya:</p>
<pre><code>fn worker(wg &amp;sync.WaitGroup, ch chan int, n int) {
	ch &lt;- n * n
	wg.done()
}

mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.add(1)
	spawn worker(wg, ch, i)
}
wg.wait()</code></pre>
<p>Ambil grup sebagai <code>&amp;sync.WaitGroup</code>, bukan <code>mut &amp;sync.WaitGroup</code>. Referensi <code>mut</code> terkompilasi lalu jatuh di dalam penghitung atomik saat jalan, jadi referensi polos adalah bentuk yang dipakai.</p>
<p><code>wg.go</code> membundel add dan start thread, yang menghapus langkah di mana keduanya melenceng:</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>Ia mengambil closure, bukan panggilan, dan closure di V harus menamai yang dibacanya. Daftar <code>fn [ch, i] ()</code> adalah deklarasi itu, dan menghilangkan variabel adalah kesalahan kompiler yang menamai variabel, bukan apa pun soal konkurensi.</p>
<p>Tiga aturan, dan keduanya sebagian besar yang salah. Setiap <code>add</code> butuh <code>done</code> yang cocok, dan <code>done</code> tanpa <code>add</code> panic. Setiap spawn harus terjadi sebelum <code>wait</code>, karena itulah semua yang dilihat wait. Dan thread yang panic membawa seluruh proses bersamanya, jadi fungsi yang di-spawn butuh <code>defer</code>-nya sendiri bila bisa gagal di tengah jalan.</p>"
		}
		'concurrency/9':  PageText{
			title: 'Latihan: Worker pool'
			body:  "<h2>Latihan: Worker pool</h2>
<p>Bangun pool pekerja dan beri ia pekerjaan.</p>
<p><code>worker</code> mengambil satu pekerjaan dari channel, menggandakannya, dan mengirim hasilnya ke channel lain. Ia diserahi grup tunggu agar pool tahu kapan selesai.</p>
<p><code>run_all</code> mengambil slice pekerjaan dan hitungan pekerja, dan mengembalikan hasilnya menurut urutan kedatangan.</p>
<p>Urutan operasi adalah seluruh latihan, dan empat hal harus benar sekaligus:</p>
<ul>
<li>Channel pekerjaan ditutup <em>sebelum</em> pekerja mulai, atau pekerja bisa tertinggal menunggu penutupan yang tak datang.</li>
<li>Setiap <code>add</code> terjadi sebelum <code>wait</code>, dan setiap <code>done</code> di dalam pekerja.</li>
<li>Kedua channel dibuffer, agar pekerja tak pernah memblokir menyerahkan nilai.</li>
<li>Hasil dikumpulkan dengan <code>&lt;-results or { break }</code>, karena tak ada <code>for</code> atas channel.</li>
</ul>
<p>Dua di antaranya adalah deadlock yang biasa dimunculkan latihan ini: channel pekerjaan dengan ruang kurang dari daftar pekerjaan, atau hasil dibaca sebelum <code>wait</code>.</p>
<p>Tekan <b>Solution</b> bila sudah mencoba, atau bila buntu.</p>"
		}
		'concurrency/10': PageText{
			title: 'Selamat!'
			body:  "<p>Anda telah menyelesaikan pelajaran ini, dan dengan itu seluruh tur!</p>
<p>Kembali ke <a href='/list'>daftar modul</a> untuk membaca ulang apa pun, atau mulai lagi dari <a href='/welcome/1'>memulai</a>.</p>"
		}
		'cli/1':          PageText{
			title: 'Perintah sehari-hari'
			body:  "<h2>Perintah sehari-hari</h2>
<p>Tiga perintah berjalan pada hampir tiap perubahan. <code>v fmt -w .</code> memformat proyek, <code>v vet .</code> melaporkan konstruksi mencurigakan dan <code>v test .</code> menjalankan suite pengujian:</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>Format sebelum setiap commit, agar review tak pernah berdebat soal tata letak.</p>
<p><code>v doc strings</code> menunjukkan dokumentasi modul, <code>v repl</code> membuka prompt interaktif dan <code>v watch run main.v</code> membangun ulang dan menjalankan lagi kapan pun berkas sumber berubah.</p>"
		}
		'vpm/1':          PageText{
			title: 'Paket'
			body:  "<h2>Paket</h2>
<p>Pustaka hidup di registri paket. Cari, periksa hasilnya, dan pasang:</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p><code>v list</code> menunjukkan apa dependensi proyek. <code>v outdated</code> melaporkan versi lebih baru, <code>v update</code> mengambilnya dan <code>v remove</code> mencopot satu.</p>
<p>Perintah ini menjangkau jaringan, jadi berjalan di mesinmu, bukan di sandbox tur ini.</p>"
		}
		'mcp/1':          PageText{
			title: 'Protokol konteks model'
			body:  "<h2>v mcp</h2>
<p><code>v mcp serve</code> mengekspos kompiler itu sendiri ke agen pengode: deklarasi, referensi, dan diagnostik lewat input dan output standar:</p>
<pre><code>v mcp serve</code></pre>
<p><code>v mcp tools</code> mendaftar apa yang diekspos. Sajikan lewat HTTP dengan <code>--http</code>, selesaikan path relatif terhadap direktori dengan <code>--root</code>, dan daftarkan tanpa perkakas penulis berkas dengan <code>--read-only</code>.</p>
<p><code>v mcp install</code> menyambungkan server ke agen, dan <code>v mcp uninstall</code> mencopotnya. Permukaan ini baru, jadi butuh V terkini, bukan rilis yang dijalankan sandbox ini.</p>"
		}
		'skills/1':       PageText{
			title: 'Keterampilan'
			body:  "<h2>Keterampilan</h2>
<p>Skill adalah instruksi terpaket yang dimuat agen untuk suatu tugas: aturan bahasa, loop pengujian, permukaan perkakas:</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>Skill terpasang di <code>.agents/skills/</code> dalam proyek, atau di bawah rumahmu dengan <code>--global</code>. <code>v skills path v-tools</code> menunjukkan di mana satu berada, dan <code>--dry-run</code> melaporkan tanpa menulis apa pun.</p>
<p>Seperti <code>v mcp</code>, ini permukaan baru: butuh V terkini.</p>"
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
