module locale

// العربية (Arabic) translation.

pub const ar = Text{
	modules: {
		'mechanics':    'استخدام الجولة'
		'basics':       'الأنواع الأساسية'
		'controlflow':  'تدفق التحكم'
		'moretypes':    'المزيد من الأنواع'
		'optionresult': 'Option و Result'
		'methods':      'الدوال والواجهات'
		'generics':     'التعميمات'
		'concurrency':  'التزامن'
	}
	lessons: {
		'welcome':      'البداية'
		'basics':       'الأنواع الأساسية'
		'controlflow':  'تدفق التحكم'
		'moretypes':    'المزيد من الأنواع'
		'optionresult': 'Option و Result'
		'methods':      'الدوال والواجهات'
		'generics':     'التعميمات'
		'concurrency':  'التزامن'
	}
	pages:   {
		'welcome/1':       PageText{
			title: 'مرحبا، العالم'
			body:  "<p>مرحبا بك في جولة عبر <a href='https://vlang.io'>لغة البرمجة V</a>.</p>
<p>الجولة مقسمة إلى وحدات. يمكنك الوصول إليها من <a href='/list'>جدول المحتويات</a> أو من زر القائمة في الزاوية العلوية اليمنى.</p>
<p>طوال الجولة ستجد شرائح وتمارين. تنقل باستخدام روابط <b>السابق</b> و <b>التالي</b> أسفل النص، أو بمفاتيح <code>PageUp</code> و <code>PageDown</code>.</p>
<p>الجولة تفاعلية. اضغط <b>تشغيل</b> (أو <code>Shift</code>+<code>Enter</code>) لتجميع وتشغيل البرنامج. تظهر النتيجة أسفل الكود.</p>
<p>هذه البرامج هي نقاط انطلاق لتجاربك الخاصة. حرر البرنامج وشغله مرة أخرى.</p>"
		}
		'welcome/2':       PageText{
			title: 'استخدام هذه الجولة'
			body:  '<p>كل صفحة تحتوي على عمود نص على اليسار وعمود كود على اليمين. بينهما مقبض تغيير الحجم: اسحبه لإعطاء الكود مساحة أكبر.</p>'
		}
		'welcome/3':       PageText{
			title: 'V دون اتصال (اختياري)'
			body:  "<p>لا تحتاج إلى تثبيت V محليا لاستخدام هذه الجولة، لكن ينصح بذلك.</p>"
		}
		'welcome/4':       PageText{
			title: 'الصندوق الرملي'
			body:  '<p>برامجك تعمل في صندوق رملي على الخادم.</p>'
		}
		'welcome/5':       PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت أول وحدة في الجولة!</p>
<p>عد إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو تابع مباشرة مع <a href='/basics/1'>أساسيات اللغة</a>.</p>"
		}
		'basics/1':        PageText{
			title: 'الوحدات'
			body:  '<h2>الوحدات</h2>'
		}
		'basics/2':        PageText{
			title: 'الاستيراد'
			body:  '<h2>الاستيراد</h2>'
		}
		'basics/3':        PageText{
			title: 'المتغيرات'
			body:  '<h2>المتغيرات</h2>'
		}
		'basics/4':        PageText{
			title: 'المتغيرات القابلة للتغيير'
			body:  '<h2>المتغيرات القابلة للتغيير</h2>'
		}
		'basics/5':        PageText{
			title: 'التصريحات المختصرة'
			body:  '<h2>التصريحات المختصرة</h2>'
		}
		'basics/6':        PageText{
			title: 'الدوال'
			body:  '<h2>الدوال</h2>'
		}
		'basics/7':        PageText{
			title: 'نتائج متعددة'
			body:  '<h2>نتائج متعددة</h2>'
		}
		'basics/8':        PageText{
			title: 'الأنواع الأساسية'
			body:  '<h2>الأنواع الأساسية</h2>'
		}
		'basics/9':        PageText{
			title: 'القيم الصفرية'
			body:  '<h2>القيم الصفرية</h2>'
		}
		'basics/10':       PageText{
			title: 'الثوابت'
			body:  '<h2>الثوابت</h2>'
		}
		'basics/11':       PageText{
			title: 'تحويلات النوع'
			body:  '<h2>تحويلات النوع</h2>'
		}
		'basics/12':       PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/controlflow/1'>تدفق التحكم</a>.</p>"
		}
		'basics/13':       PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/controlflow/1'>تدفق التحكم</a>.</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For هو "while" في V'
			body:  '<h2>For هو "while" في V</h2>'
		}
		'controlflow/3':   PageText{
			title: 'For متابعة'
			body:  '<h2>For متابعة</h2>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':   PageText{
			title: 'If مع قيمة مفككة'
			body:  '<h2>If مع قيمة مفككة</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match وأنواع الجمع'
			body:  '<h2>Match وأنواع الجمع</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: 'تمرين: الحلقات والدوال'
			body:  '<h2>تمرين: الحلقات والدوال</h2>'
		}
		'controlflow/10':  PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>عد إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو تابع مع <a href='/moretypes/1'>المزيد من الأنواع</a>.</p>"
		}
		'moretypes/1':     PageText{
			title: 'البنى'
			body:  '<h2>البنى</h2>'
		}
		'moretypes/2':     PageText{
			title: 'المصفوفات'
			body:  '<h2>المصفوفات</h2>'
		}
		'moretypes/3':     PageText{
			title: 'المقاطع'
			body:  '<h2>المقاطع</h2>'
		}
		'moretypes/4':     PageText{
			title: 'الخرائط'
			body:  '<h2>الخرائط</h2>'
		}
		'moretypes/5':     PageText{
			title: 'النصوص'
			body:  '<h2>النصوص</h2>'
		}
		'moretypes/6':     PageText{
			title: 'الدوال'
			body:  '<h2>الدوال</h2>'
		}
		'moretypes/7':     PageText{
			title: 'تمرين: عد الكلمات'
			body:  '<h2>تمرين: عد الكلمات</h2>'
		}
		'moretypes/8':     PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/optionresult/1'>معالجة الغياب والفشل</a>.</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result والأخطاء'
			body:  '<h2>Result والأخطاء</h2>'
		}
		'optionresult/3':  PageText{
			title: 'تمرين: Options'
			body:  '<h2>تمرين: Options</h2>'
		}
		'optionresult/4':  PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/methods/1'>الدوال والواجهات</a>.</p>"
		}
		'methods/1':       PageText{
			title: 'الواجهات'
			body:  '<h2>الواجهات</h2>'
		}
		'methods/2':       PageText{
			title: 'التضمين'
			body:  '<h2>التضمين</h2>'
		}
		'methods/3':       PageText{
			title: 'الأنواع القابلة للطباعة'
			body:  '<h2>الأنواع القابلة للطباعة</h2>'
		}
		'methods/4':       PageText{
			title: 'تمرين: الأشكال'
			body:  '<h2>تمرين: الأشكال</h2>'
		}
		'methods/5':       PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/generics/1'>التعميمات</a>.</p>"
		}
		'generics/1':      PageText{
			title: 'الدوال العامة'
			body:  '<h2>الدوال العامة</h2>'
		}
		'generics/2':      PageText{
			title: 'البنى العامة'
			body:  '<h2>البنى العامة</h2>'
		}
		'generics/3':      PageText{
			title: 'خرائط الأنواع العامة'
			body:  '<h2>خرائط الأنواع العامة</h2>'
		}
		'generics/4':      PageText{
			title: 'معاملات نوع متعددة'
			body:  '<h2>معاملات نوع متعددة</h2>'
		}
		'generics/5':      PageText{
			title: 'تمرين: التعميمات'
			body:  '<h2>تمرين: التعميمات</h2>'
		}
		'generics/6':      PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/concurrency/1'>التزامن</a>.</p>"
		}
		'concurrency/1':   PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':   PageText{
			title: 'القنوات'
			body:  '<h2>القنوات</h2>'
		}
		'concurrency/3':   PageText{
			title: 'القنوات المخزنة مؤقتا'
			body:  '<h2>القنوات المخزنة مؤقتا</h2>'
		}
		'concurrency/4':   PageText{
			title: 'الاستقبال حتى الإغلاق'
			body:  '<h2>الاستقبال حتى الإغلاق</h2>'
		}
		'concurrency/5':   PageText{
			title: 'الإغلاق'
			body:  '<h2>الإغلاق</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: 'الحالة المشتركة'
			body:  '<h2>الحالة المشتركة</h2>'
		}
		'concurrency/8':   PageText{
			title: 'مجموعات الانتظار'
			body:  '<h2>مجموعات الانتظار</h2>'
		}
		'concurrency/9':   PageText{
			title: 'تمرين: مجموعة عمال'
			body:  '<h2>تمرين: مجموعة عمال</h2>'
		}
		'concurrency/10':  PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس، ومعه الجولة بأكملها!</p>
