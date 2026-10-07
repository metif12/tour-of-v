module locale

// Türkçe (Turkish) translation.

pub const tr = Text{
	modules: {
		'mechanics':    'Tur kullanımı'
		'basics':       'Temel türler'
		'controlflow':  'Kontrol akışı'
		'moretypes':    'Daha fazla tür'
		'optionresult': 'Option ve Result'
		'methods':      'Metotlar ve arayüzler'
		'generics':     'Generics'
		'concurrency':  'Eşzamanlılık'
	}
	lessons: {
		'welcome':      'Başlangıç'
		'basics':       'Temel türler'
		'controlflow':  'Kontrol akışı'
		'moretypes':    'Daha fazla tür'
		'optionresult': 'Option ve Result'
		'methods':      'Metotlar ve arayüzler'
		'generics':     'Generics'
		'concurrency':  'Eşzamanlılık'
	}
	pages:   {
		'welcome/1':      PageText{
			title: 'Merhaba, Dünya'
			body:  "<p><a href='https://vlang.io'>V programlama dili</a> turuna hoş geldiniz.</p>
<p>Tur modüllere bölünmüştür. <a href='/list'>İçindekiler</a> veya sağ üst köşedeki menü düğmesinden erişebilirsiniz.</p>
<p>Tur boyunca slaytlar ve alıştırmalar bulacaksınız. Metnin altındaki <b>önceki</b> ve <b>sonraki</b> bağlantılarıyla veya <code>PageUp</code> ve <code>PageDown</code> tuşlarıyla gezinin.</p>
<p>Tur interaktiftir. Programı derlemek ve çalıştırmak için <b>Çalıştır</b> (veya <code>Shift</code>+<code>Enter</code>) tuşuna basın. Sonuç kodun altında görünür.</p>
<p>Bu programlar kendi denemeleriniz için başlangıç noktalarıdır. Programı düzenleyin ve tekrar çalıştırın.</p>"
		}
		'welcome/2':      PageText{
			title: 'Bu turu kullanma'
			body:  '<p>Her sayfanın solunda metin sütununda, sağında kod sütununda bulunur. Arasında bir sürükleme tutamacı vardır: koda daha fazla yer vermek için sürükleyin.</p>'
		}
		'welcome/3':      PageText{
			title: 'V çevrimdışı (isteğe bağlı)'
			body:  '<p>Bu turu kullanmak için yerel V kurulumuna ihtiyacınız yoktur, ancak önerilir.</p>'
		}
		'welcome/4':      PageText{
			title: 'Sandbox'
			body:  "<p>Programlarınız sunucudaki sandbox'ta çalışır.</p>"
		}
		'welcome/5':      PageText{
			title: 'Tebrikler!'
			body:  "<p>Turun ilk modülünü tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya doğrudan <a href='/basics/1'>dilin temelleri</a> ile devam edin.</p>"
		}
		'basics/1':       PageText{
			title: 'Modüller'
			body:  '<h2>Modüller</h2>'
		}
		'basics/2':       PageText{
			title: 'Imports'
			body:  '<h2>Imports</h2>'
		}
		'basics/3':       PageText{
			title: 'Değişkenler'
			body:  '<h2>Değişkenler</h2>'
		}
		'basics/4':       PageText{
			title: 'Değiştirilebilir değişkenler'
			body:  '<h2>Değiştirilebilir değişkenler</h2>'
		}
		'basics/5':       PageText{
			title: 'Kısa bildirimler'
			body:  '<h2>Kısa bildirimler</h2>'
		}
		'basics/6':       PageText{
			title: 'Fonksiyonlar'
			body:  '<h2>Fonksiyonlar</h2>'
		}
		'basics/7':       PageText{
			title: 'Çoklu sonuçlar'
			body:  '<h2>Çoklu sonuçlar</h2>'
		}
		'basics/8':       PageText{
			title: 'Temel türler'
			body:  '<h2>Temel türler</h2>'
		}
		'basics/9':       PageText{
			title: 'Sıfır değerler'
			body:  '<h2>Sıfır değerler</h2>'
		}
		'basics/10':      PageText{
			title: 'Sabitler'
			body:  '<h2>Sabitler</h2>'
		}
		'basics/11':      PageText{
			title: 'Tür dönüşümleri'
			body:  '<h2>Tür dönüşümleri</h2>'
		}
		'basics/12':      PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/controlflow/1'>kontrol akışı</a> ile devam edin.</p>"
		}
		'basics/13':      PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/controlflow/1'>kontrol akışı</a> ile devam edin.</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':  PageText{
			title: 'For, V\'in "while"ıdır'
			body:  '<h2>For, V\'in "while"ıdır</h2>'
		}
		'controlflow/3':  PageText{
			title: 'For devamı'
			body:  '<h2>For devamı</h2>'
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':  PageText{
			title: 'Açılmış değerle If'
			body:  '<h2>Açılmış değerle If</h2>'
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':  PageText{
			title: 'Match ve toplam türleri'
			body:  '<h2>Match ve toplam türleri</h2>'
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':  PageText{
			title: 'Alıştırma: Döngüler ve Fonksiyonlar'
			body:  '<h2>Alıştırma: Döngüler ve Fonksiyonlar</h2>'
		}
		'controlflow/10': PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/moretypes/1'>daha fazla tür</a> ile devam edin.</p>"
		}
		'moretypes/1':    PageText{
			title: 'Structs'
			body:  '<h2>Structs</h2>'
		}
		'moretypes/2':    PageText{
			title: 'Arrays'
			body:  '<h2>Arrays</h2>'
		}
		'moretypes/3':    PageText{
			title: 'Slices'
			body:  '<h2>Slices</h2>'
		}
		'moretypes/4':    PageText{
			title: 'Maps'
			body:  '<h2>Maps</h2>'
		}
		'moretypes/5':    PageText{
			title: 'Strings'
			body:  '<h2>Strings</h2>'
		}
		'moretypes/6':    PageText{
			title: 'Metotlar'
			body:  '<h2>Metotlar</h2>'
		}
		'moretypes/7':    PageText{
			title: 'Alıştırma: Kelime Sayımı'
			body:  '<h2>Alıştırma: Kelime Sayımı</h2>'
		}
		'moretypes/8':    PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/optionresult/1'>yokluk ve hata yönetimi</a> ile devam edin.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2': PageText{
			title: 'Result ve hatalar'
			body:  '<h2>Result ve hatalar</h2>'
		}
		'optionresult/3': PageText{
			title: 'Alıştırma: Options'
			body:  '<h2>Alıştırma: Options</h2>'
		}
		'optionresult/4': PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/methods/1'>metotlar ve arayüzler</a> ile devam edin.</p>"
		}
		'methods/1':      PageText{
			title: 'Arayüzler'
			body:  '<h2>Arayüzler</h2>'
		}
		'methods/2':      PageText{
			title: 'Gömme'
			body:  '<h2>Gömme</h2>'
		}
		'methods/3':      PageText{
			title: 'Yazdırılabilir türler'
			body:  '<h2>Yazdırılabilir türler</h2>'
		}
		'methods/4':      PageText{
			title: 'Alıştırma: Şekiller'
			body:  '<h2>Alıştırma: Şekiller</h2>'
		}
		'methods/5':      PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/generics/1'>generics</a> ile devam edin.</p>"
		}
		'generics/1':     PageText{
			title: 'Generic fonksiyonlar'
			body:  '<h2>Generic fonksiyonlar</h2>'
		}
		'generics/2':     PageText{
			title: 'Generic structlar'
			body:  '<h2>Generic structlar</h2>'
		}
		'generics/3':     PageText{
			title: 'Generic türlerin mapleri'
			body:  '<h2>Generic türlerin mapleri</h2>'
		}
		'generics/4':     PageText{
			title: 'Birden fazla tür parametresi'
			body:  '<h2>Birden fazla tür parametresi</h2>'
		}
		'generics/5':     PageText{
			title: 'Alıştırma: Generics'
			body:  '<h2>Alıştırma: Generics</h2>'
		}
		'generics/6':     PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/concurrency/1'>eşzamanlılık</a> ile devam edin.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':  PageText{
			title: 'Channels'
			body:  '<h2>Channels</h2>'
		}
		'concurrency/3':  PageText{
			title: 'Bufferlı kanallar'
			body:  '<h2>Bufferlı kanallar</h2>'
		}
		'concurrency/4':  PageText{
			title: 'Kapanana kadar alma'
			body:  '<h2>Kapanana kadar alma</h2>'
		}
		'concurrency/5':  PageText{
			title: 'Kapatma'
			body:  '<h2>Kapatma</h2>'
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':  PageText{
			title: 'Paylaşılan durum'
			body:  '<h2>Paylaşılan durum</h2>'
		}
		'concurrency/8':  PageText{
			title: 'Bekleme grupları'
			body:  '<h2>Bekleme grupları</h2>'
		}
		'concurrency/9':  PageText{
			title: 'Alıştırma: Worker pool'
			body:  '<h2>Alıştırma: Worker pool</h2>'
		}
		'concurrency/10': PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız ve tüm turu tamamladınız!</p>
<p>Herhangi bir şeyi yeniden okumak için <a href='/list'>modül listesine</a> geri dönün veya <a href='/welcome/1'>başlangıç</a>'tan yeniden başlayın.</p>"
		}
	}
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
		'move_panes':       'Paneller arasında geçiş'
		'previous':         'Önceki'
		'next':             'Sonraki'
		'resize_panes':     'Panelleri yeniden boyutlandır'
		'page_of':          '\${number} / \${total}'
		'no_program':       'Sandbox bir test programı içermiyordu.'
		'compile_failed':   'Program derlenmedi.'
		'could_not_reach':  'Sunucuya ulaşılamadı: '
		'could_not_format': 'Bu program biçimlendirilemedi.'
		'sandbox_busy':     'Sandbox meşgul. Lütfen tekrar deneyin.'
		'too_large':        'Bu istek çok büyük.'
		'no_compiler':      "Sandbox'ta derleyici yok."
		'link_counterpart': 'Bu sayfayı \${language} dilinde oku'
		'lang_other':       'Diğer diller'
	}
}
