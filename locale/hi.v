module locale

// हिन्दी (Hindi) translation.

pub const hi = Text{
	modules: {
		'mechanics':    'टूर का उपयोग'
		'basics':       'बुनियादी प्रकार'
		'controlflow':  'नियंत्रण प्रवाह'
		'moretypes':    'अधिक प्रकार'
		'optionresult': 'Option और Result'
		'methods':      'विधियाँ और इंटरफ़ेस'
		'generics':     'जेनरिक्स'
		'concurrency':  'समवर्तिता'
	}
	lessons: {
		'welcome':      'शुरुआत'
		'basics':       'बुनियादी प्रकार'
		'controlflow':  'नियंत्रण प्रवाह'
		'moretypes':    'अधिक प्रकार'
		'optionresult': 'Option और Result'
		'methods':      'विधियाँ और इंटरफ़ेस'
		'generics':     'जेनरिक्स'
		'concurrency':  'समवर्तिता'
	}
	pages:   {
		'welcome/1':      PageText{
			title: 'नमस्ते, दुनिया'
			body:  "<p><a href='https://vlang.io'>V प्रोग्रामिंग भाषा</a> के टूर में आपका स्वागत है।</p>
<p>टूर मॉड्यूल में विभाजित है। आप <a href='/list'>सामग्री सूची</a> या ऊपरी दाएँ कोने के मेनू बटन से इन तक पहुँच सकते हैं।</p>
<p>पूरे टूर में आपको स्लाइड और अभ्यास मिलेंगे। टेक्स्ट के नीचे <b>पिछला</b> और <b>अगला</b> लिंक, या <code>PageUp</code> और <code>PageDown</code> कुंजियों से नेविगेट करें।</p>
<p>टूर इंटरैक्टिव है। प्रोग्राम को संकलित और चलाने के लिए <b>चलाएँ</b> (या <code>Shift</code>+<code>Enter</code>) दबाएँ। परिणाम कोड के नीचे दिखाई देता है।</p>
<p>ये प्रोग्राम आपके अपने प्रयोगों के लिए शुरुआती बिंदु हैं। प्रोग्राम को संपादित करें और फिर से चलाएँ।</p>"
		}
		'welcome/2':      PageText{
			title: 'इस टूर का उपयोग'
			body:  '<p>हर पेज में बाईं ओर टेक्स्ट कॉलम और दाईं ओर कोड कॉलम होता है। उनके बीच एक ड्रैग हैंडल है: कोड को अधिक जगह देने के लिए इसे खींचें।</p>'
		}
		'welcome/3':      PageText{
			title: 'V ऑफ़लाइन (वैकल्पिक)'
			body:  '<p>इस टूर का उपयोग करने के लिए स्थानीय V इंस्टॉलेशन की आवश्यकता नहीं है, लेकिन यह अनुशंसित है।</p>'
		}
		'welcome/4':      PageText{
			title: 'सैंडबॉक्स'
			body:  '<p>आपके प्रोग्राम सर्वर के सैंडबॉक्स में चलते हैं।</p>'
		}
		'welcome/5':      PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने टूर का पहला मॉड्यूल पूरा कर लिया है!</p>
<p>अगला क्या सीखना है यह जानने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या सीधे <a href='/basics/1'>भाषा की नींव</a> के साथ जारी रखें।</p>"
		}
		'basics/1':       PageText{
			title: 'मॉड्यूल'
			body:  '<h2>मॉड्यूल</h2>'
		}
		'basics/2':       PageText{
			title: 'आयात'
			body:  '<h2>आयात</h2>'
		}
		'basics/3':       PageText{
			title: 'चर'
			body:  '<h2>चर</h2>'
		}
		'basics/4':       PageText{
			title: 'परिवर्तनीय चर'
			body:  '<h2>परिवर्तनीय चर</h2>'
		}
		'basics/5':       PageText{
			title: 'छोटे घोषणाएँ'
			body:  '<h2>छोटे घोषणाएँ</h2>'
		}
		'basics/6':       PageText{
			title: 'फ़ंक्शन'
			body:  '<h2>फ़ंक्शन</h2>'
		}
		'basics/7':       PageText{
			title: 'एकाधिक परिणाम'
			body:  '<h2>एकाधिक परिणाम</h2>'
		}
		'basics/8':       PageText{
			title: 'बुनियादी प्रकार'
			body:  '<h2>बुनियादी प्रकार</h2>'
		}
		'basics/9':       PageText{
			title: 'शून्य मान'
			body:  '<h2>शून्य मान</h2>'
		}
		'basics/10':      PageText{
			title: 'स्थिरांक'
			body:  '<h2>स्थिरांक</h2>'
		}
		'basics/11':      PageText{
			title: 'प्रकार रूपांतरण'
			body:  '<h2>प्रकार रूपांतरण</h2>'
		}
		'basics/12':      PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने यह पाठ पूरा कर लिया है!</p>
<p>अगला क्या सीखना है यह जानने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या <a href='/controlflow/1'>नियंत्रण प्रवाह</a> के साथ जारी रखें।</p>"
		}
		'basics/13':      PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने यह पाठ पूरा कर लिया है!</p>
