module locale

// हिन्दी (Hindi) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const hi = Text{
	modules: {
		'mechanics':    'टूर का उपयोग'
		'basics':       'बुनियादी प्रकार'
		'controlflow':  'नियंत्रण प्रवाह'
		'moretypes':    'और प्रकार'
		'optionresult': 'Option और Result'
		'methods':      'विधियाँ और इंटरफ़ेस'
		'generics':     'जेनरिक्स'
		'concurrency':  'समवर्ती'
	}
	lessons: {
		'welcome':      'शुरुआत'
		'basics':       'बुनियादी प्रकार'
		'controlflow':  'नियंत्रण प्रवाह'
		'moretypes':    'और प्रकार'
		'optionresult': 'Option और Result'
		'methods':      'विधियाँ और इंटरफ़ेस'
		'generics':     'जेनरिक्स'
		'concurrency':  'समवर्ती'
	}
	pages:   {}
	ui:      {
		'site_title':       'V का टूर'
		'toc':              'विषय-सूची'
		'toggle_theme':     'थीम बदलें'
		'language':         'भाषा'
		'run':              'चलाएँ'
		'format':           'प्रारूपित करें'
		'reset':            'रीसेट'
		'solution':         'समाधान'
		'output':           'आउटपुट'
		'help':             'कीबोर्ड शॉर्टकट'
		'help_close':       'बंद करें'
		'run_program':      'प्रोग्राम चलाएँ'
		'next_page':        'अगला पृष्ठ'
		'prev_page':        'पिछला पृष्ठ'
		'toggle_help':      'यह सहायता खोलें या बंद करें'
		'move_panes':       'पैनल के बीच जाएँ'
		'previous':         'पिछला'
		'next':             'अगला'
		'resize_panes':     'पैनल का आकार बदलें'
		'page_of':          '\${number} / \${total}'
		'no_program':       'सैंडबॉक्स में कोई परीक्षण प्रोग्राम नहीं था।'
		'compile_failed':   'प्रोग्राम संकलित नहीं हुआ।'
		'could_not_reach':  'सर्वर से कनेक्ट नहीं हो सका: '
		'could_not_format': 'इस प्रोग्राम को प्रारूपित नहीं किया जा सका।'
		'sandbox_busy':     'सैंडबॉक्स व्यस्त है। कृपया पुनः प्रयास करें।'
		'too_large':        'यह अनुरोध बहुत बड़ा है।'
		'no_compiler':      'सैंडबॉक्स में कोई कंपाइलर उपलब्ध नहीं है।'
		'link_counterpart': 'इस पृष्ठ को \${language} में पढ़ें'
		'lang_other':       'अन्य भाषाएँ'
	}
}
