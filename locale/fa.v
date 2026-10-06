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
		'welcome/1': PageText{
			title: 'سلام، دنیا'
			body:  "<p>به توری از <a href='https://vlang.io'>زبان برنامه‌نویسی V</a> خوش آمدید.</p>
<p>این تور به چند ماژول تقسیم شده است. می‌توانید آن‌ها را از <a href='/list'>فهرست مطالب</a> یا از دکمهٔ منو در گوشهٔ بالا-راست صفحه باز کنید.</p>
<p>در طول تور با اسلاید و تمرین روبه‌رو می‌شوید. با پیوندهای <b>قبلی</b> و <b>بعدی</b> در پایین متن، یا با کلیدهای <code>PageUp</code> و <code>PageDown</code> میان آن‌ها جابه‌جا شوید.</p>
<p>این تور تعاملی است. برای کامپایل و اجرای برنامه دکمهٔ <b>اجرا</b> (یا <code>Shift</code>+<code>Enter</code>) را بزنید. نتیجه زیر کد ظاهر می‌شود.</p>
<p>این برنامه‌ها نقطهٔ شروعی برای آزمایش خودتان هستند. برنامه را ویرایش کنید و دوباره اجرا کنید.</p>
<p>تور دکمهٔ <b>قالب‌بندی</b> ندارد. <code>v fmt</code> به ابزار کمکی خودش نیاز دارد و آن ابزار داخل صندوقی که تور کد ناشناس را در آن اجرا می‌کند ساخته نمی‌شود.</p>"
		}
		'welcome/2': PageText{
			title: 'کار با این تور'
			body:  '<p>هر صفحه یک ستون متن و یک ستون کد دارد. بین آن‌ها یک دستگیرهٔ کشیدنی است: آن را بکشید تا ستون کد پهن‌تر شود.</p>
<p>هر صفحه نام فایل برنامهٔ خود را در بالای ویرایشگر نشان می‌دهد. در بیشتر صفحه‌ها یک فایل هست، و آن یکی همیشه <code>main.v</code> است.</p>
<p>متن ویرایشگر برای شما نگه داشته می‌شود، پس اگر صفحه را ببندید و برگردید، کارتان هست.</p>'
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