<p>عد إلى <a href='/list'>قائمة الوحدات</a> لإعادة قراءة أي شيء، أو ابدأ من جديد في <a href='/welcome/1'>البداية</a>.</p>"
		}
	}
	ui:      {
		'site_title':       'جولة في V'
		'toc':              'جدول المحتويات'
		'toggle_theme':     'تبديل المظهر'
		'language':         'اللغة'
		'run':              'تشغيل'
		'format':           'تنسيق'
		'reset':            'إعادة تعيين'
		'solution':         'الحل'
		'output':           'الإخراج'
		'help':             'اختصارات لوحة المفاتيح'
		'help_close':       'إغلاق'
		'run_program':      'تشغيل البرنامج'
		'next_page':        'الصفحة التالية'
		'prev_page':        'الصفحة السابقة'
		'toggle_help':      'فتح أو إغلاق هذه المساعدة'
		'move_panes':       'التنقل بين الألواح'
		'previous':         'السابق'
		'next':             'التالي'
		'resize_panes':     'تغيير حجم الألواح'
		'page_of':          '\${number} / \${total}'
		'no_program':       'لم يحتوي الصندوق الرملي على برنامج اختبار.'
		'compile_failed':   'لم يتم تجميع البرنامج.'
		'could_not_reach':  'تعذر الوصول إلى الخادم: '
		'could_not_format': 'تعذر تنسيق هذا البرنامج.'
		'sandbox_busy':     'الصندوق الرملي مشغول. حاول مرة أخرى.'
		'too_large':        'هذا الطلب كبير جدا.'
		'no_compiler':      'لا يوجد مترجم متاح في الصندوق الرملي.'
		'link_counterpart': 'قراءة هذه الصفحة بـ \${language}'
		'lang_other':       'لغات أخرى'
	}
}
