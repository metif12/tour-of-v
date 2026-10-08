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
			body:  "<h2>Modüller</h2>
<p>Her V dosyası, ait olduğu <em>modülü</em> bildirir. Bildirim dosyanın ilk satırındadır.</p>
<p>Program, <code>main</code> adlı modülde, <code>main</code> adlı fonksiyonda başlar.</p>
<p>Bu program, standart kütüphane modülleri <code>math</code> ve <code>strings</code> kullanıyor.</p>
<p>V'de her dizin bir modüldür ve modül adı diziniyle eşleşir. Bir sembol, <code>pub</code> ile işaretlenmedikçe modülünün dışında görünmez.</p>"
		}
		'basics/2':       PageText{
			title: 'Imports'
			body:  "<h2>Imports</h2>
<p>İçe aktarılan modül, dışa aktarılan adlarını geçerli dosyaya getirir.</p>
<p>Standart kütüphane modül adıyla içe aktarılır: <code>import math</code>, <code>import strings</code>. Üçüncü parti kütüphaneler de aynı şekilde içe aktarılır.</p>
<p>Modüldeki her işlem fonksiyon çağrısı olarak yazılmaz. Bazıları değer üzerinde _metot_ olarak yazılır, bu yüzden <code>s.to_upper()</code> hiçbir import olmadan string üzerinde çalışır.</p>
<p>Her iki tarz da standart kütüphanede görülür, o yüzden tahmin etmek yerine imzayı okumaya değer.</p>"
		}
		'basics/3':       PageText{
			title: 'Değişkenler'
			body:  "<h2>Değişkenler</h2>
<p>Kodu çalıştırın. Hata mesajına dikkat edin.</p>
<p>V değişkenleri <code>:=</code> ile bildirilir. Çoğu dilin aksine, V'de değişken varsayılan olarak <em>değiştirilemez</em> ve değiştirilebilirliği açıkça istemek gerekir.</p>
<p>Derleyici de aynısını söylüyor. 6. satır, izin istemeden <code>sum</code> değişkenine atama yapmaya çalışıyor.</p>
<p>Hatayı düzeltmek için 4. satırdaki bildirime <code>mut</code> ekleyin ve tekrar deneyin.</p>"
		}
		'basics/4':       PageText{
			title: 'Değiştirilebilir değişkenler'
			body:  "<h2>Değiştirilebilir değişkenler</h2>
<p>Değiştirilebilir değişken bildirmek için addan önce <code>mut</code> anahtar sözcüğünü ekleyin.</p>
<p>V bunu ister çünkü mutasyon istenmesi gereken bir şeydir. Hiç yeniden atanmayan değişken derleyici için daha kolay analiz edilir ve koda daha sonra döndüğünüzde sizin için de daha kolaydır.</p>
<p><code>mut</code> anahtar sözcüğünü kaldırıp tekrar çalıştırın. Bu bir önceki sayfadaki hatadır.</p>
<p><code>mut</code> anahtar sözcüğünü V'de her yerde göreceksiniz; fonksiyon parametreleri ve struct alanları dahil.</p>"
		}
		'basics/5':       PageText{
			title: 'Kısa bildirimler'
			body:  "<h2>Kısa bildirimler</h2>
<p><code>:=</code> değişken bildirir ve türünü değerden çıkarır.</p>
<p>Tür belli değilse ya da özellikle belirtmek istiyorsanız, <code>i64(42)</code> ya da <code>f64(1.5)</code> gibi bir _dönüşüm_ ile doğrudan adlandırın.</p>
<p>«Şimdi bildir, sonra ata» diye ayrı bir biçim yoktur. V değişkeni kapsama girdiği noktada her zaman değerlidir; bu yüzden sonraki sayfada göreceğiniz sıfır değerleri siz değil derleyici üretir.</p>"
		}
		'basics/6':       PageText{
			title: 'Fonksiyonlar'
			body:  "<h2>Fonksiyonlar</h2>
<p>Fonksiyonlar <code>fn</code> ile bildirilir.</p>
<p>Bir fonksiyon sıfır ya da daha fazla parametre alabilir. Parametreler ad ve türle yazılır; art arda aynı türden parametreler <code>x, y int</code> olarak yazılır.</p>
<p>Fonksiyonun sonucu parametre listesinden sonra adlandırılır. V fonksiyonları, dönüş türü tuple olmadıkça tam bir değer döndürür.</p>
<p>Gövdesi tek ifade olan fonksiyon tek satırda yazılabilir: <code>fn double(x int) int { return x * 2 }</code></p>"
		}
		'basics/7':       PageText{
			title: 'Çoklu sonuçlar'
			body:  "<h2>Çoklu sonuçlar</h2>
<p>Bir fonksiyon birden fazla değer döndürebilir. Dönüş türünü tuple olarak yazın:</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>Çağıran sonucu değişkenlere ayırır:</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>Dönüş türü her değeri basitçe listeler ve çağıran bunları değişkenlere ayırır. Gerek duyulmayan değer <code>_</code> ile yoksayılır.</p>
<p>Bu, başarısız olabilecek her şeyde göreceğiniz şekildir ve sonraki modülde ele alınır.</p>"
		}
		'basics/8':       PageText{
			title: 'Temel türler'
			body:  "<h2>Temel türler</h2>
<p>Boolean değerler <code>true</code> ve <code>false</code> olur.</p>
<p>Tamsayılar sabit boyutlarda gelir: <code>i8</code>, <code>i16</code>, <code>i32</code> ve <code>i64</code>; işaretsiz boyutlar <code>u8</code> ile <code>u64</code> arasıdır. <code>int</code> 32 bittir ve <code>isize</code> platform genişliğidir; genişlik önemliyse <code>i32</code> ya da <code>i64</code> adlandırın.</p>
<p>Kayan nokta türleri <code>f32</code> ve <code>f64</code> olur.</p>
<p><code>rune</code> bir Unicode kod noktası tutar.</p>
<p>Stringler değiştirilemez ve tek tırnakla yazılır.</p>"
		}
		'basics/9':       PageText{
			title: 'Sıfır değerler'
			body:  "<h2>Sıfır değerler</h2>
<p>Her türün bir <em>sıfır değeri</em> vardır; değişkenin kendisine bir şey atanmadan önce tuttuğu değerdir.</p>
<p>Sıfır değer sayılar için <code>0</code>, booleanlar için <code>false</code>, stringler için boş string, diziler, dilimler ve mapler için boş koleksiyondur.</p>
<p>Struct için sıfır değer, tüm alanları sıfır değerlerinde olan structtur.</p>
<p>V bildirim noktasında değer gerektirdiğinden bunları nadiren kendiniz yazarsınız. Derleyici sizin için üretir; aşağıdaki örnek bu yüzden sağ taraflar gereksiz görünse de derlenir.</p>"
		}
		'basics/10':      PageText{
			title: 'Sabitler'
			body:  "<h2>Sabitler</h2>
<p><code>const</code>, derleyicinin programınızı derlerken bildiği değerdir; bu yüzden sabit ifade olmalıdır.</p>
<p>Sabitler <code>const</code> ile yazılır; tek tek ya da parantez içinde grup olarak.</p>
<p>Bazı dillerdeki <code>final</code> ifadesinin aksine, bir <code>const</code> adını değişken için yeniden kullanmak yalnızca derleyici uyarısı verir. Bu uyarıyı hata sayın: ad sabitse her yerde sabit kalmalıdır.</p>"
		}
		'basics/11':      PageText{
			title: 'Tür dönüşümleri'
			body:  "<h2>Tür dönüşümleri</h2>
<p>V hiçbir türü örtük dönüştürmez. Birinden diğerine geçiş her zaman yazılır:</p>
<pre><code>fl := f64(i)</code></pre>
<p>Bazı dönüşümler bilgi kaybeder, bazıları düpedüz reddedilir; dönüşüm anlamsızsa derleyici söyler.</p>
<p>Stringler sayı değildir. Birini sayı olarak okumak için dönüştürün ve metin çözümlenemezse sonucun sıfır değer olabileceğini unutmayın.</p>
<p>Bir türün adını da <code>typeof(x).name</code> ile derleyiciye sorabilirsiniz.</p>"
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
			body:  "<h2>For</h2>
<p>V'nin tek döngü anahtar sözcüğü vardır ve üç biçimde gelir.</p>
<p>Sayaçlı biçim C gibidir:</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>Tek başına koşul while döngüsüdür; koşulsuz hali sonsuza dek döner.</p>
<p><code>break</code> döngüden çıkar, <code>continue</code> sonraki tekrara atlar.</p>
<p>Döngüyü 3'e kadar saymak yerine 5'ten geriye sayacak şekilde değiştirip tekrar çalıştırın.</p>"
		}
		'controlflow/2':  PageText{
			title: 'For, V\'in "while"ıdır'
			body:  "<h2>For, V'in «while»ıdır</h2>
<p>Tek koşullu <code>for</code>, koşul yanlış olana dek sürer.</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p>Hiç koşulsuz <code>for</code> <em>sonsuz döngüdür</em>:</p>
<pre><code>for {</code></pre>
<p>Örnek ikinci döngüden üç tekrardan sonra çıkar. <code>if</code> ve <code>break</code> ifadelerini silerseniz program CPU süresi bitince sandbox tarafından durdurulur.</p>"
		}
		'controlflow/3':  PageText{
			title: 'For devamı'
			body:  "<h2>For devamı</h2>
<p>Koleksiyon üzerinde dönmek dizin yerine <code>in</code> kullanır. Sınır aşamayacağı için varsayılan olarak ulaşılacak biçim budur.</p>
<pre><code>for i, v in items {</code></pre>
<p>Dizini yoksaymak için <code>_</code> kullanın:</p>
<pre><code>for _, v in items {</code></pre>
<p>Belli sayıda yinelemek için aralık kullanın: <code>for i in 0 .. n</code>. <code>..</code> ifadesinin dışlayıcı olduğuna dikkat edin: <code>n</code> kez, <code>0</code> ile <code>n-1</code> arası çalışır.</p>
<p>Mapler anahtar ve değeri verir.</p>"
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  "<h2>If</h2>
<p><code>if</code> şöyle yazılır:</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>Koşulun çevresinde parantez ve <code>then</code> anahtar sözcüğü yoktur.</p>
<p><code>if</code> değer döndürebilen bir ifade olduğundan yukarıdaki kalıp deyimseldir: ilginç durumu ele alıp erken dönün, sonra olağan duruma geçin.</p>
<p>Test zinciri için <code>else if</code> kullanın. V her dalı olduğu gibi kabul eder; zinciri kendiniz denetleyin: testi hiç doğru olamayacak dal çalışmaz ve derleyici bunu göstermez.</p>"
		}
		'controlflow/5':  PageText{
			title: 'Açılmış değerle If'
			body:  "<h2>Açılmış değerle If</h2>
<p>V fonksiyonu değer <em>ya da</em> hata döndürebilir. Dönüş türü önüne <code>!</code> konarak yazılır:</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>Gövde içinde düz değer <code>return</code> edin, V sizin için sarar. Başarısız olmak için yerine <code>error(...)</code> döndürün.</p>
<p>Çağrı yerinde <code>if</code> sonucu açabilir. Başarılı değer <code>v</code> değişkenine bağlanır; hata varsa <code>else</code> dalı hatanın <code>err</code> değişkenine bağlı olduğu şekilde çalışır:</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>İki kez çalıştırın. İlk çağrı başarır, ikincisi başaramaz; ikisi de beklenen dalı alır.</p>
<p>V kodunun çoğu ters gidebilecek şeyleri böyle ele alır. <a href='/optionresult/1'>Sonraki modül</a> bunu hakkıyla anlatır.</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  "<h2>Match</h2>
<p>V'de <code>switch</code> anahtar sözcüğü yoktur. <code>match</code> vardır ve sıradan switchten fazla durumu kapsar.</p>
<p>Değere göre eşleştirme:</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>Aralığa göre eşleştirme. <code>match</code> içindeki aralıklar iki uçta da <em>kapsayıcıdır</em>; bu, <code>for</code> içinde kullandığınız <code>..</code> ifadesinin tersidir:</p>
<pre><code>1 ... 3 { }</code></pre>
<p>Enum değere göre eşleştirme. Her değer dal ister ya da <code>match</code> <code>else</code> ister; derleyici güncellenmesi gereken her <code>match</code> ifadesini göstermeden yeni değer eklenemez.</p>"
		}
		'controlflow/7':  PageText{
			title: 'Match ve toplam türleri'
			body:  "<h2>Match ve toplam türleri</h2>
<p><em>Toplam tür</em>, <code>=</code> ve alternatif listesiyle bildirilir:</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>Bu türden değer alternatiflerden tam biridir; birden fazla asla değildir.</p>
<p>Eşleştirmek hangisi olduğunu söyler. Dal içinde özgün değişken o varyanta <em>akıllıca dönüştürülür</em>; alanları dönüştürmesiz doğrudan kullanılabilir.</p>
<p>Her alternatif dal ister ya da match <code>else</code> ister. Derleyici bunu zorlar; yeni alternatif sessizce yoksayılamaz.</p>
<p>Toplam türe dördüncü şekli ekleyip çalıştırın. Derleyici kaçırdığınız <code>match</code> ifadelerini tek tek söyler.</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  "<h2>Defer</h2>
<p><code>defer</code>, kapsayan blok çıkarken çalışacak deyimi zamanlar.</p>
<p>Blok nasıl çıkarsa çıksın çalışır: sona ererek, erken <code>return</code> ile ya da panic çözülürken. Temizlikte işe yaramasının nedeni budur.</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>Örnekte <code>with_defer</code> gövdesini çalıştırır, sonra ertelenmiş deyim. <code>early_return</code> ortada döner; ertelenmiş deyim yine çalışır.</p>"
		}
		'controlflow/9':  PageText{
			title: 'Alıştırma: Döngüler ve Fonksiyonlar'
			body:  "<h2>Alıştırma: Döngüler ve Fonksiyonlar</h2>
<p><code>sum_to</code> işlevini <code>0</code> ile <code>n</code> arası sayıların toplamını döndürecek, <code>sum_squares</code> işlevini karelerinin toplamını döndürecek şekilde yazın.</p>
<p>İki kez yapın: bir kez en dolaysız haliyle, bir kez açık <code>for</code> döngüsüyle.</p>
<p>Sonra ikisini de <em>O(1)</em> sürede çalışacak şekilde yeniden yazın.</p>
<p>Deneyince ya da takılınca <b>Solution</b> düğmesine basın.</p>"
		}
		'controlflow/10': PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/moretypes/1'>daha fazla tür</a> ile devam edin.</p>"
		}
		'moretypes/1':    PageText{
			title: 'Structs'
			body:  "<h2>Structs</h2>
<p><em>struct</em>, değerleri tek ad altında toplar. V'nin «bunlar birbirine ait» deme yoludur.</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>Değer <code>Point{ x: 3, y: 4 }</code> ile yapılır, alanlar <code>p.x</code> ile okunur.</p>
<p>Dikkat değer iki şey var.</p>
<p>Birincisi, struct kendini yazdırabilir; <code>println(p)</code> ek iş olmadan her alanı gösterir.</p>
<p>İkincisi, değiştirilebilirlik sıradan değişkenlerdeki gibi çalışır. Değişkenin <code>mut</code> olması gerekir:</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>ve alanın kendisi struct içinde <code>mut</code> altında bildirilmelidir:</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p><code>mut</code> altında olmayan alana hiç atama yapılamaz. Yine okunabilir, geçirilebilir, kopyalanabilir.</p>
<p>Struct içinden <code>mut:</code> ifadesini kaldırıp örneği çalıştırın. Derleyici <code>x</code> değişkenine atayan satırı gösterir.</p>"
		}
		'moretypes/2':    PageText{
			title: 'Arrays'
			body:  "<h2>Arrays</h2>
<p>Dizinin uzunluğu sabittir ve öğe türü ilk öğeden gelir:</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>Dizi, uzunluk ve başlangıç değeriyle de yapılabilir:</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>Diziler <code>[]</code> ile dizinlenir ve uzunluklarını taşır:</p>
<pre><code>println(numbers.len)</code></pre>
<p>İki değer içeriklerini paylaşmamalıysa <code>clone</code> ile açık kopya isteyin:</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>Değiştirmesini istemediğiniz bir şeye koleksiyon geçirirken kullanın; çünkü kullanım noktasında söyler, akılda tutulması gereken kurala dayanmaz.</p>
<p>Olağan dönüşümler serbest fonksiyon değil metottur:</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> geçerli öğedir.</p>"
		}
		'moretypes/3':    PageText{
			title: 'Slices'
			body:  "<h2>Slices</h2>
<p>Dilim, dizi ya da başka dilimin aralığına görünümdür ve aynı <code>[]</code> sözdizimiyle yazılır:</p>
<pre><code>part := arr[1..3]</code></pre>
<p>Dilimler yoktan yapılıp büyütülebilir. Büyütme veriyi taşıyabilir; değişken <code>mut</code> olmalıdır:</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> ekler. Her dilimde çalışır; sabit boyutlu dizide çalışma zamanı sürprizi yerine derleme hatası verir.</p>
<p>Başka dilimi dilimlemek onun dilimini verir. Dizilerdeki gibi bağımsız kopya gerekirse <code>clone</code> kullanın:</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>Aralıkların <em>dışlayıcı</em> olduğuna dikkat edin: <code>0 .. n</code>, <code>n</code> kez çalışır ve <code>for</code> döngüsü yalnız bu biçimi kabul eder. <code>match</code> içindeki aralıklar <code>...</code> ile yazılır ve iki uçta da kapsayıcıdır.</p>"
		}
		'moretypes/4':    PageText{
			title: 'Maps'
			body:  "<h2>Maps</h2>
<p>Map anahtar-değer çiftleri tutar ve hazır değer olarak yazılır:</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>Değer türü çıkarılır. Anahtar eklemek ve varlığını sormak:</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>Olmayan anahtarı aramak <em>sıfır değer</em> verir; yoklukla sıfırın ayırt edilmesi gereken arama <code>or</code> kullanır:</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>Yinelemek anahtar ve değeri verir:</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>Mapler referans türdür; düz atama bir mape iki ad bırakır. <code>clone</code>, bağımsız olanı edinme yoludur:</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p><code>clone</code> olmadan derleyici mapin kopyalanamayacağını söyler ve <code>move</code>, <code>clone</code> ya da referans arasında seçim ister. Soru noktanın ta kendisidir: kazara map paylaşmak kolaydır; V hangisini istediğinizi söyletir.</p>"
		}
		'moretypes/5':    PageText{
			title: 'Strings'
			body:  "<h2>Strings</h2>
<p>V stringi bayt dizisidir; bunun bir sonucu hemen karşınıza çıkar: dizinleme bayt verir ve <code>.len</code> bayt sayar.</p>
<pre><code>println(s[0])</code></pre>
<p>Bu ASCII için dosdoğru, başka her şey için yanlıştır; <code>.runes()</code> bu yüzden vardır. Onun yerine karakterleri gezer:</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>Stringler değiştirilemez; üzerindeki her metot yeni string döndürür:</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>Bunlar modüldeki fonksiyon değil metottur; içe aktarılacak şey yoktur. Bazı işlemler <code>strings</code> içinde yaşar; builder özellikle:</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>Döngüde uzun string kurarken tekrarlanan <code>+</code> yerine builder kullanın.</p>"
		}
		'moretypes/6':    PageText{
			title: 'Metotlar'
			body:  "<h2>Metotlar</h2>
<p>Metot, <em>alıcılı</em> fonksiyondur: çağrıldığı değer.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>Alıcı türü metot adından önce gelir ve metot sonra <code>p.sum()</code> olarak çağrılır.</p>
<p><code>&amp;</code> içermeyen alıcı <em>kopyadır</em>; metot aslını değiştiremez. Üzerinden yazmak için alıcıyı referans bildirin ve <code>mut</code> yapın:</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>Bu ayrım V metot hikâyesinin tamamıdır ve sıradan değerlerde gördüğünüz ayrımın aynısıdır: atama değer verir, referans adıyla istenen şeydir.</p>
<p>Metot alıcıyı gerçekten değiştirmeli değilse değer alıcıya gidin. Yalnızca okuyan metot değiştirememelidir.</p>"
		}
		'moretypes/7':    PageText{
			title: 'Alıştırma: Kelime Sayımı'
			body:  "<h2>Alıştırma: Kelime Sayımı</h2>
<p><code>word_count</code> işlevini her kelimenin string içinde kaç kez geçtiğini sayacak şekilde yazın.</p>
<p>Kelimeler harf olmayan her şeyle ayrılır ve sayım harf büyüklüğüne duyarsız olmalıdır. <code>map[string]int</code> kullanın.</p>
<p>Çalışınca çıktıyı mapin gezindiği rastgele sıra yerine sıralı yapın.</p>
<p>Deneyince ya da takılınca <b>Solution</b> düğmesine basın.</p>"
		}
		'moretypes/8':    PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/optionresult/1'>yokluk ve hata yönetimi</a> ile devam edin.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>V, birçok dilin birbirine karıştırdığı iki durumu ayırır ve her birine kendi türünü verir.</p>
<p><code>?T</code>, değer ya da <em>none</em> demektir. Döndürülecek şeyin olmadığı ve yanlış gidenin de olmadığı durum içindir: hiçbir şey bulamayan arama, adayları tükenen tarama.</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>Option, none durumu için değer veren <code>or</code> ile açılır:</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>Ya da yerine başka dal çalıştıran <code>if</code> ile:</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>Değişken yalnızca değer olan dalda bağlanır. <code>else</code> dalında option <code>none</code> idi.</p>
<p>Optionlar törensiz birleşir. <code>?int</code> döndüren fonksiyon başka fonksiyonun optionunu doğrudan döndürebilir:</p>
<pre><code>n := name?.len</code></pre>
<p>O <code>?</code>, «none ise bu fonksiyondan da none döndür» demektir. Değeri iletmekle varsayılan uydurmak arasındaki farktır ve yukarıdaki gövdenin hiç açılmaya gereksinmemesinin nedenidir.</p>
<p>Option yazdırmak hangi yarıyı tuttuğunuzu gösterir; neyin yanlış gittiğini çözerken <code>Option(3)</code> ve <code>Option(none)</code> kendini anlatır.</p>"
		}
		'optionresult/2': PageText{
			title: 'Result ve hatalar'
			body:  "<h2>Result ve hatalar</h2>
<p>Option hiçbir şey yok der. <code>!T</code>, bir şeyin <em>başarısız olduğunu</em> söyler ve nasılına dair mesaj taşır.</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>Düz değer döndürmek açma gerektirmez; V sarar. <code>error(...)</code> döndürmek başarısızlığı yaratır. Sözleşmenin tamamı budur.</p>
<p>Çağrı yeri option ile aynı şekildedir ve <code>err</code> değişkenini <code>else</code> dalında bağlar:</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code> mesajı tek başına verir; hata türünün çevresine eklemiş olabileceği şeyler olmadan. Örnekte her iki biçim de kullanılır.</p>
<p>Yayılım optionlardaki gibi çalışır. <code>parse_pair</code> içindeki her çağrıdaki <code>!</code> işaretine dikkat edin: yarılardan biri başarısız olursa tamamı başarısız olur ve mesaj onunla gider.</p>
<p>Standart kütüphane bu uzlaşımı her yerde izler; <code>json2.decode</code> bu yüzden JSON'unuzun nerede yanlış gittiğini söyleyebilir:</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>İkisi arasında seçim kuralı kısadır. Hiçbir şey bulunamadıysa option. Bir şey denendi ve olmadıysa result. Ve fonksiyon, neden olmadığı bir başarısızlığı iletmek zorundaysa varsayılanla düzleştirmek yerine <code>?</code> ya da <code>!</code> ile yayın.</p>"
		}
		'optionresult/3': PageText{
			title: 'Alıştırma: Options'
			body:  "<h2>Alıştırma: Options</h2>
<p>Her biri option döndüren dört fonksiyon yazın.</p>
<p><code>second_largest</code>, dilimdeki ikinci en büyük <em>farklı</em> değeri, yoksa none döndürür. Yinelenen en büyük sayılmaz; <code>[5, 5]</code> ifadesinin ikinci en büyüğü yoktur.</p>
<p><code>first_word</code>, stringin ilk sözcüğünü, boşsa none döndürür.</p>
<p><code>sum_all</code>, option dilimi alıp int döndürür; none olanları atlar.</p>
<p>Sonra girdiyi özetleyen <code>describe_all</code> işlevini yazın. Hiç açma içermeyecek şekilde <code>?</code> yayılımıyla yazın.</p>
<p>Deneyince ya da takılınca <b>Solution</b> düğmesine basın.</p>"
		}
		'optionresult/4': PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/methods/1'>metotlar ve arayüzler</a> ile devam edin.</p>"
		}
		'methods/1':      PageText{
			title: 'Arayüzler'
			body:  "<h2>Arayüzler</h2>
<p>V'de sınıf yoktur. Metotlu struct her şeydir ve çoğu program için tek gereken budur.</p>
<p><em>Arayüz</em>, metot listesidir. Tür, onlara sahip olarak uygular: yazılacak anahtar sözcük ve bildirilecek şey yoktur.</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p><code>Dog</code> ve <code>Cat</code> ikisi de <code>speak</code> metoduna sahip olunca her biri <code>Speaker</code> istenen yere geçirilebilir:</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>Uygulama örtük olduğundan arayüz, tür sonradan eklenince çalışmaya devam eder. Üçüncü konuşmacı <code>announce</code> içinde de arayüzde de değişiklik gerektirmez.</p>
<p>Arayüz dilimi, tek somut tür dilimi yerine, genellikle istenen şeydir:</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>Tutulacak iki kural. Arayüzleri küçük tutun: bir iki metot soyutlamanın gerçek olduğunun işaretidir; beş, somut türü kopyaladığınız anlamına gelir. Ve arayüzü uygulamaya yanında değil <em>kullanıldığı</em> yerde bildirin. V ikisini de gerektirmez ama okuyucu arayüzü tüketen fonksiyonda arar.</p>"
		}
		'methods/2':      PageText{
			title: 'Gömme'
			body:  "<h2>Gömme</h2>
<p>Struct başka struct gömebilir; yalın tür adıyla yazılır:</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>Gömülü structun alanları dıştakinin alanları olur ve metotları beraberinde gelir. <code>u.id</code> ve <code>u.name</code> ikisi de düpedüz <code>User</code> alanıdır; <code>u.describe()</code>, <code>Base</code> sınıfından gelen metottur.</p>
<p>Ortak alan ve ortak metot böylece bir kez yazılır. <em>Arayüz</em> gömmek de olur; türün alan yerine davranış koyma yoludur.</p>
<p>Şaşırtan bir kural vardır ve zor yoldan öğrenmeye değer. Gömülü struct dış türün üyelerini miras alır ama dış türün kendi metotlarına erişim <em>kazanmaz</em>. Yani <code>Base</code> üzerindeki metot, gömen structa aitken <code>area()</code> işlevini çağıramaz.</p>
<p>Bir fonksiyonun birkaç türde çalışması gerekirse yerine arayüzü parametre alın:</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>Gömme, türle parçaları arasında durum ve davranış paylaşmak içindir. Arayüzler birbiriyle alakasız birkaç tür hakkında bir kez yazmak içindir. Farklı sorulara yanıt verirler, ayrı tutmaya değer.</p>"
		}
		'methods/3':      PageText{
			title: 'Yazdırılabilir türler'
			body:  "<h2>Yazdırılabilir türler</h2>
<p>V değeri, alanlarını yansıtarak değil <code>str</code> metoduyla yazdırır; tür, birini tanımlayarak nasıl görüneceğini denetler:</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>Artık <code>println(t)</code>, string iç interpolation ve birleştirme hepsi bunu kullanır:</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>En sık yazacağınız metot budur ve erken yazmaya değer: kendini akıllıca yazdıran tür sonraki her hata ayıklama oturumunu kolaylaştırır.</p>
<p>Bu yalnız yazdırmayı etkiler. <code>string</code> beklenen başka her yerde <code>.str()</code> çağırarak açıkça verin: <code>str</code> metotlu tür kendi türü olarak kalır; derleyici sizin için dönüştürmez.</p>"
		}
		'methods/4':      PageText{
			title: 'Alıştırma: Şekiller'
			body:  "<h2>Alıştırma: Şekiller</h2>
<p>Yazılacak dört şey var.</p>
<p><code>Square</code> ve <code>Triangle</code> sınıflarına <code>area</code> metodu verin ve <code>total_area</code> işlevini arayüz üzerinden şekil dilimini toplayacak şekilde yazın.</p>
<p>Sonra ne şekil olduğunu bilmeden şeklin adını ve alanını bildiren <code>describe(s Shape)</code> işlevini yazın.</p>
<p>Son bölümde tuzak vardır ve bulmak alıştırmanın çoğudur. <code>describe</code> işlevini her şekil miras alsın diye <code>Base</code> sınıfına koymak isteyeceksiniz. Bu çalışmaz; derleyici nedenini söyler.</p>
<p>Deneyince ya da takılınca <b>Solution</b> düğmesine basın.</p>"
		}
		'methods/5':      PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/generics/1'>generics</a> ile devam edin.</p>"
		}
		'generics/1':     PageText{
			title: 'Generic fonksiyonlar'
			body:  "<h2>Generic fonksiyonlar</h2>
<p>Tür parametresi tür yerine geçer; tek bildirim bütün bir türe ailesine hizmet edebilir. V bunu köşeli parantezle yazar ve ezberlenecek tek sözdizimi parçası budur:</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>Açı parantezler burada sözdizimi <em>değildir</em>. <code>fn max_of&lt;T&gt;(...)</code> olarak yazmak farklı yazım değil çözümleme hatasıdır ve doğru yapılacak ilk şeydir.</p>
<p>Tür argümanını nadiren adlandırırsınız. Derleyici argümanlardan çıkarır; değişkeni hazır değer kadar iyi okur:</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>Tür parametresi ancak derleyicinin kendi başına çıkaramadığı yerde gerekir. Dönüş konumunda sıklıkla noktanın ta kendisidir:</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>O <code>?T</code>, önceki derste neyse aynen odur: bu örneklemenin her ne türü ise değer ya da none.</p>
<p>Geri çağrı fonksiyon türü olarak yazılır, yani <code>fn (T) R</code>. Bu, girdi ve çıktı türlerini bağımsız kılar; fonksiyonu boru hattı yapan budur:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>Tek bildirim ve alınan her argüman türü için ayrı örnekleme. Kutulama ve silme yoktur: <code>int</code> geri çağrılı <code>apply</code> ile <code>string</code> geri çağrılı <code>apply</code> iki ayrı fonksiyondur; geri çağrı türünün tahmin değil yazılması gerekir.</p>"
		}
		'generics/2':     PageText{
			title: 'Generic structlar'
			body:  "<h2>Generic structlar</h2>
<p>Struct, fonksiyon gibi tür parametresi alır ve ondan söz eden her alanı örneklemeye aittir:</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>Yani <code>Stack[int]</code> bir <code>[]int</code> tutar, <code>Stack[string]</code> bir <code>[]string</code> tutar ve bunlar iki ayrı türdür. Üzerinde durmaya değer çünkü <code>int</code> yığınıyla <code>string</code> yığınını türü bir yerde silmeden tek dilime koyamazsınız demektir.</p>
<p>Metotlar da parametreyi taşır. Alıcıdaki <code>mut</code>, metodun struct değiştirmesini sağlayan şeydir; <code>&amp;</code> yalnız okuduğunu söyler:</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p><code>?T</code>, aynı şekilde parametrelenmiş option türdür; boş yığından almak panic yerine <code>none</code> verir.</p>
<p>İki parametre aynı fikrin iki kezidir ve birbirinden bağımsızdır:</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>İnsanları yakalayan sınır işte budur ve bakılan metoda işaret etmediği için hata iletisi konusunda kesin olmaya değer. <code>A</code> ile <code>B</code> ilişkisizdir; aralarında önerilecek dönüşüm yoktur ve metot değeri bir alandan diğerine taşıyamaz:</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>Neden, çiftlerden çok generic metotların özelliğidir ve ezberden çok anlaşılmaya değer. Generic metot gövdesi kullanılan <em>her</em> örneklemeye karşı denetlenir; aynı anda hepsi için geçerli olmalıdır. Metot bu yüzden iki alanı tek tür tutan <code>Pair[int, int]</code> üzerinde iyidir ama <code>Pair[string, int]</code> kullanınca reddedilir. Hata, bildirimi değil suçlu örneklemeyi adlandırır:</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>Tutulacak kural, generic metodun ancak kullanılacağı her tür için doğru şeyi vaat edebileceğidir. Her iki alanı okumak her zaman nitelenir; <code>describe</code> bu yüzden her örneklemede çalışır:</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: 'Generic türlerin mapleri'
			body:  "<h2>Generic türlerin mapleri</h2>
<p>Generic tür map değer türü olabilir ve tür argümanı kullanım noktasında yazılır. Map o zaman tek somut türden sıradan maptir:</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p>Yalın <code>Stack</code> burada yetmez. Map, değerlerinin neyin yığınları olduğunu bilmelidir; argümanı atlamak, derleyicinin sonra çıkaracağı şey değil hatadır.</p>
<p>Bilinmeye değer sonuç: <code>map[string]Stack[int]</code> ile <code>map[string]Stack[string]</code> ayrı türlerdir; ikisine de ihtiyaç duyan program birinin diğerinin yerine geçmesine izin vermek yerine söylemelidir.</p>
<p>Generic metotlar mapin dağıttığı değerlerde kullanılabilir; mapi yalnızca yasal değil yararlı kılan budur:</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>Map döngüsündeki <code>_,</code> işaretine dikkat edin. Anahtarı adlandırmak <code>for team, stack in teams</code> olurdu; yalın alt çizgi anahtarın gerekmediğini söyler. Yalın olmalıdır: adı izleyen alt çizgi reddedilir; <code>_k</code> olmaz.</p>
<p>Mapler referans türdür; iki adımlı yazmayı çalıştıran budur: <code>teams['red'].push(10)</code> yığını mapte bulur ve aynı structı değiştirir; kopyalayıp değişikliği yitirmez.</p>"
		}
		'generics/4':     PageText{
			title: 'Birden fazla tür parametresi'
			body:  "<h2>Birden fazla tür parametresi</h2>
<p>Tür parametreleri yığılır. Fonksiyonda iki tanesi genellikle girdi ve çıktı türüdür; generic fonksiyonu eşleme yapan budur:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>Tür parametresinin gövdede görünmesi gerekmez. Yararsız fonksiyon yazma yolu gibi duyulur ve sıklıkla aynen doğrudur: parametre, çağrı yerinde bedelsiz imzayı kısıtlar.</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>Gövdede <code>K</code> geçmez; bu, anahtarları string mapiyle anahtarları int mapi için aynı fonksiyondur. <code>?V</code> bilinçlidir: boş mapin ilk değeri yoktur; fonksiyon uydurmak yerine none döndürür.</p>
<p>En sık gelen şekil, map üzerinde generic fonksiyonla her değerle ne yapılacağına karar veren geri çağrıdır:</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p><code>K</code> ile <code>V</code> mapten çıkarılır; <code>R</code>, geri çağrının döndürdüğü şey olduğu için <code>int</code> sabitlenir. Çıkarımın çalışacak şeyi yoksa argümanları açık adlandırın: <code>first_map[string, int](m)</code>.</p>
<p>Çıkarımın yapmayacağı şey uyumsuz argümanı kurtarmaktır. <code>map[K]Counter[V]</code> istenen yere <code>Counter[V]</code> geçirirseniz hata gerçek sorunu değil çıkarılamaz <code>K</code> değişkenini adlandırır; kafa karıştırıcı ilk karşılaşmadır. Generic hatası aramadan önce argümanın türünü denetleyin.</p>"
		}
		'generics/5':     PageText{
			title: 'Alıştırma: Generics'
			body:  "<h2>Alıştırma: Generics</h2>
<p>Yazılacak dört şey var ve aralarında bu dersin her şeklini kullanırlar.</p>
<p><code>index_of[T]</code>, değerin dilimdeki konumunu ya da -1 döndürür. <code>==</code> destekleyen her türde çalışır.</p>
<p><code>count_matching[T]</code>, yüklemi sağlayan öğe sayar. Yüklem geri çağrıdır; türü <code>fn (T) bool</code> yazılır.</p>
<p>Sonra anahtar başına sayım tutan generic struct <code>Counter[K]</code>. <code>add</code> ve <code>get</code> verin; <code>K</code> burada başka generic tür içinde kullanılır: anahtarı tür parametresi olan map.</p>
<p>Son olarak anahtarın geri çağrısıyla ağırlıklandırılmış sayaç mapini toplayan <code>grand_total[K, V]</code>. İki tür parametresi ve map değer türü olarak generic struct.</p>
<p>Deneyince ya da takılınca <b>Solution</b> düğmesine basın.</p>"
		}
		'generics/6':     PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız!</p>
