module locale

// বাংলা (Bengali) translation.

pub const bn = Text{
	modules: {
		'mechanics':    'ট্যুর ব্যবহার'
		'basics':       'মৌলিক প্রকার'
		'controlflow':  'নিয়ন্ত্রণ প্রবাহ'
		'moretypes':    'আরও প্রকার'
		'optionresult': 'Option এবং Result'
		'methods':      'পদ্ধতি এবং ইন্টারফেস'
		'generics':     'জেনেরিক্স'
		'concurrency':  'সমবর্তিতা'
	}
	lessons: {
		'welcome':      'শুরু করা'
		'basics':       'মৌলিক প্রকার'
		'controlflow':  'নিয়ন্ত্রণ প্রবাহ'
		'moretypes':    'আরও প্রকার'
		'optionresult': 'Option এবং Result'
		'methods':      'পদ্ধতি এবং ইন্টারফেস'
		'generics':     'জেনেরিক্স'
		'concurrency':  'সমবর্তিতা'
	}
	pages:   {
		'welcome/1':       PageText{
			title: 'হ্যালো, ওয়ার্ল্ড'
			body:  "<p><a href='https://vlang.io'>V প্রোগ্রামিং ভাষা</a>র ট্যুরে স্বাগতম।</p>
<p>ট্যুরটি মডিউলে বিভক্ত। আপনি <a href='/list'>বিষয়সূচি</a> বা উপরের ডানদিকের মেনু বোতাম থেকে এগুলিতে পৌঁছাতে পারেন।</p>
<p>পুরো ট্যুর জুড়ে আপনি স্লাইড এবং অনুশীলন পাবেন। টেক্সটের নিচে <b>পূর্ববর্তী</b> এবং <b>পরবর্তী</b> লিংক, অথবা <code>PageUp</code> এবং <code>PageDown</code> কী ব্যবহার করে নেভিগেট করুন।</p>
<p>ট্যুরটি ইন্টারেক্টিভ। প্রোগ্রাম সংকলন ও চালানোর জন্য <b>চালান</b> (অথবা <code>Shift</code>+<code>Enter</code>) চাপুন। ফলাফল কোডের নিচে দেখায়।</p>
<p>এই প্রোগ্রামগুলি আপনার নিজস্ব পরীক্ষার জন্য সূচনা বিন্দু। প্রোগ্রাম সম্পাদনা করুন এবং আবার চালান।</p>"
		}
		'welcome/2':       PageText{
			title: 'এই ট্যুর ব্যবহার'
			body:  '<p>প্রতিটি পৃষ্ঠার বামদিকে টেক্সট কলাম এবং ডানদিকে কোড কলাম থাকে। এদের মধ্যে একটি ড্র্যাগ হ্যান্ডেল আছে: কোডের জন্য আরও জায়গা দিতে এটি টেনে আনুন।</p>'
		}
		'welcome/3':       PageText{
			title: 'V অফলাইন (ঐচ্ছিক)'
			body:  "<p>এই ট্যুর ব্যবহার করতে স্থানীয় V ইনস্টলেশন প্রয়োজন নেই, তবে এটি প্রস্তাবিত।</p>"
		}
		'welcome/4':       PageText{
			title: 'স্যান্ডবক্স'
			body:  '<p>আপনার প্রোগ্রাম সার্ভারের স্যান্ডবক্সে চলে।</p>'
		}
		'welcome/5':       PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি ট্যুরের প্রথম মডিউল সম্পন্ন করেছেন!</p>
<p>পরের কী শিখবেন তা জানতে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা সরাসরি <a href='/basics/1'>ভাষার ভিত্তি</a>র সাথে চালিয়ে যান।</p>"
		}
		'basics/1':        PageText{
			title: 'মডিউল'
			body:  '<h2>মডিউল</h2>'
		}
		'basics/2':        PageText{
			title: 'আমদানি'
			body:  '<h2>আমদানি</h2>'
		}
		'basics/3':        PageText{
			title: 'চলক'
			body:  '<h2>চলক</h2>'
		}
		'basics/4':        PageText{
			title: 'পরিবর্তনশীল চলক'
			body:  '<h2>পরিবর্তনশীল চলক</h2>'
		}
		'basics/5':        PageText{
			title: 'সংক্ষিপ্ত ঘোষণা'
			body:  '<h2>সংক্ষিপ্ত ঘোষণা</h2>'
		}
		'basics/6':        PageText{
			title: 'ফাংশন'
			body:  '<h2>ফাংশন</h2>'
		}
		'basics/7':        PageText{
			title: 'একাধিক ফলাফল'
			body:  '<h2>একাধিক ফলাফল</h2>'
		}
		'basics/8':        PageText{
			title: 'মৌলিক প্রকার'
			body:  '<h2>মৌলিক প্রকার</h2>'
		}
		'basics/9':        PageText{
			title: 'শূন্য মান'
			body:  '<h2>শূন্য মান</h2>'
		}
		'basics/10':       PageText{
			title: 'ধ্রুবক'
			body:  '<h2>ধ্রুবক</h2>'
		}
		'basics/11':       PageText{
			title: 'প্রকার রূপান্তর'
			body:  '<h2>প্রকার রূপান্তর</h2>'
		}
		'basics/12':       PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি এই পাঠ সম্পন্ন করেছেন!</p>
<p>পরের কী শিখবেন তা জানতে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা <a href='/controlflow/1'>নিয়ন্ত্রণ প্রবাহ</a>র সাথে চালিয়ে যান।</p>"
		}
		'basics/13':       PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি এই পাঠ সম্পন্ন করেছেন!</p>
