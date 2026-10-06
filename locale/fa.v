module locale

// fa is the Persian translation. It is the reference locale: the first one
// written, and the one that proves the right to left path, because Persian is
// written right to left while every code sample in the tour is not.
//
// A few notes on how the translation handles code, since this is where a
// translation goes wrong most often:
//
//   - `<code>` spans, program text and `<pre>` blocks are never translated.
//     They are code, and code reads the same in every language.
//   - Latin words inside Persian prose, like "Run", are the buttons' own
//     labels, so they are translated like any other interface string rather
//     than left as the English word.
//   - Numbers stay Latin, because that is what the code uses.
pub const fa = Text{
	modules: {
		'mechanics':    'کار با تور'
		'basics':       'انواع پایه'
		'controlflow':  'کنترل جریان'
		'moretypes':    'انواع بیشتر'
		'optionresult': 'Option و Result'
		'methods':      'متدها و اینترفیس‌ها'
		'generics':     'ژنریک‌ها'
		'concurrency':  'هم‌روندگی'
	}
	lessons: {
		'welcome':      'خوش آمدید!'
		'basics':       'انواع پایه'
		'controlflow':  'کنترل جریان'
		'moretypes':    'انواع بیشتر'
		'optionresult': 'Option و Result'
		'methods':      'متدها و اینترفیس‌ها'
		'generics':     'ژنریک‌ها'
		'concurrency':  'هم‌روندگی'
	}
	pages:   {
		'welcome/1':      PageText{
			title: 'سلام، دنیا'
			body:  "<p>به توری از <a href='https://vlang.io'>زبان برنامه‌نویسی V</a> خوش آمدید.</p>
<p>این تور به چند ماژول تقسیم شده است. می‌توانید آن‌ها را از <a href='/list'>فهرست مطالب</a> یا از دکمهٔ منو در گوشهٔ بالا-راست صفحه باز کنید.</p>
<p>در طول تور با اسلاید و تمرین روبه‌رو می‌شوید. با پیوندهای <b>قبلی</b> و <b>بعدی</b> در پایین متن، یا با کلیدهای <code>PageUp</code> و <code>PageDown</code> میان آن‌ها جابه‌جا شوید.</p>
<p>این تور تعاملی است. برای کامپایل و اجرای برنامه دکمهٔ <b>اجرا</b> (یا <code>Shift</code>+<code>Enter</code>) را بزنید. نتیجه زیر کد ظاهر می‌شود.</p>
<p>این برنامه‌ها نقطهٔ شروعی برای آزمایش خودتان هستند. برنامه را ویرایش کنید و دوباره اجرا کنید.</p>
<p>تور دکمهٔ <b>قالب‌بندی</b> ندارد. <code>v fmt</code> به ابزار کمکی خودش نیاز دارد و آن ابزار داخل صندوقی که تور کد ناشناس را در آن اجرا می‌کند ساخته نمی‌شود.</p>"
		}
		'welcome/2':      PageText{
			title: 'کار با این تور'
			body:  '<p>هر صفحه یک ستون متن و یک ستون کد دارد. بین آن‌ها یک دستگیرهٔ کشیدنی است: آن را بکشید تا ستون کد پهن‌تر شود.</p>
<p>هر صفحه نام فایل برنامهٔ خود را در بالای ویرایشگر نشان می‌دهد. در بیشتر صفحه‌ها یک فایل هست، و آن یکی همیشه <code>main.v</code> است.</p>
<p>متن ویرایشگر برای شما نگه داشته می‌شود، پس اگر صفحه را ببندید و برگردید، کارتان هست.</p>'
		}
		'welcome/3':      PageText{
			title: 'V آفلاین (اختیاری)'
			body:  "<p>برای استفاده از این تور نیازی به نصب محلی V ندارید، اما داشتن آن ارزش دارد.</p>
<p>برای نصب V، دستورالعمل‌های <a href='https://vlang.io/install.html'>vlang.io/install</a> را دنبال کنید. در ویندوز، مک و لینوکس نصب‌کننده یک دستور واحد است.</p>
<p>با نصب V، هر صفحه از این تور را می‌توانید محلی دانلود و اجرا کنید. برنامه را در فایلی به نام <code>main.v</code> کپی کنید و اجرا کنید:</p>
<pre><code>v run main.v</code></pre>
<p>برنامه‌های اینجا فقط از کتابخانه استاندارد استفاده می‌کنند، پس همان‌طور نسخه‌هایی که تور برای شما اجرا می‌کند کار می‌کنند.</p>"
		}
		'welcome/4':      PageText{
			title: 'صندوق اجرا'
			body:  '<p>برنامه‌های شما در یک صندوق اجرا روی سرور اجرا می‌شوند. هر اجرا یک پوشه تازه و خالی می‌گیرد و از بقیه ماشین جدا است.</p>
<p>برنامه اول کامپایل می‌شود. اگر کامپایل نشود، چیزی اجرا نمی‌شود و پیام کامپایلر نمایش داده می‌شود، با خطای مربوطه در ویرایشگر مشخص شده. آن را اصلاح کنید و دوباره اجرا کنید.</p>'
		}
		'welcome/5':      PageText{
			title: 'آفرین!'
			body:  "<p>اولین ماژول تور را تمام کردید!</p>
<p>به <a href='/list'>فهرست ماژول‌ها</a> برگردید تا ببینید چه چیزی را بعداً یاد بگیرید، یا مستقیم با <a href='/basics/1'>پایه‌های زبان</a> ادامه دهید.</p>"
		}
		'basics/1':       PageText{
			title: 'ماژول‌ها'
			body:  '<h2>ماژول‌ها</h2>'
		}
		'basics/2':       PageText{
			title: 'واردات'
			body:  '<h2>واردات</h2>'
		}
		'basics/3':       PageText{
			title: 'متغیرها'
			body:  '<h2>متغیرها</h2>'
		}
		'basics/4':       PageText{
			title: 'متغیرهای تغییرپذیر'
			body:  '<h2>متغیرهای تغییرپذیر</h2>'
		}
		'basics/5':       PageText{
			title: 'اعلان‌های کوتاه'
			body:  '<h2>اعلان‌های کوتاه</h2>'
		}
		'basics/6':       PageText{
			title: 'توابع'
			body:  '<h2>توابع</h2>'
		}
		'basics/7':       PageText{
			title: 'نتایج متعدد'
			body:  '<h2>نتایج متعدد</h2>'
		}
		'basics/8':       PageText{
			title: 'انواع پایه'
			body:  '<h2>انواع پایه</h2>'
		}
		'basics/9':       PageText{
			title: 'مقادیر صفر'
			body:  '<h2>مقادیر صفر</h2>'
		}
		'basics/10':      PageText{
			title: 'ثابت‌ها'
			body:  '<h2>ثابت‌ها</h2>'
		}
		'basics/11':      PageText{
			title: 'تبدیل نوع'
			body:  '<h2>تبدیل نوع</h2>'
		}
		'basics/12':      PageText{
			title: 'آفرین!'
			body:  "<p>این درس را تمام کردید!</p>
<p>به <a href='/list'>فهرست ماژول‌ها</a> برگردید تا ببینید چه چیزی را بعداً یاد بگیرید، یا با <a href='/controlflow/1'>کنترل جریان</a> ادامه دهید.</p>"
		}
		'controlflow/1':  PageText{
			title: 'حلقه for'
			body:  '<h2>حلقه for</h2>'
		}
		'controlflow/2':  PageText{
			title: 'for همان while در V است'
			body:  '<h2>for همان while در V است</h2>'
		}
		'controlflow/3':  PageText{
			title: 'ادامه for'
			body:  '<h2>ادامه for</h2>'
		}
		'controlflow/4':  PageText{
			title: 'if'
			body:  '<h2>if</h2>'
		}
		'controlflow/5':  PageText{
			title: 'if با مقدار بازشده'
			body:  '<h2>if با مقدار بازشده</h2>'
		}
		'controlflow/6':  PageText{
			title: 'match'
			body:  '<h2>match</h2>'
		}
		'controlflow/7':  PageText{
			title: 'match و انواع جمع'
			body:  '<h2>match و انواع جمع</h2>'
		}
		'controlflow/8':  PageText{
			title: 'defer'
			body:  '<h2>defer</h2>'
		}
		'controlflow/9':  PageText{
			title: 'تمرین: حلقه‌ها و توابع'
			body:  '<h2>تمرین: حلقه‌ها و توابع</h2>'
		}
		'controlflow/10': PageText{
			title: 'آفرین!'
			body:  "<p>این درس را تمام کردید!</p>
<p>به <a href='/list'>فهرست ماژول‌ها</a> برگردید تا ببینید چه چیزی را بعداً یاد بگیرید، یا با <a href='/moretypes/1'>انواع بیشتر</a> ادامه دهید.</p>"
		}
		'moretypes/1':    PageText{
			title: 'ساختارها'
			body:  '<h2>ساختارها</h2>'
		}
		'moretypes/2':    PageText{
			title: 'آرایه‌ها'
			body:  '<h2>آرایه‌ها</h2>'
		}
		'moretypes/3':    PageText{
			title: 'برش‌ها'
			body:  '<h2>برش‌ها</h2>'
		}
		'moretypes/4':    PageText{
			title: 'نگاشت‌ها'
			body:  '<h2>نگاشت‌ها</h2>'
		}
		'moretypes/5':    PageText{
			title: 'رشته‌ها'
			body:  '<h2>رشته‌ها</h2>'
		}
		'moretypes/6':    PageText{
			title: 'متدها'
			body:  '<h2>متدها</h2>'
		}
		'moretypes/7':    PageText{
			title: 'تمرین: شمارش کلمات'
			body:  '<h2>تمرین: شمارش کلمات</h2>'
		}
		'moretypes/8':    PageText{
			title: 'آفرین!'
			body:  "<p>این درس را تمام کردید!</p>
<p>به <a href='/list'>فهرست ماژول‌ها</a> برگردید تا ببینید چه چیزی را بعداً یاد بگیرید، یا با <a href='/optionresult/1'>مدیریت فقدان و شکست</a> ادامه دهید.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2': PageText{
			title: 'Result و خطاها'
			body:  '<h2>Result و خطاها</h2>'
		}
		'optionresult/3': PageText{
			title: 'تمرین: Options'
			body:  '<h2>تمرین: Options</h2>'
		}
		'optionresult/4': PageText{
			title: 'آفرین!'
			body:  "<p>این درس را تمام کردید!</p>
<p>به <a href='/list'>فهرست ماژول‌ها</a> برگردید تا ببینید چه چیزی را بعداً یاد بگیرید، یا با <a href='/methods/1'>متدها و واسط‌ها</a> ادامه دهید.</p>"
		}
		'methods/1':      PageText{
			title: 'واسط‌ها'
			body:  '<h2>واسط‌ها</h2>'
		}
		'methods/2':      PageText{
			title: 'جاسازی'
			body:  '<h2>جاسازی</h2>'
		}
		'methods/3':      PageText{
			title: 'انواع قابل چاپ'
			body:  '<h2>انواع قابل چاپ</h2>'
		}
		'methods/4':      PageText{
			title: 'تمرین: اشکال'
			body:  '<h2>تمرین: اشکال</h2>'
		}
		'methods/5':      PageText{
			title: 'آفرین!'
			body:  "<p>این درس را تمام کردید!</p>
<p>به <a href='/list'>فهرست ماژول‌ها</a> برگردید تا ببینید چه چیزی را بعداً یاد بگیرید، یا با <a href='/generics/1'>ژنریک‌ها</a> ادامه دهید.</p>"
		}
		'generics/1':     PageText{
			title: 'توابع ژنریک'
			body:  "<h2>توابع ژنریک</h2>
<p>یک پارامتر نوع جایگزین یک نوع است، پس یک تعریف می‌تواند به یک خانواده کامل از آن‌ها خدمت کند. V آن را در براکت مربع می‌نویسد، و این تنها قطعه سینتکس است که ارزش حفظ کردن دارد:</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>براکت زاویه‌ای <em>سینتکس</em> اینجا نیست. نوشتن به شکل <code>fn max_of&lt;T&gt;(...)</code> یک خطای تجزیه است، نه املای متفاوت، و این اولین چیزی است که باید درست شود.</p>
<p>به‌ندرت آرگومان نوع را نام می‌برید. کامپایلر آن را از آرگومان‌ها استخراج می‌کند، و یک متغیر را به همان اندازه یک لیترال می‌خواند:</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>یک پارامتر نوع فقط جایی لازم است که کامپایلر نتواند آن را خودش استخراج کند. در موقعیت بازگشت اغلب همین‌طور است:</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>آن <code>?T</code> دقیقاً همان معنایی را دارد که در درس قبلی داشت: یک مقدار یا none، از هر نوعی که این نمونه‌سازی باشد.</p>
<p>یک callback به شکل یک نوع تابع نوشته می‌شود، پس <code>fn (T) R</code>. این باعث می‌شود نوع‌های ورودی و خروجی مستقل باشند، که همان چیزی است که یک تابع را به یک خط لوله تبدیل می‌کند:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>یک تعریف، و یک نمونه‌سازی جداگانه برای هر نوع آرگومانی که به آن داده می‌شود. نه boxing و نه erasure وجود دارد: <code>apply</code> با یک callback از نوع <code>int</code> و با یک callback از نوع <code>string</code> دو تابع متفاوت هستند، به همین دلیل باید نوع callback نوشته شود نه حدس زده شود.</p>"
		}
		'generics/2':     PageText{
			title: 'ساختارهای ژنریک'
			body:  '<h2>ساختارهای ژنریک</h2>
<p>یک ساختار پارامتر نوع را به همان شکل یک تابع می‌گیرد، و هر فیلدی که به آن اشاره می‌کند متعلق به نمونه‌سازی است:</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>پس <code>Stack[int]</code> یک <code>[]int</code> نگه می‌دارد و <code>Stack[string]</code> یک <code>[]string</code>، و این دو نوع متفاوت هستند. این ارزش تأمل دارد، زیرا یعنی نمی‌توانید یک پشته <code>int</code> و یک پشته <code>string</code> را در یک برش قرار دهید بدون اینکه نوعی را جایی پاک کنید.</p>
<p>متدها نیز پارامتر را حمل می‌کنند. <code>mut</code> در گیرنده چیزی است که به متد اجازه می‌دهد ساختار را تغییر دهد، و <code>&amp;</code> یعنی فقط آن را می‌خواند:</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p>آن <code>?T</code> نوع option پارامتری‌شده به همان شکل است، پس خارج کردن از یک پشته خالی <code>none</code> می‌دهد نه panic.</p>
<p>دو پارامتر همان ایده دوباره است، و آن‌ها مستقل از هم هستند:</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>اینجا مرزی است که مردم را می‌گیرد، و ارزش دقیق بودن دارد، زیرا پیام خطا به متدی که نگاه می‌کنید اشاره نمی‌کند. <code>A</code> و <code>B</code> هیچ رابطه‌ای ندارند، پس هیچ تبدیلی بین آن‌ها برای ارائه وجود ندارد، و یک متد نمی‌تواند مقداری را از یک فیلد به فیلد دیگر منتقل کند:</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>دلیل این یک ویژگی متدهای ژنریک است نه جفت‌ها، و ارزش فهمیدن دارد نه حفظ کردن. بدنه یک متد ژنریک در برابر <em>هر</em> نمونه‌سازی که استفاده می‌شود بررسی می‌شود، پس باید برای همه آن‌ها یک‌بار معتبر باشد. به همین دلیل متد روی <code>Pair[int, int]</code> که هر دو فیلد یک نوع را نگه می‌دارند درست است، و به‌محض اینکه <code>Pair[string, int]</code> از آن استفاده کند رد می‌شود. خطا نمونه‌سازی متخلف را نام می‌برد نه تعریف را:</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>پس قاعده‌ای که باید نگه داشت این است که یک متد ژنریک فقط می‌تواند چیزی را وعده دهد که برای هر نوعی که نمونه‌سازی می‌شود درست باشد. خواندن هر دو فیلد همش واجد شرایط است، که همان دلیلی است که <code>describe</code> برای هر نمونه‌سازی کار می‌کند:</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return "(&dollar;{p.first}, &dollar;{p.second})"
}</code></pre>'
		}
		'generics/3':     PageText{
			title: 'نگاشت‌های انواع ژنریک'
			body:  "<h2>نگاشت‌های انواع ژنریک</h2>
<p>یک نوع ژنریک می‌تواند نوع مقدار یک نگاشت باشد، و آرگومان نوع در نقطه استفاده مشخص می‌شود. نگاشت سپس یک نگاشت عادی از یک نوع مشخص است:</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p><code>Stack</code> خالص اینجا کافی نیست. نگاشت باید بداند مقدارهایش پشته <em>از</em> چه نوعی هستند، و حذف آرگومان یک خطا است نه چیزی که کامپایلر بعداً استخراج کند.</p>
<p>یک نتیجه ارزش دانستن: <code>map[string]Stack[int]</code> و <code>map[string]Stack[string]</code> نوع‌های متفاوت هستند، پس برنامه‌ای که به هر دو نیاز دارد باید آن را بگوید نه اجازه دهد یکی جای دیگری را بگیرد.</p>
<p>متدهای ژنریک روی مقدارهایی که نگاشت تحویل می‌دهد در دسترس هستند، که همان چیزی است که نگاشت را مفید می‌کند نه فقط قانونی:</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>به <code>_,</code> در حلقه نگاشت توجه کنید. نام کلید می‌تواند <code>for team, stack in teams</code> باشد؛ زیرخط خالص می‌گوید کلید لازم نیست. باید خالص باشد: زیرخط به همراه یک نام رد می‌شود، پس <code>_k</code> جواب نمی‌دهد.</p>
<p>نگاشت‌ها نوع مرجع هستند، که همان چیزی است که نوشتن دو مرحله‌ای را کار می‌کند: <code>teams['red'].push(10)</code> پشته را در نگاشت پیدا می‌کند و همان ساختار را تغییر می‌دهد، نه یک کپی از آن را و تغییر را از دست می‌دهد.</p>"
		}
		'generics/4':     PageText{
			title: 'چند پارامتر نوع'
			body:  "<h2>چند پارامتر نوع</h2>
<p>پارامترهای نوع روی هم می‌نشینند. دو تا در یک تابع معمولاً نوع ورودی و نوع خروجی هستند، که همان چیزی است که یک تابع ژنریک را به یک نگاشت تبدیل می‌کند:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>یک پارامتر نوع لازم نیست در بدنه ظاهر شود. این به نظر می‌رسد راهی برای نوشتن یک تابع بی‌فایده است، و اغلب دقیقاً درست است: پارامتر امضا را محدود می‌کند بدون اینکه در محل فراخوانی هزینه‌ای داشته باشد.</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _, v in m {
		return v
	}
	return none
}</code></pre>
<p>هیچ چیز در بدنه به <code>K</code> اشاره نمی‌کند، پس این همان تابع برای یک نگاشت کلیددار با رشته و برای یکی با عدد است. آن <code>?V</code> عمدی است: یک نگاشت خالی مقدار اول ندارد، پس تابع none برمی‌گرداند نه اینکه یکی از خودش بسازد.</p>
<p>شکلی که بیشتر ظاهر می‌شود یک تابع ژنریک روی یک نگاشت است، با یک callback که تصمیم می‌گیرد با هر مقدار چه کند:</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p>هر دو <code>K</code> و <code>V</code> از نگاشت استخراج می‌شوند، و <code>R</code> روی <code>int</code> ثابت است زیرا همان چیزی است که callback برمی‌گرداند. جایی که استخراج چیزی برای کار کردن ندارد، آرگومان‌ها را صریح نام ببرید: <code>first_map[string, int](m)</code>.</p>
<p>یک چیز که استخراج انجام نمی‌دهد نجات یک آرگومان ناسازگار است. اگر <code>Counter[V]</code> را جایی بدهید که <code>map[K]Counter[V]</code> خواسته می‌شود، خطا یک <code>K</code> قابل استخراج نیست را نام می‌برد نه مشکل واقعی، که یک برخورد اول گیج‌کننده است. نوع آرگومان را قبل از جستجوی باگ ژنریک بررسی کنید.</p>"
		}
		'generics/5':     PageText{
			title: 'تمرین: ژنریک'
			body:  '<h2>تمرین: ژنریک</h2>
<p>چهار چیز برای نوشتن، و بین آن‌ها هر شکلی از این درس را استفاده می‌کنند.</p>
<p><code>index_of[T]</code> موقعیت یک مقدار در یک برش را برمی‌گرداند، یا -۱. روی هر نوعی که <code>==</code> را پشتیبانی می‌کند کار می‌کند.</p>
<p><code>count_matching[T]</code> تعداد مواردی که یک شرط را برآورده می‌کنند را می‌شمارد. شرط یک callback است، پس نوع آن <code>fn (T) bool</code> نوشته می‌شود.</p>
<p>سپس <code>Counter[K]</code>، یک ساختار ژنریک که تعداد را برای هر کلید نگه می‌دارد. به آن <code>add</code> و <code>get</code> بدهید، و توجه کنید که <code>K</code> اینجا داخل یک نوع ژنریک دیگر استفاده می‌شود: یک نگاشت که کلیدش پارامتر نوع است.</p>
<p>در آخر، <code>grand_total[K, V]</code>، که مجموع یک نگاشت از شمارنده‌ها را وزن‌دار با callback کلید حساب می‌کند. دو پارامتر نوع، و یک ساختار ژنریک به عنوان نوع مقدار نگاشت.</p>
<p>وقتی تلاش کردید، یا گیر کردید، <b>پاسخ</b> را بزنید.</p>'
		}
		'generics/6':     PageText{
			title: 'آفرین!'
			body:  "<p>شما این درس را تمام کردید!</p>
<p>می‌توانید به <a href='/list'>فهرست ماژول‌ها</a> برگردید تا ببینید چه چیزی را بعداً یاد بگیرید، یا با <a href='/concurrency/1'>همزمانی</a> ادامه دهید.</p>"
		}
		'concurrency/1':  PageText{
			title: 'ایجاد نخ'
			body:  '<h2>ایجاد نخ</h2>
<p><code>spawn</code> یک نخ را شروع می‌کند و بلافاصله برمی‌گرداند. یک دسته تحویل می‌دهد، و دسته همان چیزی است که بعداً برای نخ منتظر می‌مانید:</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> خودش هیچ چیزی را منتظر نمی‌ماند. برنامه‌ای که در حالی که نخی هنوز کار می‌کند تمام می‌شود آن نخ را نیمه‌کاره رها می‌کند، پس قاعده این است که هر spawn در نهایت منتظر بماند.</p>
<p>برای یک مجموعه ثابت از وظایف، دسته‌ها را در یک برش جمع کنید. نوع عنصر <code>thread</code> است، و <code>wait()</code> روی برش همه آن‌ها را به هم می‌رساند:</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>وقتی کارگرها چیزی برمی‌گردانند، برش <code>[]thread int</code> است و <code>wait()</code> نتایج را به ترتیب تحویل می‌دهد:</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>ترتیب ارزش دقیق بودن دارد. نتایج به ترتیبی که دسته‌ها اضافه شده‌اند برمی‌گرند، نه ترتیبی که نخ‌ها تمام شده‌اند، پس این راهی برای جمع‌آوری پاسخ‌هاست نه تحمیل ترتیبی بر کار. اینکه کدام نخ اول چاپ می‌کند چیزی نیست که برنامه باید به آن وابسته باشد، و خروجی درهم‌ریخته در مثال نسخه صادق آن است.</p>'
		}
		'concurrency/2':  PageText{
			title: 'کانال‌ها'
			body:  "<h2>کانال‌ها</h2>
<p>یک کانال مقادیر یک نوع را از یک نخ به نخ دیگر منتقل می‌کند. آن را با نوع عنصر و ظرفیت بسازید، و با همان فلش بفرستید و دریافت کنید:</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>هر دو جهت <code>&lt;-</code> هستند، زیرا هر دو از طرف دیگر دریافت می‌کنند. <code>ch.recv()</code> یا <code>ch.pop()</code> وجود ندارد: کامپایلر هر دو را به عنوان تابع ناشناخته رد می‌کند. اگر به یک متد اینجا عادت دارید، این چیزی است که بازیابی می‌کنید.</p>
<p><code>chan int{}</code> بدون ظرفیت <em>بدون‌بافر</em> است، که یعنی کانال هیچ چیزی را نگه نمی‌دارد. یک ارسال نمی‌تواند تمام شود مگر اینکه یک گیرنده آنجا ایستاده باشد، و یک دریافت نمی‌تواند تمام شود مگر اینکه فرستنده چیزی تولید کرده باشد. هر مقدار یک دست‌دهی بین دو نخ است:</p>
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
<p>خروجی مثال را بخوانید و دست‌دهی قابل مشاهده است: ارسال‌ها و دریافت‌ها متناوب می‌شوند، و به ترتیب ثابتی که باید به آن تکیه کنید نیستند. این نقطه کانال بدون‌بافر است، نه نقص در آن.</p>
<p>یک کانال دقیقاً یک نوع حمل می‌کند، پس منتظر ماندن بر دو نوع پیام متفاوت یعنی دو کانال. <code>select</code>، بعداً، راهی است که بر بیش از یکی در یک زمان منتظر بمانید.</p>"
		}
		'concurrency/3':  PageText{
			title: 'کانال‌های بافردار'
			body:  '<h2>کانال‌های بافردار</h2>
<p>یک ظرفیت به کانال جا می‌دهد، پس فرستنده می‌تواند جلو بیفتد به جای اینکه روی هر مقدار مسدود شود:</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>این تفاوت قابل اندازه‌گیری است. با بافر، همه ارسال‌ها تمام می‌شوند و <code>len()</code> تعداد مقادیر منتظر را گزارش می‌دهد. بدون آن، <code>len()</code> هر قدر هم منتظر بمانید روی صفر می‌ماند، زیرا جایی برای گذاشتن آن‌ها نیست:</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>بافر را وقتی انتخاب کنید که فرستنده نباید به خاطر مصرف‌کننده کند متوقف شود. ظرفیت هنگام ساخت کانال ثابت می‌شود، و یک کانال بافردار و یک کانال بدون‌بافر از یک نوع عنصر نوع‌های متفاوت هستند.</p>
<p>اینجا یک تله است که نیم دقیقه ارزش به خاطر آوردن دارد. فیلدی که اندازه را تنظیم می‌کند <code>cap:</code> است، و نوشتن <code>len:</code> به جای آن رد می‌شود نه بی‌صدا نادیده گرفته:</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>پیام فیلدی را که منظورتان بود نام می‌برد، که بهترین حالت ممکن است. تله دیگر درباره املای نیست. بافر کردن فقط تا ظرفیت کمک می‌کند: فرستنده‌ای که چیزهای بیشتری برای ارسال دارد از ظرفیت روی اولین مقداری که جا نمی‌شود مسدود می‌شود. پس با چهار شش و شش کار، و بدون مصرف‌کننده‌ای که شروع شده باشد، پنجمین ارسال منتظر مصرف‌کننده‌ای می‌ماند که در حال اجرا نیست. یا کل فهرست را بافر کنید یا مصرف‌کننده‌ها را اول شروع کنید.</p>'
		}
		'concurrency/4':  PageText{
			title: 'دریافت تا بسته شدن'
			body:  '<h2>دریافت تا بسته شدن</h2>
<p><strong>در V هیچ <code>for x in ch</code> وجود ندارد.</strong> یک کانال یک مجموعه نیست، پس حلقه for چیزی برای ایندکس کردن ندارد، و کامپایلر می‌گوید:</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>اگر از زبانی می‌آیید که در آن می‌توان یک کانال را range کرد، این چیزی است که اول اشتباه می‌کنید. با <code>&lt;-ch</code> دریافت کنید، و برای خواندن یک کانال تا انتها، تا وقتی که دادن متوقف شود دریافت کنید:</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p><code>or</code> مقداری را که حلقه را تمام می‌کند تأمین می‌کند، و این بخشی است که در جهت دیگر اشتباه کردن آسان است: <strong><code>or</code> فقط وقتی کانال بسته و خالی است فعال می‌شود.</strong> روی یک کانال باز که هیچ چیزی در آن نیست، <code>&lt;-ch or { -1 }</code> همچنان مسدود می‌شود، منتظر یک فرستنده. این یک poll بدون‌مسدود نیست، هر قدر هم که به نظر برسد.</p>
<p>یک جزئیات درباره ارسال‌ها که اگر کسی به شما نگوید بعدازظهر شما را هزینه می‌کند. عبارت ارسال از فلش متوقف می‌شود، پس یک مقدار محاسبه‌شده در سمت راست به پرانتز نیاز دارد:</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>بدون آن‌ها کامپایلر تلاش می‌کند که void را که <code>ch &lt;- i</code> تولید کرده ضرب کند، و به شکلی که به فلش اشاره نمی‌کند این را می‌گوید.</p>
<p>وقتی فرستنده به شما تعداد را گفت، حلقه لازم نیست:</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>آن شکل ساده‌تر لبه تیزی دارد. یک <code>&lt;-ch</code> خالص روی یک کانال بسته و خالی مسدود نمی‌شود و panic نمی‌کند: <em>مقدار صفر</em> را برای نوع عنصر برمی‌گرداند، هر بار. یک مقدار بیشتر از حد بخواهید و یک <code>0</code> خاموش، یک رشته خالی یا یک ساختار صفر به جای خطا می‌گیرید:</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>پس <code>or</code> را ترجیح دهید هر وقت تعداد مطمئن نیست، و به <code>try_pop</code> برسید وقتی می‌خواهید بدون منتظر ماندن نگاه کنید:</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>'
		}
		'concurrency/5':  PageText{
			title: 'بستن'
			body:  "<h2>بستن</h2>
<p>یک کانال را وقتی فرستنده از آن کارش تمام شد ببندید، و از فرستنده ببندید. فرستنده کانال را به همان شکلی که تصمیم توقف را مالک است:</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>یک جزئیات که مردم را می‌گیرد: <code>close</code> به تنهایی راهی برای بستن یک کانال نیست. به شکل یک فراخوانی خالص نوشته شده، این تابع داخلی است که یک توصیف‌گر فایل را می‌بندد، و روی یک کانال با پیام گیج‌کننده شکست می‌خورد:</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>بستن چیزهایی که هنوز در بافر هستند را دور نمی‌ریزد. مقادیر در کانال اول به خواننده تحویل داده می‌شوند، به ترتیب، و فقط وقتی که خالی شد یک دریافت چیزی پیدا نمی‌کند. این ترتیب همان چیزی است که close را به سیگنالی که قرار است باشد تبدیل می‌کند.</p>
<p>کاری که close انجام نمی‌دهد این است که یک ارسال را قانونی کند. ارسال روی یک کانال بسته panic زمان اجرا است، و بستن دوباره هم همین‌طور، پس قاعده یک بستن برای هر کانال از یک جا است که مالک آن است.</p>
<p>و close یک انتظار نیست. دریافت از یک کانال باز و خالی همچنان مسدود می‌شود، چه کسی هرگز آن را ببندد یا نه.</p>"
		}
		'concurrency/6':  PageText{
			title: 'انتخاب'
			body:  "<h2>انتخاب</h2>
<p><code>select</code> روی چند کانال منتظر می‌ماند و بدنه هر کدام که آماده است را اجرا می‌کند. این راهی است که اولین پاسخ را بگیرید نه یک ترتیب ثابت:</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>یک شاخه یک دریافت یا یک ارسال است، پس هر دو جهت می‌توانند رقابت کنند:</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>دو محدودیت ارزش دانستن قبل از نوشتن یکی، هر دو در برابر کامپایلر اندازه‌گیری شده نه مستند شده.</p>
<p><strong>دو شکل را در selectهای جدا نگه دارید.</strong> یک select که هم یک شاخه send و هم یک شاخه receive دارد کامپایلر را کاملاً crash می‌کند به جای گزارش خطا، پس یک send را با یک timeout یا با یک send دیگر جفت کنید.</p>
<p><strong>یک شاخه باید کانالی را نام ببرد که از قبل وجود دارد.</strong> نوشتن کانال در خط رد می‌شود:</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>و شاخه‌ها به جای بازگرداندن اختصاص می‌دهند، پس متغیری که می‌نویسند باید <code>mut</code> باشد. یک مدت در موقعیت یک شاخه یک timeout است، و فقط یکی برای هر select. این راهی است که یک انتظار بدون مرز متوقف می‌شود:</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> شاخه‌ای برای زمانی است که هیچ چیز آماده نیست، و منتظر نمی‌ماند. این شکل بدون‌مسدود است:</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>به عنوان یک عبارت، یک select به یک <strong>bool</strong> ارزیابی می‌شود: true وقتی یک شاخه کانال اجرا شده، false وقتی <code>else</code> اجرا شده. مقدار شاخه را در شاخه بخوانید و bool را جدا تست کنید.</p>
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
<p>یک ناهمگونی برای آماده بودن. وقتی یک کانال بسته شد، دریافت از آن همیشه آماده است، پس یک کانال بسته هر بار select را برنده می‌شود. در یک حلقه روی چند کانال، آن‌هایی که برایتان مهم‌اند را خالی کنید و بسته شدن را خودتان بررسی کنید به جای تکیه بر select برای عبور از آن.</p>"
		}
		'concurrency/7':  PageText{
			title: 'وضعیت مشترک'
			body:  '<h2>وضعیت مشترک</h2>
<p>کانال‌ها مقادیر را منتقل می‌کنند. وقتی نخ‌ها باید <em>همان</em> مقدار را تغییر دهند، این کار قفل است.</p>
<p>بخشی که واضح نیست این است که وضعیت چگونه مشترک می‌شود. یک ساختار که به یک نخ به ارزش داده می‌شود یک کپی است، و هر نخ کپی خودش را می‌گیرد. کلمه <code>shared</code> روی پارامتر چیزی است که آن را به یک چیز تبدیل می‌کند:</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>به <code>shared t</code> در لیست پارامترها و <code>spawn add(shared total, i)</code> در محل فراخوانی توجه کنید. هر دو لازم هستند. بدون کلمه کلیدی بدهید و نخ یک کپی می‌گیرد، پس شمارنده هرگز حرکت نمی‌کند.</p>
<p><code>lock</code> یک بلوک است، نه یک فراخوانی، و آکولاد بسته آن را آزاد می‌کند. هیچ عبارت <code>unlock</code> برای جفت کردن آن وجود ندارد، و نوشتن یکی یک خطای سینتکس است. آن را تا حد امکان کوتاه نگه دارید: نه در یک spawn، نه در یک ارسال کانال، و نه دور کار واقعی. قفلی که در چیزی که می‌تواند مسدود شود نگه داشته شود راهی است که برنامه deadlock می‌کند.</p>
<p><code>rlock</code> نسخه خواندن است، و برای یک ساختار است که بیشتر خوانده می‌شود نوشته:</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p>یک متغیر <code>shared</code> نیز باید در نقطه استفاده قفل شود، پس کامپایلر اجازه نمی‌دهد قفل به طور تصادفی فراموش شود.</p>
<p>یک چیز است که باید درباره آن مراقب بود، و دلیلش این است که مثال یک مقدار را قبل از منتظر ماندن بر نخ‌هایش می‌خواند. spawn منتظر نمی‌ماند، پس خواندن وضعیت مشترک بلافاصله بعد از spawn یک race است: مقداری که می‌بینید به این بستگی دارد که نخ‌ها چقدر پیش رفته‌اند. قبل از خواندن منتظر نویسندگان بمانید، یا بپذیرید که عدد موقتی است.</p>'
		}
		'concurrency/8':  PageText{
			title: 'گروه‌های انتظار'
			body:  '<h2>گروه‌های انتظار</h2>
<p>یک گروه انتظار کار در حال پیشرفت را می‌شمارد. <code>add</code> قبل از spawn، <code>done</code> داخل آن، و <code>wait</code> وقتی همه را شروع کرده‌اید:</p>
<pre><code>fn worker(wg &amp;sync.WaitGroup, ch chan int, n int) {
	ch &lt;- (n * n)
	wg.done()
}

mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.add(1)
	spawn worker(wg, ch, i)
}
wg.wait()</code></pre>
<p>گروه را به عنوان <code>&amp;sync.WaitGroup</code> بگیرید نه <code>mut &amp;sync.WaitGroup</code>. ارجاع <code>mut</code> کامپایل می‌شود و بعد داخل شمارنده اتمی در زمان اجرا crash می‌کند، پس ارجاع ساده شکلی است که باید استفاده شود.</p>
<p><code>wg.go</code> add و شروع نخ را در یک فراخوانی باندل می‌کند، که مرحله‌ای را که این دو از هم فاصله می‌گیرند حذف می‌کند:</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>این یک closure می‌گیرد نه یک فراخوانی، و یک closure در V باید نام آنچه را که می‌خواند بگوید. لیست <code>fn [ch, i] ()</code> همان تعریف است، و حذف یک متغیر یک خطای کامپایل است که متغیر را نام می‌برد نه چیزی درباره همزمانی.</p>
<p>سه قاعده، و آن‌ها بیشتر چیزی هستند که اشتباه می‌رود. هر <code>add</code> به یک <code>done</code> متناظر نیاز دارد، و یک <code>done</code> بدون <code>add</code> panic می‌کند. هر spawn باید قبل از <code>wait</code> اتفاق بیفتد، زیرا این همه چیزی است که wait می‌بیند. و نخی که panic می‌کند کل فرآیند را با خود می‌برد، پس یک تابع spawn‌شده اگر می‌تواند نیمه‌کاره شکست بخورد به defer خودش نیاز دارد.</p>'
		}
		'concurrency/9':  PageText{
			title: 'تمرین: استخر کارگر'
			body:  '<h2>تمرین: استخر کارگر</h2>
<p>یک استخر از کارگران بسازید و به آن کار بدهید.</p>
<p><code>worker</code> یک کار را از یک کانال می‌گیرد، آن را دو برابر می‌کند، و نتیجه را به کانال دیگری می‌فرستد. یک گروه انتظار به آن داده می‌شود تا استخر بداند کی تمام شده است.</p>
<p><code>run_all</code> یک برش از کارها و تعداد کارگر را می‌گیرد، و نتایج را به ترتیبی که رسیده‌اند برمی‌گرداند.</p>
<p>ترتیب عملیات کل تمرین است، و چهار چیز باید هم‌زمان درست باشند:</p>
<ul>
<li>کانال کار <em>قبل از</em> شروع کارگران بسته شود، وگرنه کارگری می‌تواند منتظر بسته‌شده‌ای بماند که هرگز نمی‌آید.</li>
<li>هر <code>add</code> قبل از <code>wait</code> اتفاق بیفتد، و هر <code>done</code> داخل کارگر.</li>
<li>هر دو کانال بافردار باشند، پس کارگر هنگام تحویل مقدار مسدود نمی‌شود.</li>
<li>نتایج با <code>&lt;-results or { break }</code> جمع‌آوری شوند، زیرا هیچ <code>for</code> روی یک کانال وجود ندارد.</li>
</ul>
<p>دو تا از این‌ها deadlockی هستند که این تمرین معمولاً آن را نشان می‌دهد: یک کانال کار با فضای کمتر از لیست کارها، یا نتایجی که قبل از <code>wait</code> خوانده می‌شوند.</p>
<p>وقتی تلاش کردید، یا گیر کردید، <b>پاسخ</b> را بزنید.</p>'
		}
		'concurrency/10': PageText{
			title: 'آفرین!'
			body:  "<p>شما این درس را تمام کردید، و با آن کل تور را.</p>
<p>همه چیز بالا در زبان زندگی می‌کند نه در یک کتابخانه، که ارزش به خاطر آوردن دارد وقتی پیش می‌روید: یک نخ، یک کانال و یک قفل تعریف‌های عادی V هستند که می‌توانید در همان فایل کدی که به آن خدمت می‌کنند بخوانید.</p>
<p>می‌توانید به <a href='/list'>فهرست ماژول‌ها</a> برگردید تا هر چیزی را دوباره بخوانید، یا از <a href='/welcome/1'>شروع کار</a> دوباره شروع کنید.</p>"
		}
	}
	ui:      {
		'site_title':       'تور V'
		'toc':              'فهرست مطالب'
		'toggle_theme':     'تغییر پوسته'
		'language':         'زبان'
		'run':              'اجرا'
		'format':           'قالب‌بندی'
		'reset':            'بازنشانی'
		'solution':         'پاسخ'
		'output':           'خروجی'
		'help':             'میان‌برهای صفحه‌کلید'
		'help_close':       'بستن'
		'run_program':      'اجرای برنامه'
		'next_page':        'صفحهٔ بعد'
		'prev_page':        'صفحهٔ قبل'
		'toggle_help':      'باز یا بستن همین راهنما'
		'move_panes':       'جابه‌جایی میان ستون‌ها'
		'previous':         'قبلی'
		'next':             'بعدی'
		'resize_panes':     'تغییر اندازهٔ ستون‌ها'
		'page_of':          '\${number} / \${total}'
		'no_program':       'صندوق اجرا برنامهٔ آزمایشی را در خود نداشت.'
		'compile_failed':   'برنامه کامپایل نشد.'
		'could_not_reach':  'ارتباط با سرور برقرار نشد: '
		'could_not_format': 'قالب‌بندی این برنامه ممکن نشد.'
		'sandbox_busy':     'صندوق مشغول است. لطفاً دوباره تلاش کنید.'
		'too_large':        'این درخواست بیش از حد بزرگ است.'
		'no_compiler':      'هیچ کامپایلری در صندوق در دسترس نیست.'
		'link_counterpart': 'این صفحه را به \${language} بخوانید'
		'lang_other':       'زبان‌های دیگر'
	}
}