<p>अगला क्या सीखना है यह जानने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या <a href='/controlflow/1'>नियंत्रण प्रवाह</a> के साथ जारी रखें।</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':  PageText{
			title: 'For ही V का "while" है'
			body:  '<h2>For ही V का "while" है</h2>'
		}
		'controlflow/3':  PageText{
			title: 'For जारी'
			body:  '<h2>For जारी</h2>'
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':  PageText{
			title: 'अनपैक मान के साथ If'
			body:  '<h2>अनपैक मान के साथ If</h2>'
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':  PageText{
			title: 'Match और सम प्रकार'
			body:  '<h2>Match और सम प्रकार</h2>'
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':  PageText{
			title: 'अभ्यास: लूप और फ़ंक्शन'
			body:  '<h2>अभ्यास: लूप और फ़ंक्शन</h2>'
		}
		'controlflow/10': PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने यह पाठ पूरा कर लिया है!</p>
<p>अगला क्या सीखना है यह जानने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या <a href='/moretypes/1'>अधिक प्रकार</a> के साथ जारी रखें।</p>"
		}
		'moretypes/1':    PageText{
			title: 'संरचनाएँ'
			body:  '<h2>संरचनाएँ</h2>'
		}
		'moretypes/2':    PageText{
			title: 'ऐरे'
			body:  '<h2>ऐरे</h2>'
		}
		'moretypes/3':    PageText{
			title: 'स्लाइस'
			body:  '<h2>स्लाइस</h2>'
		}
		'moretypes/4':    PageText{
			title: 'मैप'
			body:  '<h2>मैप</h2>'
		}
		'moretypes/5':    PageText{
			title: 'स्ट्रिंग'
			body:  '<h2>स्ट्रिंग</h2>'
		}
		'moretypes/6':    PageText{
			title: 'विधियाँ'
			body:  '<h2>विधियाँ</h2>'
		}
		'moretypes/7':    PageText{
			title: 'अभ्यास: शब्द गणना'
			body:  '<h2>अभ्यास: शब्द गणना</h2>'
		}
		'moretypes/8':    PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने यह पाठ पूरा कर लिया है!</p>
<p>अगला क्या सीखना है यह जानने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या <a href='/optionresult/1'>अनुपस्थिति और विफलता प्रबंधन</a> के साथ जारी रखें।</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2': PageText{
			title: 'Result और त्रुटियाँ'
			body:  '<h2>Result और त्रुटियाँ</h2>'
		}
		'optionresult/3': PageText{
			title: 'अभ्यास: Options'
			body:  '<h2>अभ्यास: Options</h2>'
		}
		'optionresult/4': PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने यह पाठ पूरा कर लिया है!</p>
<p>अगला क्या सीखना है यह जानने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या <a href='/methods/1'>विधियाँ और इंटरफ़ेस</a> के साथ जारी रखें।</p>"
		}
		'methods/1':      PageText{
			title: 'इंटरफ़ेस'
			body:  '<h2>इंटरफ़ेस</h2>'
		}
		'methods/2':      PageText{
			title: 'एम्बेडिंग'
			body:  '<h2>एम्बेडिंग</h2>'
		}
		'methods/3':      PageText{
			title: 'मुद्रण योग्य प्रकार'
			body:  '<h2>मुद्रण योग्य प्रकार</h2>'
		}
		'methods/4':      PageText{
			title: 'अभ्यास: आकृतियाँ'
			body:  '<h2>अभ्यास: आकृतियाँ</h2>'
		}
		'methods/5':      PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने यह पाठ पूरा कर लिया है!</p>
