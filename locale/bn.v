module locale

// বাংলা (Bengali) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const bn = Text{
	modules: {
		'mechanics':    'ট্যুর ব্যবহার'
		'basics':       'মৌলিক প্রকার'
		'controlflow':  'নিয়ন্ত্রণ প্রবাহ'
		'moretypes':    'আরও প্রকার'
		'optionresult': 'Option এবং Result'
		'methods':      'পদ্ধতি ও ইন্টারফেস'
		'generics':     'জেনেরিক'
		'concurrency':  'সমবর্তী'
	}
	lessons: {
		'welcome':      'শুরু করুন'
		'basics':       'মৌলিক প্রকার'
		'controlflow':  'নিয়ন্ত্রণ প্রবাহ'
		'moretypes':    'আরও প্রকার'
		'optionresult': 'Option এবং Result'
		'methods':      'পদ্ধতি ও ইন্টারফেস'
		'generics':     'জেনেরিক'
		'concurrency':  'সমবর্তী'
	}
	pages:   {}
	ui:      {
		'site_title':       'V এর ট্যুর'
		'toc':              'বিষয়সূচি'
		'toggle_theme':     'থিম পরিবর্তন'
		'language':         'ভাষা'
		'run':              'চালান'
		'format':           'বিন্যাস'
		'reset':            'রিসেট'
		'solution':         'সমাধান'
		'output':           'আউটপুট'
		'help':             'কীবোর্ড শর্টকাট'
		'help_close':       'বন্ধ করুন'
		'run_program':      'প্রোগ্রাম চালান'
		'next_page':        'পরবর্তী পৃষ্ঠা'
		'prev_page':        'পূর্ববর্তী পৃষ্ঠা'
		'toggle_help':      'এই সাহায্য খুলুন বা বন্ধ করুন'
		'move_panes':       'প্যানেলের মধ্যে সরান'
		'previous':         'পূর্ববর্তী'
		'next':             'পরবর্তী'
		'resize_panes':     'প্যানেলের আকার পরিবর্তন'
		'page_of':          '\${number} / \${total}'
		'no_program':       'স্যান্ডবক্সে কোনো পরীক্ষা প্রোগ্রাম ছিল না।'
		'compile_failed':   'প্রোগ্রাম কম্পাইল হয়নি।'
		'could_not_reach':  'সার্ভারে সংযোগ করা যায়নি: '
		'could_not_format': 'এই প্রোগ্রাম বিন্যাস করা যায়নি।'
		'sandbox_busy':     'স্যান্ডবক্স ব্যস্ত। অনুগ্রহ করে আবার চেষ্টা করুন।'
		'too_large':        'এই অনুরোধটি খুব বড়।'
		'no_compiler':      'স্যান্ডবক্সে কোনো কম্পাইলার নেই।'
		'link_counterpart': 'এই পৃষ্ঠাটি \${language} ভাষায় পড়ুন'
		'lang_other':       'অন্যান্য ভাষা'
	}
}
