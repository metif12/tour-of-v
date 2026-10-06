module locale

// اردو (Urdu) translation.

pub const ur = Text{
	modules: {
		'mechanics':    'ٹور کا استعمال'
		'basics':       'بنیادی اقسام'
		'controlflow':  'کنٹرول فلو'
		'moretypes':    'مزید اقسام'
		'optionresult': 'Option اور Result'
		'methods':      'طریقے اور انٹرفیسز'
		'generics':     'جنرکس'
		'concurrency':  'ہم وقتی'
	}
	lessons: {
		'welcome':      'شروعات'
		'basics':       'بنیادی اقسام'
		'controlflow':  'کنٹرول فلو'
		'moretypes':    'مزید اقسام'
		'optionresult': 'Option اور Result'
		'methods':      'طریقے اور انٹرفیسز'
		'generics':     'جنرکس'
		'concurrency':  'ہم وقتی'
	}
	pages:   {
		'welcome/1':       PageText{
			title: 'ہیلو، ورلڈ'
			body:  "<p><a href='https://vlang.io'>V پروگرامنگ زبان</a> کے ٹور میں خوش آمدید۔</p>
<p>ٹور ماڈیولز میں تقسیم ہے۔ آپ <a href='/list'>فہرست مضامین</a> یا اوپر دائیں کونے کے مینو بٹن سے ان تک پہنچ سکتے ہیں۔</p>
<p>پورے ٹور میں آپ سلائیڈز اور مشقیں پائیں گے۔ متن کے نیچے <b>پچھلا</b> اور <b>اگلا</b> لنک، یا <code>PageUp</code> اور <code>PageDown</code> کلیدوں سے نیویگیٹ کریں۔</p>
<p>ٹور انٹرایکٹو ہے۔ پروگرام کو کمپائل اور چلانے کے لیے <b>چلائیں</b> (یا <code>Shift</code>+<code>Enter</code>) دبائیں۔ نتیجہ کوڈ کے نیچے دکھائی دیتا ہے۔</p>
<p>یہ پروگرام آپ کے اپنے تجربات کے لیے آغاز کے نکات ہیں۔ پروگرام میں ترمیم کریں اور دوبارہ چلائیں۔</p>"
		}
		'welcome/2':       PageText{
			title: 'اس ٹور کا استعمال'
			body:  '<p>ہر صفحے کے بائیں جانب متن کا کالم اور دائیں جانب کوڈ کا کالم ہوتا ہے۔ ان کے درمیان ایک ڈریگ ہینڈل ہے: کوڈ کو مزید جگہ دینے کے لیے اسے کھینچیں۔</p>'
		}
		'welcome/3':       PageText{
			title: 'V آف لائن (اختیاری)'
			body:  "<p>اس ٹور کو استعمال کرنے کے لیے مقامی V انسٹالیشن کی ضرورت نہیں ہے، لیکن یہ تجویز کیا جاتا ہے۔</p>"
		}
		'welcome/4':       PageText{
			title: 'سینڈ باکس'
			body:  '<p>آپ کے پروگرام سرور کے سینڈ باکس میں چلتے ہیں۔</p>'
		}
		'welcome/5':       PageText{
			title: 'مبارک باد!'
			body:  "<p>آپ نے ٹور کا پہلا ماڈیول مکمل کر لیا ہے!</p>
<p>اگر کیا سیکھنا ہے یہ جاننے کے لیے <a href='/list'>ماڈیول کی فہرست</a> پر واپس جائیں، یا براہ راست <a href='/basics/1'>زبان کی بنیادی باتوں</a> کے ساتھ جاری رکھیں۔</p>"
		}
		'basics/1':        PageText{
			title: 'ماڈیولز'
			body:  '<h2>ماڈیولز</h2>'
		}
		'basics/2':        PageText{
			title: 'امپورٹس'
			body:  '<h2>امپورٹس</h2>'
		}
		'basics/3':        PageText{
			title: 'متغیرات'
			body:  '<h2>متغیرات</h2>'
		}
		'basics/4':        PageText{
			title: 'متبدل متغیرات'
			body:  '<h2>متبدل متغیرات</h2>'
		}
		'basics/5':        PageText{
			title: 'مختصر اعلانات'
			body:  '<h2>مختصر اعلانات</h2>'
		}
		'basics/6':        PageText{
			title: 'فنکشنز'
			body:  '<h2>فنکشنز</h2>'
		}
		'basics/7':        PageText{
			title: 'متعدد نتائج'
			body:  '<h2>متعدد نتائج</h2>'
		}
		'basics/8':        PageText{
			title: 'بنیادی اقسام'
			body:  '<h2>بنیادی اقسام</h2>'
		}
		'basics/9':        PageText{
			title: 'صفر اقدار'
			body:  '<h2>صفر اقدار</h2>'
		}
		'basics/10':       PageText{
			title: 'مستقل'
			body:  '<h2>مستقل</h2>'
		}
		'basics/11':       PageText{
			title: 'قسم کی تبدیلی'
			body:  '<h2>قسم کی تبدیلی</h2>'
		}
		'basics/12':       PageText{
			title: 'مبارک باد!'
			body:  "<p>آپ نے یہ سبق مکمل کر لیا ہے!</p>
<p>اگر کیا سیکھنا ہے یہ جاننے کے لیے <a href='/list'>ماڈیول کی فہرست</a> پر واپس جائیں، یا <a href='/controlflow/1'>کنٹرول فلو</a> کے ساتھ جاری رکھیں۔</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For ہی V کا "while" ہے'
			body:  '<h2>For ہی V کا "while" ہے</h2>'
		}
		'controlflow/3':   PageText{
			title: 'For جاری'
			body:  '<h2>For جاری</h2>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':   PageText{
			title: 'ان پیک قدر کے ساتھ If'
			body:  '<h2>ان پیک قدر کے ساتھ If</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match اور سام اقسام'
			body:  '<h2>Match اور سام اقسام</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: 'مشق: لوپس اور فنکشنز'
			body:  '<h2>مشق: لوپس اور فنکشنز</h2>'
		}
		'controlflow/10':  PageText{
			title: 'مبارک باد!'
			body:  "<p>آپ نے یہ سبق مکمل کر لیا ہے!</p>
<p>اگر کیا سیکھنا ہے یہ جاننے کے لیے <a href='/list'>ماڈیول کی فہرست</a> پر واپس جائیں، یا <a href='/moretypes/1'>مزید اقسام</a> کے ساتھ جاری رکھیں۔</p>"
		}
		'moretypes/1':     PageText{
			title: 'اسٹرکچرز'
			body:  '<h2>اسٹرکچرز</h2>'
		}
		'moretypes/2':     PageText{
			title: 'ایرے'
			body:  '<h2>ایرے</h2>'
		}
		'moretypes/3':     PageText{
			title: 'سلائس'
			body:  '<h2>سلائس</h2>'
		}
		'moretypes/4':     PageText{
			title: 'میپس'
			body:  '<h2>میپس</h2>'
		}
		'moretypes/5':     PageText{
			title: 'اسٹرنگز'
			body:  '<h2>اسٹرنگز</h2>'
		}
		'moretypes/6':     PageText{
			title: 'طریقے'
			body:  '<h2>طریقے</h2>'
		}
		'moretypes/7':     PageText{
			title: 'مشق: الفاظ کی گنتی'
			body:  '<h2>مشق: الفاظ کی گنتی</h2>'
		}
		'moretypes/8':     PageText{
			title: 'مبارک باد!'
			body:  "<p>آپ نے یہ سبق مکمل کر لیا ہے!</p>
<p>اگر کیا سیکھنا ہے یہ جاننے کے لیے <a href='/list'>ماڈیول کی فہرست</a> پر واپس جائیں، یا <a href='/optionresult/1'>غیر موجودگی اور ناکامی کا انتظام</a> کے ساتھ جاری رکھیں۔</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result اور خرابیاں'
			body:  '<h2>Result اور خرابیاں</h2>'
		}
		'optionresult/3':  PageText{
			title: 'مشق: Options'
			body:  '<h2>مشق: Options</h2>'
		}
		'optionresult/4':  PageText{
			title: 'مبارک باد!'
			body:  "<p>آپ نے یہ سبق مکمل کر لیا ہے!</p>
<p>اگر کیا سیکھنا ہے یہ جاننے کے لیے <a href='/list'>ماڈیول کی فہرست</a> پر واپس جائیں، یا <a href='/methods/1'>طریقے اور انٹرفیسز</a> کے ساتھ جاری رکھیں۔</p>"
		}
		'methods/1':       PageText{
			title: 'انٹرفیسز'
			body:  '<h2>انٹرفیسز</h2>'
		}
		'methods/2':       PageText{
			title: 'ایمبیڈنگ'
			body:  '<h2>ایمبیڈنگ</h2>'
		}
		'methods/3':       PageText{
			title: 'پرنٹ ایبل اقسام'
			body:  '<h2>پرنٹ ایبل اقسام</h2>'
		}
		'methods/4':       PageText{
			title: 'مشق: شکلیں'
			body:  '<h2>مشق: شکلیں</h2>'
		}
		'methods/5':       PageText{
			title: 'مبارک باد!'
			body:  "<p>آپ نے یہ سبق مکمل کر لیا ہے!</p>
<p>اگر کیا سیکھنا ہے یہ جاننے کے لیے <a href='/list'>ماڈیول کی فہرست</a> پر واپس جائیں، یا <a href='/generics/1'>جنرکس</a> کے ساتھ جاری رکھیں۔</p>"
		}
		'generics/1':      PageText{
			title: 'جنرک فنکشنز'
			body:  '<h2>جنرک فنکشنز</h2>'
		}
		'generics/2':      PageText{
			title: 'جنرک اسٹرکچرز'
			body:  '<h2>جنرک اسٹرکچرز</h2>'
		}
		'generics/3':      PageText{
			title: 'جنرک اقسام کے میپس'
			body:  '<h2>جنرک اقسام کے میپس</h2>'
		}
		'generics/4':      PageText{
			title: 'متعدد قسم پیرامیٹرز'
			body:  '<h2>متعدد قسم پیرامیٹرز</h2>'
		}
		'generics/5':      PageText{
			title: 'مشق: جنرکس'
			body:  '<h2>مشق: جنرکس</h2>'
		}
		'generics/6':      PageText{
			title: 'مبارک باد!'
			body:  "<p>آپ نے یہ سبق مکمل کر لیا ہے!</p>
<p>اگر کیا سیکھنا ہے یہ جاننے کے لیے <a href='/list'>ماڈیول کی فہرست</a> پر واپس جائیں، یا <a href='/concurrency/1'>ہم وقتی</a> کے ساتھ جاری رکھیں۔</p>"
		}
		'concurrency/1':   PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':   PageText{
			title: 'چینلز'
			body:  '<h2>چینلز</h2>'
		}
		'concurrency/3':   PageText{
			title: 'بفرڈ چینلز'
			body:  '<h2>بفرڈ چینلز</h2>'
		}
		'concurrency/4':   PageText{
			title: 'بند ہونے تک وصول'
			body:  '<h2>بند ہونے تک وصول</h2>'
		}
		'concurrency/5':   PageText{
			title: 'بند کرنا'
			body:  '<h2>بند کرنا</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: 'مشترکہ حالت'
			body:  '<h2>مشترکہ حالت</h2>'
		}
		'concurrency/8':   PageText{
			title: 'انتظار گروپس'
			body:  '<h2>انتظار گروپس</h2>'
		}
		'concurrency/9':   PageText{
			title: 'مشق: ورکر پول'
			body:  '<h2>مشق: ورکر پول</h2>'
		}
		'concurrency/10':  PageText{
			title: 'مبارک باد!'
			body:  "<p>آپ نے یہ سبق مکمل کر لیا ہے، اور اس کے ساتھ پورا ٹور!</p>
<p>کچھ بھی دوبارہ پڑھنے کے لیے <a href='/list'>ماڈیول کی فہرست</a> پر واپس جائیں، یا <a href='/welcome/1'>شروعات</a> سے دوبارہ شروع کریں۔</p>"
		}
	}
	ui:      {
		'site_title':       'V کا ٹور'
		'toc':              'فہرست مضامین'
		'toggle_theme':     'تھیم تبدیل کریں'
		'language':         'زبان'
		'run':              'چلائیں'
		'format':           'فارمیٹ'
		'reset':            'ری سیٹ'
		'solution':         'حل'
		'output':           'آؤٹ پٹ'
		'help':             'کی بورڈ شارٹ کٹس'
		'help_close':       'بند کریں'
		'run_program':      'پروگرام چلائیں'
		'next_page':        'اگلا صفحہ'
		'prev_page':        'پچھلا صفحہ'
		'toggle_help':      'یہ مدد کھولیں یا بند کریں'
		'move_panes':       'پینلز کے درمیان منتقل ہوں'
		'previous':         'پچھلا'
		'next':             'اگلا'
		'resize_panes':     'پینلز کا سائز تبدیل کریں'
		'page_of':          '\${number} / \${total}'
		'no_program':       'سینڈ باکس میں کوئی ٹیسٹ پروگرام نہیں تھا۔'
		'compile_failed':   'پروگرام کمپائل نہیں ہوا۔'
		'could_not_reach':  'سرور تک پہنچ نہیں سکے: '
		'could_not_format': 'اس پروگرام کو فارمیٹ نہیں کیا جا سکا۔'
		'sandbox_busy':     'سینڈ باکس مصروف ہے۔ دوبارہ کوشش کریں۔'
		'too_large':        'یہ درخواست بہت بڑی ہے۔'
		'no_compiler':      'سینڈ باکس میں کوئی کمپائلر دستیاب نہیں ہے۔'
		'link_counterpart': 'یہ صفحہ \${language} میں پڑھیں'
		'lang_other':       'دیگر زبانیں'
	}
}