<p>পরের কী শিখবেন তা জানতে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা <a href='/controlflow/1'>নিয়ন্ত্রণ প্রবাহ</a>র সাথে চালিয়ে যান।</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For হল V-এর "while"'
			body:  '<h2>For হল V-এর "while"</h2>'
		}
		'controlflow/3':   PageText{
			title: 'For চালিয়ে'
			body:  '<h2>For চালিয়ে</h2>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':   PageText{
			title: 'আনপ্যাক মান সহ If'
			body:  '<h2>আনপ্যাক মান সহ If</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match এবং সাম প্রকার'
			body:  '<h2>Match এবং সাম প্রকার</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: 'অনুশীলন: লুপ এবং ফাংশন'
			body:  '<h2>অনুশীলন: লুপ এবং ফাংশন</h2>'
		}
		'controlflow/10':  PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি এই পাঠ সম্পন্ন করেছেন!</p>
<p>পরের কী শিখবেন তা জানতে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা <a href='/moretypes/1'>আরও প্রকার</a>র সাথে চালিয়ে যান।</p>"
		}
		'moretypes/1':     PageText{
			title: 'স্ট্রাকচার'
			body:  '<h2>স্ট্রাকচার</h2>'
		}
		'moretypes/2':     PageText{
			title: 'অ্যারে'
			body:  '<h2>অ্যারে</h2>'
		}
		'moretypes/3':     PageText{
			title: 'স্লাইস'
			body:  '<h2>স্লাইস</h2>'
		}
		'moretypes/4':     PageText{
			title: 'ম্যাপ'
			body:  '<h2>ম্যাপ</h2>'
		}
		'moretypes/5':     PageText{
			title: 'স্ট্রিং'
			body:  '<h2>স্ট্রিং</h2>'
		}
		'moretypes/6':     PageText{
			title: 'পদ্ধতি'
			body:  '<h2>পদ্ধতি</h2>'
		}
		'moretypes/7':     PageText{
			title: 'অনুশীলন: শব্দ গণনা'
			body:  '<h2>অনুশীলন: শব্দ গণনা</h2>'
		}
		'moretypes/8':     PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি এই পাঠ সম্পন্ন করেছেন!</p>
<p>পরের কী শিখবেন তা জানতে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা <a href='/optionresult/1'>অনুপস্থিতি এবং ব্যর্থতা পরিচালনা</a>র সাথে চালিয়ে যান।</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result এবং ত্রুটি'
			body:  '<h2>Result এবং ত্রুটি</h2>'
		}
		'optionresult/3':  PageText{
			title: 'অনুশীলন: Options'
			body:  '<h2>অনুশীলন: Options</h2>'
		}
		'optionresult/4':  PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি এই পাঠ সম্পন্ন করেছেন!</p>
<p>পরের কী শিখবেন তা জানতে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা <a href='/methods/1'>পদ্ধতি এবং ইন্টারফেস</a>র সাথে চালিয়ে যান।</p>"
		}
		'methods/1':       PageText{
			title: 'ইন্টারফেস'
			body:  '<h2>ইন্টারফেস</h2>'
		}
		'methods/2':       PageText{
			title: 'এমবেডিং'
			body:  '<h2>এমবেডিং</h2>'
		}
		'methods/3':       PageText{
			title: 'মুদ্রণযোগ্য প্রকার'
			body:  '<h2>মুদ্রণযোগ্য প্রকার</h2>'
		}
		'methods/4':       PageText{
			title: 'অনুশীলন: আকৃতি'
			body:  '<h2>অনুশীলন: আকৃতি</h2>'
		}
		'methods/5':       PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি এই পাঠ সম্পন্ন করেছেন!</p>