<p>अगला क्या सीखना है यह जानने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या <a href='/generics/1'>जेनरिक्स</a> के साथ जारी रखें।</p>"
		}
		'generics/1':     PageText{
			title: 'जेनरिक फ़ंक्शन'
			body:  '<h2>जेनरिक फ़ंक्शन</h2>'
		}
		'generics/2':     PageText{
			title: 'जेनरिक संरचनाएँ'
			body:  '<h2>जेनरिक संरचनाएँ</h2>'
		}
		'generics/3':     PageText{
			title: 'जेनरिक प्रकार के मैप'
			body:  '<h2>जेनरिक प्रकार के मैप</h2>'
		}
		'generics/4':     PageText{
			title: 'कई प्रकार पैरामीटर'
			body:  '<h2>कई प्रकार पैरामीटर</h2>'
		}
		'generics/5':     PageText{
			title: 'अभ्यास: जेनरिक्स'
			body:  '<h2>अभ्यास: जेनरिक्स</h2>'
		}
		'generics/6':     PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने यह पाठ पूरा कर लिया है!</p>
<p>अगला क्या सीखना है यह जानने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या <a href='/concurrency/1'>समवर्तिता</a> के साथ जारी रखें।</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':  PageText{
			title: 'चैनल'
			body:  '<h2>चैनल</h2>'
		}
		'concurrency/3':  PageText{
			title: 'बफर्ड चैनल'
			body:  '<h2>बफर्ड चैनल</h2>'
		}
		'concurrency/4':  PageText{
			title: 'बंद होने तक प्राप्त करें'
			body:  '<h2>बंद होने तक प्राप्त करें</h2>'
		}
		'concurrency/5':  PageText{
			title: 'बंद करें'
			body:  '<h2>बंद करें</h2>'
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':  PageText{
			title: 'साझा स्थिति'
			body:  '<h2>साझा स्थिति</h2>'
		}
		'concurrency/8':  PageText{
			title: 'प्रतीक्षा समूह'
			body:  '<h2>प्रतीक्षा समूह</h2>'
		}
		'concurrency/9':  PageText{
			title: 'अभ्यास: वर्कर पूल'
			body:  '<h2>अभ्यास: वर्कर पूल</h2>'
		}
		'concurrency/10': PageText{
			title: 'बधाई हो!'
			body:  "<p>आपने यह पाठ पूरा कर लिया है, और इसके साथ पूरा टूर!</p>
<p>कुछ भी फिर से पढ़ने के लिए <a href='/list'>मॉड्यूल सूची</a> पर वापस जाएँ, या <a href='/welcome/1'>शुरुआत</a> से फिर से शुरू करें।</p>"
		}
		'cli/1':          PageText{
			title: 'रोज़मर्रा के आदेश'
			body:  '<h2>रोज़मर्रा के आदेश</h2>'
		}
		'vpm/1':          PageText{
			title: 'पैकेज'
			body:  '<h2>पैकेज</h2>'
		}
		'mcp/1':          PageText{
			title: 'मॉडल संदर्भ प्रोटोकॉल'
			body:  '<h2>मॉडल संदर्भ प्रोटोकॉल</h2>'
		}
		'skills/1':       PageText{
			title: 'कौशल'
			body:  '<h2>कौशल</h2>'
		}
	}
	ui:      {
		'site_title':       'V टूर'
		'toc':              'सामग्री सूची'
		'toggle_theme':     'थीम बदलें'
		'language':         'भाषा'
		'run':              'चलाएँ'
		'format':           'फ़ॉर्मेट'
		'reset':            'रीसेट'
		'solution':         'समाधान'
		'output':           'आउटपुट'
		'help':             'कीबोर्ड शॉर्टकट'
		'help_close':       'बंद करें'
		'run_program':      'प्रोग्राम चलाएँ'
		'next_page':        'अगला पेज'
		'prev_page':        'पिछला पेज'
		'toggle_help':      'यह सहायता खोलें या बंद करें'
		'move_panes':       'पैनल के बीच जाएँ'
		'previous':         'पिछला'
		'next':             'अगला'
		'resize_panes':     'पैनल का आकार बदलें'
		'page_of':          '\${number} / \${total}'
		'no_program':       'सैंडबॉक्स में कोई परीक्षण प्रोग्राम नहीं था।'
		'compile_failed':   'प्रोग्राम संकलित नहीं हुआ।'
		'could_not_reach':  'सर्वर से संपर्क नहीं हो सका: '
		'could_not_format': 'इस प्रोग्राम को फ़ॉर्मेट नहीं किया जा सका।'
		'sandbox_busy':     'सैंडबॉक्स व्यस्त है। कृपया पुनः प्रयास करें।'
		'too_large':        'यह अनुरोध बहुत बड़ा है।'
		'no_compiler':      'सैंडबॉक्स में कोई कंपाइलर उपलब्ध नहीं है।'
		'link_counterpart': 'इस पेज को \${language} में पढ़ें'
		'lang_other':       'अन्य भाषाएँ'
	}
}