<p>Sıradaki ne öğreneceğinizi görmek için <a href='/list'>modül listesine</a> geri dönün veya <a href='/concurrency/1'>eşzamanlılık</a> ile devam edin.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p><code>spawn</code> iş parçacığı başlatır ve hemen döner. Tutamak verir; tutamak, iş parçacığını sonra bekleme yoludur:</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> kendisi hiçbir şeyi beklemez. İş parçacığı çalışırken biten program onu yazının ortasında bırakır; kural, her spawnun sonunda beklenmesidir.</p>
<p>Sabit iş kümesi için tutamakları dilimde toplayın. Öğe türü <code>thread</code> olur; dilimdeki <code>wait()</code> hepsini birleştirir:</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>Çalışanlar bir şey döndürünce dilim <code>[]thread int</code> olur ve <code>wait()</code> sonuçları sırayla verir:</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>Sıra kesin olmaya değer. Sonuçlar tutamakların eklendiği sırayla gelir; iş parçacıklarının bitiş sırasına göre değil. Bu, yanıt toplama yoludur; işe sıra dayatma yolu değildir. Hangi iş parçacığının önce yazdırdığına program güvenmemelidir; örnekteki iç içe çıktı bunun dürüst halidir.</p>"
		}
		'concurrency/2':  PageText{
			title: 'Channels'
			body:  "<h2>Channels</h2>
<p>Kanal, tek türden değerleri bir iş parçacığından diğerine taşır. Öğe türü ve kapasiteyle oluşturun; gönderip almak için aynı oku kullanın:</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>Her iki yön de <code>&lt;-</code> olur çünkü ikisi de öbür taraftan alır. <code>ch.recv()</code> ya da <code>ch.pop()</code> yoktur; derleyici ikisini de bilinmeyen fonksiyon diye reddeder. Burada metoda alışıksanız unutulacak şey budur.</p>
<p>Kapasitesiz <code>chan int{}</code> <em>arabellek­sizdir</em>; kanal hiçbir şey tutmaz. Alıcı orada durmadıkça gönderme bitemez; gönderen bir şey üretmedikçe alma bitemez. Her değer iki iş parçacığı arası tokalaşmadır:</p>
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
<p>Örnek çıktıyı okuyun, tokalaşma görünür: göndermelerle almalar sırayla; güvenilecek sabit sırada değiller. Arabelleksiz kanalın noktası budur, kusuru değil.</p>
<p>Kanal tam bir tür taşır; iki ayrı çeşit ileti beklemek iki kanal demektir. <code>select</code>, ileride, birden fazlasını birden bekleme yoludur.</p>"
		}
		'concurrency/3':  PageText{
			title: 'Bufferlı kanallar'
			body:  "<h2>Bufferlı kanallar</h2>
<p>Kapasite kanala yer verir; gönderen her değerde takılmak yerine öne geçebilir:</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>Fark ölçülebilir. Ara Bellekle tüm göndermeler tamamlanır; <code>len()</code> bekleyen değer sayısını bildirir. Belleksiz <code>len()</code> ne kadar beklenirse beklensin sıfır kalır; konacak yer yoktur:</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>Üretici yavaş tüketiciye takılmamalıysa ara bellek seçin. Kapasite kanal oluşturulurken sabitlenir; aynı öğe türünden arabellekli ile arabelleksiz kanal ayrı türlerdir.</p>
<p>Akılda tutmaya yarım dakika değer tuzak işte budur. Boyutu ayarlayan alan <code>cap:</code> olur; yerine <code>len:</code> yazmak sessizce yoksayılmak yerine reddedilir:</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>İleti istediğiniz alanı adlandırır; olabilecek en iyisi bu sayılır. Öbür tuzak yazımla ilgili değildir. Ara belleklemeye kapasiteye kadar yardım eder: koyacak yerden fazla gönderecek gönderen, sığmayan ilk değerde takılır. Dört yuva altı işle, tüketici başlamamışken beşinci gönderme çalışmayan tüketiciyi bekler. Ya listeyi bütün ara belleğe alın ya önce tüketicileri başlatın.</p>"
		}
		'concurrency/4':  PageText{
			title: 'Kapanana kadar alma'
			body:  "<h2>Kapanana kadar alma</h2>
<p><strong>V'de <code>for x in ch</code> yoktur.</strong> Kanal koleksiyon değildir; for döngüsünün dizinleyeceği şey yoktur ve derleyici şöyle der:</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>Kanalda gezilebilen dilden geliyorsanız ilk yanlış yapacağınız budur. <code>&lt;-ch</code> ile alın; kanalı sonuna dek okumak için vermeyi kesene dek alın:</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p><code>or</code>, döngüyü bitiren değeri verir ve ters yönde yanlış yapılması kolay kısım budur: <strong><code>or</code> ancak kanal kapalı ve boşken ateşlenir.</strong> İçinde hiçbir şey olmayan açık kanalda <code>&lt;-ch or { -1 }</code> gönderen bekleyerek takılı kalır. Görünüşe bakılırsa bakılsın engelsiz yoklama değildir.</p>
<p>Göndermeler hakkında kimse söylemezse öğleden sonranıza mal olacak ayrıntı. Gönderme ifadesi okta durur; sağdaki hesaplanmış değer parantez ister:</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>Bunlar olmadan derleyici <code>ch &lt;- i</code> ifadesinin ürettiği void ile çarpmaya çalışır ve oku açıkça göstermeyen şekilde söyler.</p>
<p>Üretici sayıyı söyleyince döngü gereksizdir:</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>Bu yalın biçimin keskin kenarı vardır. Kapalı boş kanalda yalın <code>&lt;-ch</code> takılmaz, panic olmaz: öğe türü için <em>sıfır değeri</em> verir, her seferinde. Bir fazla değer isterseniz hata yerine sessiz <code>0</code>, boş string ya da sıfır struct alırsınız:</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>Sayı kesin değilse <code>or</code> yeğleyin; hiç beklemeden bakmak isterseniz <code>try_pop</code> uzanın:</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: 'Kapatma'
			body:  "<h2>Kapatma</h2>
<p>Kanalı üreticisi işini bitirince kapatın ve üreticiden kapatın. Üretici kanala, durma kararına sahip olduğu gibi sahiptir:</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>İnsanları yakalayan ayrıntı: yalın <code>close</code>, kanal kapatma yolu değildir. Yalın çağrı olarak yazılınca dosya tanımlayıcı kapatan yerleşik işlevdir ve kanalda kafa karıştırıcı iletiyle başarısız olur:</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>Kapatmak arabellekte duranı atmaz. Kanaldaki değerler önce sırayla okuyucuya verilir; alım ancak boşalınca bir şey bulamaz. Bu sıralama close ifadesini olması gereken sinyal yapan şeydir.</p>
<p>Close ifadesinin yapmadığı şey göndermeyi yasal kılmaktır. Kapalı kanala göndermek çalışma zamanı panic olur; iki kez kapatmak da; kural, sahibi tek yerden kanal başına tek kapatmadır.</p>
<p>Ve close bekleme değildir. Açık boş kanaldan almak, biri kapatacak olsa da olmasa da takılır.</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  "<h2>Select</h2>
<p><code>select</code> birkaç kanalda bekler ve hazır olanın gövdesini çalıştırır. Sabit sıra yerine ilk yanıtı alma yoludur:</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>Dal, alma ya da göndermedir; iki yön yarışabilir:</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>Yazmadan bilinecek iki kısıt; ikisi de belgeden çok derleyiciye karşı ölçüldü.</p>
<p><strong>İki şekli ayrı selectlerde tutun.</strong> Gönderme dalıyla alma dalı tutan select hata bildirmek yerine derleyiciyi düpedüz çökertir; göndermeyi zaman aşımı ya da başka göndermeyle eşleyin.</p>
<p><strong>Dal, halihazırda var kanalı adlandırmalıdır.</strong> Kanalı satır içinde yazmak reddedilir:</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>Dallar döndürmek yerine atar; yazdıkları değişken <code>mut</code> olmalıdır. Dal konumundaki süre zaman aşımıdır ve select başına tektir. Beklemenin sınırsız olmaktan çıkma yolu budur:</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code>, hiçbir şey hazır değilken daldır ve beklemez. Engelsiz biçim budur:</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>İfade olarak select <strong>bool</strong> değerlenir: kanal dalı çalışınca true, <code>else</code> çalışınca false. Dalın değerine değerlenmez; değeri dalda okuyup boolu ayrı sınayın.</p>
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
<p>Hazır olunacak asimetri. Kanal kapanınca ondan almak kalıcı hazırdır; kapalı kanal her tur selecti kazanır. Birkaç kanal üstünde döngüde ilgilendiklerinizi boşaltıp kapanmayı kendiniz denetleyin; geçmek için selecte güvenmeyin.</p>"
		}
		'concurrency/7':  PageText{
			title: 'Paylaşılan durum'
			body:  "<h2>Paylaşılan durum</h2>
<p>Kanallar değer taşır. İş parçacıkları <em>aynı</em> değeri değiştirmeli ise bu kilidin işidir.</p>
<p>Bariz olmayan kısım durumun nasıl paylaşıldığıdır. İş parçacığına değerle geçirilen struct kopyadır ve her iş parçacığı kendininkini alırdı. Parametredeki <code>shared</code> anahtar sözcüğü onu tek yapan şeydir:</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>Parametre listesindeki <code>shared t</code> ifadesine ve çağrı yerindeki <code>spawn add(shared total, i)</code> ifadesine dikkat edin. İkisi de gerekir. Anahtar sözcüksüz geçirirseniz iş parçacığı kopya alır; sayaç hiç oynamaz.</p>
<p><code>lock</code> bloktur, çağrı değil; kapama ayracı serbest bırakır. Eşleşecek <code>unlock</code> deyimi yoktur ve yazmak sözdizimi hatasıdır. Olabildiğince kısa tutun: spawn boyunca değil, kanal göndermesi boyunca değil, gerçek iş çevresinde değil. Tıkanabilecek şey boyunca tutulan kilit, programın kilitlenme yoludur.</p>
<p><code>rlock</code> okuma sürümüdür ve yazıldığından çok okunan yapı içindir:</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p><code>shared</code> değişken kullanım noktasında da kilitlenmelidir; derleyici kilidin kazara unutulmasına izin vermez.</p>
<p>Dikkat edilecek bir şey vardır ve örneğin iş parçacıklarını beklemeden önce değer okumasının nedeni budur. Spawn beklemez; spawn hemen ardından paylaşılan durumu okumak yarıştır: görülen değer iş parçacıklarının vardığı yere bağlıdır. Okumadan önce yazanları bekleyin ya da sayının geçici olduğunu kabul edin.</p>"
		}
		'concurrency/8':  PageText{
			title: 'Bekleme grupları'
			body:  "<h2>Bekleme grupları</h2>
<p>Bekleme grubu süren işi sayar. Spawn öncesi <code>add</code>, içinde <code>done</code> ve her şeyi başlatınca <code>wait</code>:</p>
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
<p>Grubu <code>&amp;sync.WaitGroup</code> olarak alın, <code>mut &amp;sync.WaitGroup</code> olarak değil. <code>mut</code> referansı derlenir, sonra çalışma zamanında atomik sayaç içinde çöker; yalın referans kullanılacak biçimdir.</p>
<p><code>wg.go</code>, add ile iş parçacığı başlatmayı paketler; ikisinin ayrıldığı adımı kaldırır:</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>Çağrı yerine kapanış alır ve V kapanışı okuduğu şeyi adlandırmak zorundadır. <code>fn [ch, i] ()</code> listesi bu bildirimdir; değişken atlamak, eşzamanlılıkla ilgili değil değişkeni adlandıran derleme hatasıdır.</p>
<p>Üç kural ve yanlış gidenlerin çoğu budur. Her <code>add</code> eşleşen <code>done</code> ister; <code>add</code> içermeyen <code>done</code> panic olur. Her spawn <code>wait</code> öncesinde olmalıdır çünkü waitin gördüğü hepsi budur. Panic olan iş parçacığı bütün süreci götürür; yarıda başarısız olabilecek doğurtulmuş fonksiyonun kendi <code>defer</code> ifadesine ihtiyacı vardır.</p>"
		}
		'concurrency/9':  PageText{
			title: 'Alıştırma: Worker pool'
			body:  "<h2>Alıştırma: Worker pool</h2>
<p>Çalışan havuzu kurup işle besleyin.</p>
<p><code>worker</code> kanaldan bir iş alır, ikiye katlar ve sonucu başka kanala gönderir. Havuz ne zaman bittiğini bilsin diye bekleme grubu verilir.</p>
<p><code>run_all</code> iş dilimiyle çalışan sayısını alır ve sonuçları varış sırasına göre döndürür.</p>
<p>İşlem sırası alıştırmanın tamamıdır ve dört şey aynı anda doğru olmalıdır:</p>
<ul>
<li>İş kanalı çalışanlar başlamadan <em>önce</em> kapatılır; yoksa çalışan hiç gelmeyecek kapanmayı bekler kalabilir.</li>
<li>Her <code>add</code>, <code>wait</code> öncesinde; her <code>done</code> çalışan içindedir.</li>
<li>Her iki kanal arabelleklidir; çalışan değer verirken hiç takılmaz.</li>
<li>Sonuçlar <code>&lt;-results or { break }</code> ile toplanır; kanal üstünde <code>for</code> yoktur.</li>
</ul>
<p>İkisi bu alıştırmanın genellikle çıkardığı kilitlenmedir: iş listesinden dar iş kanalı ya da <code>wait</code> öncesi okunan sonuçlar.</p>
<p>Deneyince ya da takılınca <b>Solution</b> düğmesine basın.</p>"
		}
		'concurrency/10': PageText{
			title: 'Tebrikler!'
			body:  "<p>Bu dersi tamamladınız ve tüm turu tamamladınız!</p>
<p>Herhangi bir şeyi yeniden okumak için <a href='/list'>modül listesine</a> geri dönün veya <a href='/welcome/1'>başlangıç</a>'tan yeniden başlayın.</p>"
		}
		'cli/1':          PageText{
			title: 'Günlük komutlar'
			body:  "<h2>Günlük komutlar</h2>
<p>Neredeyse her değişiklikte üç komut çalışır. <code>v fmt -w .</code> projeyi yerinde biçimler, <code>v vet .</code> şüpheli yapıları bildirir, <code>v test .</code> test paketini çalıştırır:</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>Her commit öncesi biçimlendirin; inceleme asla düzen tartışmasın.</p>
<p><code>v doc strings</code> modül belgesini gösterir, <code>v repl</code> etkileşimli istem açar, <code>v watch run main.v</code> kaynak değişince yeniden derleyip çalıştırır.</p>"
		}
		'vpm/1':          PageText{
			title: 'Paketler'
			body:  "<h2>Paketler</h2>
<p>Kütüphaneler paket kayıt defterinde yaşar. Arayın, sonucu inceleyin, kurun:</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p><code>v list</code> projenin neye bağımlı olduğunu gösterir. <code>v outdated</code> yeni sürümleri bildirir, <code>v update</code> getirir, <code>v remove</code> kaldırır.</p>
<p>Bu komutlar ağa ulaşır; bu turun sandboxunda değil kendi makinenizde çalışır.</p>"
		}
		'mcp/1':          PageText{
			title: 'Model bağlam protokolü'
			body:  "<h2>v mcp</h2>
<p><code>v mcp serve</code> derleyicinin kendisini kod ajanına açar: standart girdi çıktı üzerinden bildirimler, referanslar, tanılamalar:</p>
<pre><code>v mcp serve</code></pre>
<p><code>v mcp tools</code> açılanı listeler. <code>--http</code> ile HTTP üzerinden sunun, göreli yolları dizine göre <code>--root</code> ile çözün, <code>--read-only</code> ile dosya yazan araç kaydetmeyin.</p>
<p><code>v mcp install</code> sunucuyu ajana bağlar, <code>v mcp uninstall</code> kaldırır. Bu yüzey yenidir; sandboxun çalıştırdığı sürüm değil güncel V ister.</p>"
		}
		'skills/1':       PageText{
			title: 'Beceriler'
			body:  "<h2>Beceriler</h2>
<p>Skill, ajanın görev için yüklediği paketlenmiş yönergelerdir: dil kuralları, test döngüsü, araç yüzeyi:</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>Skiller projede <code>.agents/skills/</code> altına, <code>--global</code> ile ev dizini altına kurulur. <code>v skills path v-tools</code> birinin nerede yaşadığını gösterir; <code>--dry-run</code> yazmadan bildirir.</p>
<p><code>v mcp</code> gibi bu da yeni yüzeydir: güncel V ister.</p>"
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
