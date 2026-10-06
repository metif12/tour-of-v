module locale

// العربية (Arabic) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const ar = Text{
	modules: {
		'mechanics':    'استخدام الجولة'
		'basics':       'الأنواع الأساسية'
		'controlflow':  'تدفق التحكم'
		'moretypes':    'المزيد من الأنواع'
		'optionresult': 'Option و Result'
		'methods':      'الدوال والواجهات'
		'generics':     'الأنواع العامة'
		'concurrency':  'التزامن'
	}
	lessons: {
		'welcome':      'البدء'
		'basics':       'الأنواع الأساسية'
		'controlflow':  'تدفق التحكم'
		'moretypes':    'المزيد من الأنواع'
		'optionresult': 'Option و Result'
		'methods':      'الدوال والواجهات'
		'generics':     'الأنواع العامة'
		'concurrency':  'التزامن'
	}
	pages:   {}
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
		'could_not_reach':  'تعذر الاتصال بالخادم: '
		'could_not_format': 'تعذر تنسيق هذا البرنامج.'
		'sandbox_busy':     'الصندوق الرملي مشغول. يرجى المحاولة مرة أخرى.'
		'too_large':        'هذا الطلب كبير جدًا.'
		'no_compiler':      'لا يوجد مترجم متاح في الصندوق الرملي.'
		'link_counterpart': 'اقرأ هذه الصفحة باللغة \${language}'
		'lang_other':       'لغات أخرى'
	}
}