<p>পরের কী শিখবেন তা জানতে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা <a href='/generics/1'>জেনেরিক্স</a>র সাথে চালিয়ে যান।</p>"
		}
		'generics/1':      PageText{
			title: 'জেনেরিক ফাংশন'
			body:  '<h2>জেনেরিক ফাংশন</h2>'
		}
		'generics/2':      PageText{
			title: 'জেনেরিক স্ট্রাকচার'
			body:  '<h2>জেনেরিক স্ট্রাকচার</h2>'
		}
		'generics/3':      PageText{
			title: 'জেনেরিক প্রকারের ম্যাপ'
			body:  '<h2>জেনেরিক প্রকারের ম্যাপ</h2>'
		}
		'generics/4':      PageText{
			title: 'একাধিক প্রকার প্যারামিটার'
			body:  '<h2>একাধিক প্রকার প্যারামিটার</h2>'
		}
		'generics/5':      PageText{
			title: 'অনুশীলন: জেনেরিক্স'
			body:  '<h2>অনুশীলন: জেনেরিক্স</h2>'
		}
		'generics/6':      PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি এই পাঠ সম্পন্ন করেছেন!</p>
<p>পরের কী শিখবেন তা জানতে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা <a href='/concurrency/1'>সমবর্তিতা</a>র সাথে চালিয়ে যান।</p>"
		}
		'concurrency/1':   PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':   PageText{
			title: 'চ্যানেল'
			body:  '<h2>চ্যানেল</h2>'
		}
		'concurrency/3':   PageText{
			title: 'বাফারড চ্যানেল'
			body:  '<h2>বাফারড চ্যানেল</h2>'
		}
		'concurrency/4':   PageText{
			title: 'বন্ধ হওয়া পর্যন্ত গ্রহণ'
			body:  '<h2>বন্ধ হওয়া পর্যন্ত গ্রহণ</h2>'
		}
		'concurrency/5':   PageText{
			title: 'বন্ধ করা'
			body:  '<h2>বন্ধ করা</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: 'ভাগাভাগি অবস্থা'
			body:  '<h2>ভাগাভাগি অবস্থা</h2>'
		}
		'concurrency/8':   PageText{
			title: 'অপেক্ষা গ্রুপ'
			body:  '<h2>অপেক্ষা গ্রুপ</h2>'
		}
		'concurrency/9':   PageText{
			title: 'অনুশীলন: ওয়ার্কার পুল'
			body:  '<h2>অনুশীলন: ওয়ার্কার পুল</h2>'
		}
		'concurrency/10':  PageText{
			title: 'অভিনন্দন!'
			body:  "<p>আপনি এই পাঠ সম্পন্ন করেছেন, এবং এর সাথে পুরো ট্যুর!</p>
<p>কিছু পুনরায় পড়তে <a href='/list'>মডিউল তালিকা</a>তে ফিরে যান, অথবা <a href='/welcome/1'>শুরু করা</a> থেকে আবার শুরু করুন।</p>"
		}
	}
	ui:      {
		'site_title':       'V ট্যুর'
		'toc':              'বিষয়সূচি'
		'toggle_theme':     'থিম পরিবর্তন'
		'language':         'ভাষা'
		'run':              'চালান'
		'format':           'ফরম্যাট'
		'reset':            'রিসেট'
		'solution':         'সমাধান'
		'output':           'আউটপুট'
		'help':             'কীবোর্ড শর্টকাট'
		'help_close':       'বন্ধ'
		'run_program':      'প্রোগ্রাম চালান'
		'next_page':        'পরবর্তী পৃষ্ঠা'
		'prev_page':        'পূর্ববর্তী পৃষ্ঠা'
		'toggle_help':      'এই সহায়তা খুলুন বা বন্ধ করুন'
		'move_panes':       'প্যানেলের মধ্যে সরান'
		'previous':         'পূর্ববর্তী'
		'next':             'পরবর্তী'
		'resize_panes':     'প্যানেলের আকার পরিবর্তন'
		'page_of':          '\${number} / \${total}'
		'no_program':       'স্যান্ডবক্সে কোনো পরীক্ষা প্রোগ্রাম ছিল না।'
		'compile_failed':   'প্রোগ্রাম সংকলিত হয়নি।'
		'could_not_reach':  'সার্ভারে পৌঁছানো যায়নি: '
		'could_not_format': 'এই প্রোগ্রাম ফরম্যাট করা যায়নি।'
		'sandbox_busy':     'স্যান্ডবক্স ব্যস্ত। আবার চেষ্টা করুন।'
		'too_large':        'এই অনুরোধ খুব বড়।'
		'no_compiler':      'স্যান্ডবক্সে কোনো কম্পাইলার নেই।'
		'link_counterpart': 'এই পৃষ্ঠা \${language} ভাষায় পড়ুন'
		'lang_other':       'অন্যান্য ভাষা'
	}
}
