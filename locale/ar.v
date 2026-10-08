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
		'welcome/1':      PageText{
			title: 'مرحبا، العالم'
			body:  "<p>مرحبا بك في جولة عبر <a href='https://vlang.io'>لغة البرمجة V</a>.</p>
<p>الجولة مقسمة إلى وحدات. يمكنك الوصول إليها من <a href='/list'>جدول المحتويات</a> أو من زر القائمة في الزاوية العلوية اليمنى.</p>
<p>طوال الجولة ستجد شرائح وتمارين. تنقل باستخدام روابط <b>السابق</b> و <b>التالي</b> أسفل النص، أو بمفاتيح <code>PageUp</code> و <code>PageDown</code>.</p>
<p>الجولة تفاعلية. اضغط <b>تشغيل</b> (أو <code>Shift</code>+<code>Enter</code>) لتجميع وتشغيل البرنامج. تظهر النتيجة أسفل الكود.</p>
<p>هذه البرامج هي نقاط انطلاق لتجاربك الخاصة. حرر البرنامج وشغله مرة أخرى.</p>"
		}
		'welcome/2':      PageText{
			title: 'استخدام هذه الجولة'
			body:  '<p>كل صفحة تحتوي على عمود نص على اليسار وعمود كود على اليمين. بينهما مقبض تغيير الحجم: اسحبه لإعطاء الكود مساحة أكبر.</p>'
		}
		'welcome/3':      PageText{
			title: 'V دون اتصال (اختياري)'
			body:  '<p>لا تحتاج إلى تثبيت V محليا لاستخدام هذه الجولة، لكن ينصح بذلك.</p>'
		}
		'welcome/4':      PageText{
			title: 'الصندوق الرملي'
			body:  '<p>برامجك تعمل في صندوق رملي على الخادم.</p>'
		}
		'welcome/5':      PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت أول وحدة في الجولة!</p>
<p>عد إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو تابع مباشرة مع <a href='/basics/1'>أساسيات اللغة</a>.</p>"
		}
		'basics/1':       PageText{
			title: 'الوحدات'
			body:  "<h2>الوحدات</h2>
<p>كل ملف V يعلن عن <em>الوحدة</em> التي ينتمي إليها. الإعلان هو أول شيء في الملف.</p>
<p>يبدأ البرنامج في الوحدة المسماة <code>main</code>، في دالة مسماة <code>main</code>.</p>
<p>يستخدم هذا البرنامج وحدتي المكتبة القياسية <code>math</code> و <code>strings</code>.</p>
<p>في V هناك وحدة لكل دليل، واسم الوحدة يطابق دليلها. لا يظهر الرمز خارج وحدته إلا إذا كان موسوما بـ <code>pub</code>.</p>"
		}
		'basics/2':       PageText{
			title: 'الاستيراد'
			body:  "<h2>الاستيراد</h2>
<p>الوحدة المستوردة تجلب أسماءها المصدرة إلى الملف الحالي.</p>
<p>تستورد المكتبة القياسية باسم الوحدة: <code>import math</code>، <code>import strings</code>. وتستورد مكتبات الطرف الثالث بالطريقة نفسها.</p>
<p>ليست كل عملية في الوحدة مكتوبة كاستدعاء دالة. بعضها _طرق_ على القيمة، لذلك <code>s.to_upper()</code> يعمل على نص دون أي استيراد.</p>
<p>يظهر الأسلوبان في جميع أنحاء المكتبة القياسية، لذلك يجدر قراءة التوقيع بدلا من التخمين.</p>"
		}
		'basics/3':       PageText{
			title: 'المتغيرات'
			body:  "<h2>المتغيرات</h2>
<p>شغل الشيفرة. لاحظ رسالة الخطأ.</p>
<p>تعلن متغيرات V بـ <code>:=</code>. وخلافا لمعظم اللغات، المتغير في V <em>ثابت افتراضيا</em>، ويجب طلب القابلية للتغيير صراحة.</p>
<p>المترجم يقول ذلك. السطر 6 يحاول الإسناد إلى <code>sum</code> دون طلب إذن.</p>
<p>لإصلاح الخطأ، أضف <code>mut</code> إلى إعلان السطر 4 وحاول مجددا.</p>"
		}
		'basics/4':       PageText{
			title: 'المتغيرات القابلة للتغيير'
			body:  "<h2>المتغيرات القابلة للتغيير</h2>
<p>لإعلان متغير قابل للتغيير، أضف الكلمة المفتاحية <code>mut</code> قبل الاسم.</p>
<p>يطلب V ذلك لأن التغيير شيء يجب أن يراد. المتغير الذي لا يعاد إسناده أبدا أسهل على المترجم في الاستدلال، وأسهل عليك عندما تعود إلى الشيفرة لاحقا.</p>
<p>أزل <code>mut</code> وشغله مجددا. هذا هو خطأ الصفحة السابقة.</p>
<p>سترى <code>mut</code> في كل مكان في V، بما في ذلك معاملات الدوال وحقول البنى.</p>"
		}
		'basics/5':       PageText{
			title: 'التصريحات المختصرة'
			body:  "<h2>التصريحات المختصرة</h2>
<p><code>:=</code> تعلن متغيرا وتستنتج نوعه من القيمة.</p>
<p>عندما لا يكون النوع واضحا، أو عندما تريد التحديد، سمه مباشرة بتحويل مثل <code>i64(42)</code> أو <code>f64(1.5)</code>.</p>
<p>لا توجد صيغة منفصلة «صرح الآن، أسند لاحقا». لمتغير V قيمة دائما عند النقطة التي يدخل فيها النطاق، لذلك القيم الصفرية التي ستراها في صفحة لاحقة ينتجها المترجم لا أنت.</p>"
		}
		'basics/6':       PageText{
			title: 'الدوال'
			body:  "<h2>الدوال</h2>
<p>تعلن الدوال بـ <code>fn</code>.</p>
<p>قد تأخذ الدالة صفر معاملات أو أكثر. تكتب المعاملات باسم ونوع، والمعاملات المتتالية من النوع نفسه تكتب <code>x, y int</code>.</p>
<p>تسمى نتيجة الدالة بعد قائمة المعاملات. دوال V ترجع قيمة واحدة بالضبط، ما لم يكن نوع الإرجاع tuple.</p>
<p>الدالة التي جسمها تعبير واحد يمكن كتابتها في سطر واحد: <code>fn double(x int) int { return x * 2 }</code></p>"
		}
		'basics/7':       PageText{
			title: 'نتائج متعددة'
			body:  "<h2>نتائج متعددة</h2>
<p>يمكن للدالة أن ترجع أكثر من قيمة. اكتب نوع الإرجاع كـ tuple:</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>يفكك المستدعي النتيجة في متغيرات:</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>نوع الإرجاع يسرد ببساطة كل قيمة، والمستدعي يفككها في متغيرات. القيمة التي لا يحتاجها المستدعي تُتجاهل بـ <code>_</code>.</p>
<p>هذا هو الشكل الذي ستراه لكل ما يمكن أن يفشل، وهو مغطى في وحدة لاحقة.</p>"
		}
		'basics/8':       PageText{
			title: 'الأنواع الأساسية'
			body:  "<h2>الأنواع الأساسية</h2>
<p>القيم المنطقية هي <code>true</code> و <code>false</code>.</p>
<p>تأتي الأعداد الصحيحة بأحجام ثابتة، <code>i8</code>، <code>i16</code>، <code>i32</code> و <code>i64</code>، والأحجام غير الموقعة من <code>u8</code> إلى <code>u64</code>. أما <code>int</code> نفسه فهو 32 بت، و <code>isize</code> هو عرض المنصة، فسم <code>i32</code> أو <code>i64</code> عندما يهم العرض.</p>
<p>أنواع الفاصلة العائمة هي <code>f32</code> و <code>f64</code>.</p>
<p>الـ <code>rune</code> يحمل نقطة شيفرة Unicode.</p>
<p>النصوص غير قابلة للتغيير وتكتب بين علامتي اقتباس مفردتين.</p>"
		}
		'basics/9':       PageText{
			title: 'القيم الصفرية'
			body:  "<h2>القيم الصفرية</h2>
<p>لكل نوع <em>قيمة صفرية</em>، وهي ما يحمله المتغير قبل أي إسناد.</p>
<p>القيمة الصفرية هي <code>0</code> للأعداد، و <code>false</code> للمنطقيات، والنص الفارغ للنصوص، والمجموعة الفارغة للمصفوفات والشرائح والخرائط.</p>
<p>للبنية، القيمة الصفرية هي البنية مع كل حقولها على قيمها الصفرية.</p>
<p>بما أن V يتطلب قيمة عند نقطة الإعلان، فنادرا ما تكتبها بنفسك. المترجم ينتجها لك، لذلك المثال يترجم مع أن الطرفين الأيمنين يبدوان زائدين.</p>"
		}
		'basics/10':      PageText{
			title: 'الثوابت'
			body:  "<h2>الثوابت</h2>
<p>الـ <code>const</code> قيمة يعرفها المترجم أثناء بناء برنامجك، لذلك يجب أن تكون تعبيرا ثابتا.</p>
<p>تكتب الثوابت بـ <code>const</code>، واحدا واحدا أو كمجموعة بين قوسين.</p>
<p>وخلافا لـ <code>final</code> في بعض اللغات، إعادة استخدام اسم <code>const</code> لمتغير يعطي تحذير مترجم فقط. عامل ذلك التحذير كخطأ: إذا كان الاسم ثابتا، فيجب أن يبقى ثابتا في كل مكان.</p>"
		}
		'basics/11':      PageText{
			title: 'تحويلات النوع'
			body:  "<h2>تحويلات النوع</h2>
<p>لا يحول V أي نوع ضمنيا أبدا. الانتقال من واحد إلى آخر مكتوب دائما:</p>
<pre><code>fl := f64(i)</code></pre>
<p>بعض التحويلات تفقد معلومات وبعضها مرفوض تماما، لذلك سيخبرك المترجم عندما لا يكون للتحويل معنى.</p>
<p>النصوص ليست أعدادا. لقراءة واحد كعدد، حوله، وتذكر أن النتيجة قد تكون القيمة الصفرية إذا لم يتحلل النص.</p>
<p>يمكنك أيضا سؤال المترجم عن اسم نوع بـ <code>typeof(x).name</code>.</p>"
		}
		'basics/12':      PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/controlflow/1'>تدفق التحكم</a>.</p>"
		}
		'basics/13':      PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/controlflow/1'>تدفق التحكم</a>.</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  "<h2>For</h2>
<p>لدى V كلمة حلقة واحدة، وتأتي في ثلاثة أشكال.</p>
<p>الشكل المعدود يبدو مثل C:</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>الشرط وحده حلقة while، ولا شرط أبدا يدور إلى الأبد.</p>
<p><code>break</code> يخرج من الحلقة و <code>continue</code> يتخطى إلى التكرار التالي.</p>
<p>حاول تغيير الحلقة لتعد تنازليا من 5 بدلا من التصاعدي إلى 3، وشغلها مجددا.</p>"
		}
		'controlflow/2':  PageText{
			title: 'For هو "while" في V'
			body:  "<h2>For هو «while» في V</h2>
<p><code>for</code> بشرط واحد يستمر حتى يصبح ذلك الشرط خاطئا.</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p><code>for</code> دون أي شرط <em>حلقة لا نهائية</em>:</p>
<pre><code>for {</code></pre>
<p>المثال يخرج من الحلقة الثانية بعد ثلاثة تكرارات. إذا حذفت <code>if</code> و <code>break</code>، فسيوقف الصندوق البرنامج عندما ينفد وقت المعالج.</p>"
		}
		'controlflow/3':  PageText{
			title: 'For متابعة'
			body:  "<h2>For متابعة</h2>
<p>التكرار على مجموعة يستخدم <code>in</code> بدلا من فهرس. هذا هو الشكل الذي ينبغي الوصول إليه افتراضيا، لأنه لا يمكن أن يخرج عن الحدود.</p>
<pre><code>for i, v in items {</code></pre>
<p>استخدم <code>_</code> لتجاهل الفهرس:</p>
<pre><code>for _, v in items {</code></pre>
<p>للتكرار عددا معلوما من المرات، استخدم مدى: <code>for i in 0 .. n</code>. لاحظ أن <code>..</code> استثنائي: يعمل <code>n</code> مرات، من <code>0</code> إلى <code>n-1</code>.</p>
<p>الخرائط تعطي المفتاح والقيمة.</p>"
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  "<h2>If</h2>
<p>تكتب <code>if</code> هكذا:</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>لا شرط حول الأقواس، ولا كلمة <code>then</code> المفتاحية.</p>
<p>لأن <code>if</code> تعبير يمكن أن يرجع قيمة، فالنمط أعلاه اصطلاحي: عالج الحالة المثيرة وارجع مبكرا، ثم انتقل إلى العادية.</p>
<p>استخدم <code>else if</code> لسلسلة اختبارات. يأخذ V كل فرع كما هو، فراجع السلسلة بنفسك: الفرع الذي لا يمكن أن يكون اختباره صحيحا أبدا ببساطة لا يعمل أبدا، ولن يشير إليه المترجم.</p>"
		}
		'controlflow/5':  PageText{
			title: 'If مع قيمة مفككة'
			body:  "<h2>If مع قيمة مفككة</h2>
<p>يمكن لدالة V أن ترجع قيمة <em>أو</em> خطأ. يكتب نوع الإرجاع مع <code>!</code> قبله:</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>داخل الجسم، <code>return</code> قيمة عادية ويلفها V لك. للفشل، أرجع <code>error(...)</code> بدلا من ذلك.</p>
<p>في موقع الاستدعاء، يمكن لـ <code>if</code> فك النتيجة. القيمة الناجحة تربط بـ <code>v</code>، وإذا كان هناك خطأ، يعمل فرع <code>else</code> مع الخطأ المربوط بـ <code>err</code>:</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>شغله مرتين. الاستدعاء الأول ينجح والثاني لا، وكلاهما يأخذ الفرع المتوقع.</p>
<p>هكذا يعالج معظم كود V ما يمكن أن يسوء. <a href='/optionresult/1'>الوحدة التالية</a> تغطي ذلك كما يجب.</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  "<h2>Match</h2>
<p>لا توجد في V كلمة <code>switch</code> المفتاحية. توجد <code>match</code> التي تغطي حالات أكثر من switch المعتاد.</p>
<p>طابق قيمة:</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>طابق مدى. المدى في <code>match</code> <em>شامل</em> من الطرفين، وهو عكس <code>..</code> الذي تستخدمه في <code>for</code>:</p>
<pre><code>1 ... 3 { }</code></pre>
<p>طابق enum. كل قيمة تحتاج فرعا، أو يحتاج <code>match</code> إلى <code>else</code>، فلا يمكن إضافة قيمة دون أن يشير المترجم إلى كل <code>match</code> يحتاج تحديثا.</p>"
		}
		'controlflow/7':  PageText{
			title: 'Match وأنواع الجمع'
			body:  "<h2>Match وأنواع الجمع</h2>
<p>يعلن <em>نوع الجمع</em> بـ <code>=</code> وقائمة بدائل:</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>قيمة ذلك النوع هي بالضبط أحد البدائل، وليست أكثر من واحد أبدا.</p>
<p>مطابقتها تقول أيها. داخل الفرع، يتحول المتغير الأصلي <em>تحويلا ذكيا</em> إلى ذلك البديل، فحقوله متاحة مباشرة دون أي تحويل.</p>
<p>كل بديل يحتاج فرعا، أو يحتاج match إلى <code>else</code>. المترجم يفرض ذلك، فلا يمكن تجاهل بديل جديد بصمت.</p>
<p>حاول إضافة شكل رابع إلى نوع الجمع وشغله. سيخبرك المترجم بالضبط عن عبارات <code>match</code> التي فاتتك.</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  "<h2>Defer</h2>
<p>يجدول <code>defer</code> عبارة لتعمل عندما يخرج الكتلة المحيطة.</p>
<p>يعمل أيا كانت طريقة خروج الكتلة: بالوصول إلى النهاية، أو بـ <code>return</code> مبكر، أو أثناء التفكك من panic. وهذا ما يجعله مفيدا للتنظيف.</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>في المثال، <code>with_defer</code> يشغل جسمه، ثم العبارة المؤجلة. <code>early_return</code> يرجع في المنتصف، والعبارة المؤجلة تعمل مع ذلك.</p>"
		}
		'controlflow/9':  PageText{
			title: 'تمرين: الحلقات والدوال'
			body:  "<h2>تمرين: الحلقات والدوال</h2>
<p>اكتب <code>sum_to</code> ليرجع مجموع الأعداد من <code>0</code> إلى <code>n</code>، و <code>sum_squares</code> ليرجع مجموع مربعاتها.</p>
<p>افعل ذلك مرتين: مرة بأكثر الطرق مباشرة، ومرة بحلقة <code>for</code> صريحة.</p>
<p>ثم أعد كتابة الاثنين ليعملا في زمن <em>O(1)</em>.</p>
<p>اضغط <b>Solution</b> عندما تجرب، أو عندما تعلق.</p>"
		}
		'controlflow/10': PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>عد إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو تابع مع <a href='/moretypes/1'>المزيد من الأنواع</a>.</p>"
		}
		'moretypes/1':    PageText{
			title: 'البنى'
			body:  "<h2>البنى</h2>
<p>تجمع <em>البنية</em> القيم تحت اسم واحد. إنها طريقة V لقول «هذه تنتمي معا».</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>تصنع القيمة بـ <code>Point{ x: 3, y: 4 }</code>، وتقرأ الحقول بـ <code>p.x</code>.</p>
<p>شيئان يستحقان الملاحظة.</p>
<p>أولا، البنية يمكن أن تطبع نفسها، لذلك <code>println(p)</code> يعرض كل حقل دون عمل إضافي.</p>
<p>ثانيا، القابلية للتغيير تعمل كما للمتغيرات العادية. المتغير يحتاج <code>mut</code>:</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>ويجب أن يعلن الحقل نفسه تحت <code>mut</code> في البنية:</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p>الحقل الذي ليس تحت <code>mut</code> لا يمكن إسناده أبدا. وما زال يمكن قراءته وتمريره ونسخه.</p>
<p>حاول إزالة <code>mut:</code> من البنية وتشغيل المثال. سيشير المترجم إلى السطر الذي يسند إلى <code>x</code>.</p>"
		}
		'moretypes/2':    PageText{
			title: 'المصفوفات'
			body:  "<h2>المصفوفات</h2>
<p>للمصفوفة طول ثابت، ونوع عنصرها يأتي من عنصرها الأول:</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>يمكن أيضا صنع مصفوفة بطول وقيمة ابتدائية:</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>تفهرس المصفوفات بـ <code>[]</code> وتحمل طولها:</p>
<pre><code>println(numbers.len)</code></pre>
<p>عندما يجب ألا تتشارك قيمتان محتواهما، اطلب نسخة صريحة بـ <code>clone</code>:</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>الجأ إليه كلما مررت مجموعة إلى ما لا تريد أن يقدر على تغييرها، لأنه يقول ذلك عند نقطة الاستخدام بدلا من الاعتماد على قاعدة يجب تذكرها.</p>
<p>التحويلات المعتادة طرق لا دوال حرة:</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> تعني العنصر الحالي.</p>"
		}
		'moretypes/3':    PageText{
			title: 'المقاطع'
			body:  "<h2>المقاطع</h2>
<p>المقطع نظرة على مدى من مصفوفة أو مقطع آخر، مكتوب بنفس صيغة <code>[]</code>:</p>
<pre><code>part := arr[1..3]</code></pre>
<p>يمكن أيضا بناء المقاطع من لا شيء وتنميتها. التنمية قد تنقل البيانات، لذلك يجب أن يكون المتغير <code>mut</code>:</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> يضيف. يعمل على أي مقطع، وعلى المصفوفة ثابتة الحجم يكون خطأ مترجم بدلا من مفاجأة وقت التشغيل.</p>
<p>تقطيع مقطع آخر يعطي مقطعا منه. كما مع المصفوفات، <code>clone</code> عندما تحتاج نسخة مستقلة:</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>لاحظ أن المدى <em>استثنائي</em>: <code>0 .. n</code> يعمل <code>n</code> مرات، وهذه الصيغة الوحيدة التي تعمل في حلقة <code>for</code>. المدى داخل <code>match</code> يكتب <code>...</code> وهو شامل من الطرفين.</p>"
		}
		'moretypes/4':    PageText{
			title: 'الخرائط'
			body:  "<h2>الخرائط</h2>
<p>تمسك الخريطة أزواج المفتاح والقيمة، وتكتب حرفيا:</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>يستنتج نوع القيمة. إضافة مفتاح، والسؤال عما إذا كان موجودا:</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>البحث عن مفتاح غائب يعطي <em>القيمة الصفرية</em>، لذلك البحث حيث يجب التمييز بين الغياب والصفر يستخدم <code>or</code>:</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>التكرار يعطي المفتاح والقيمة:</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>الخرائط أنواع مرجعية، لذلك الإسناد العادي سيترك اسمين لخريطة واحدة. <code>clone</code> هو كيفية الحصول على واحدة مستقلة:</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p>دون <code>clone</code> سيخبرك المترجم أن الخريطة لا يمكن نسخها، ويطلب الاختيار بين <code>move</code> أو <code>clone</code> أو مرجع. ذلك السؤال هو النقطة: مشاركة خريطة بالخطأ سهلة، لذلك يجعلك V تقول أيهما قصدت.</p>"
		}
		'moretypes/5':    PageText{
			title: 'النصوص'
			body:  "<h2>النصوص</h2>
<p>نص V تسلسل بايتات، ولهذا نتيجة فورية واحدة: الفهرسة تعطي بايت، و <code>.len</code> يعد البايتات.</p>
<pre><code>println(s[0])</code></pre>
<p>هذا صحيح تماما لـ ASCII وخاطئ لأي شيء آخر، لذلك توجد <code>.runes()</code>. إنها تمشي الأحرف بدلا من ذلك:</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>النصوص غير قابلة للتغيير، لذلك كل طريقة عليها ترجع نصا جديدا:</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>هذه طرق لا دوال في وحدة، فلا شيء لاستيراده لها. بعض العمليات تعيش في <code>strings</code>، خصوصا الباني:</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>استخدم بانيا بدلا من <code>+</code> المتكرر عندما تبني نصا طويلا في حلقة.</p>"
		}
		'moretypes/6':    PageText{
			title: 'الدوال'
			body:  "<h2>الدوال</h2>
<p>الدالة دالة مع <em>مستلم</em>: القيمة التي تستدعى عليها.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>يأتي نوع المستلم قبل اسم الدالة، وتستدعى الدالة بعد ذلك كـ <code>p.sum()</code>.</p>
<p>المستلم دون <code>&amp;</code> <em>نسخة</em>، لذلك لا تقدر الدالة على تغيير الأصل. للكتابة من خلاله، أعلن المستلم مرجعا واجعله <code>mut</code>:</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>هذا التمييز هو كل قصة الدوال في V، وهو نفس التمييز الذي قابلته مع القيم العادية: الإسناد يعطي قيمة، والمرجع شيء يطلب بالاسم.</p>
<p>الجأ لمستلم القيمة ما لم تحتج الدالة حقا إلى تعديل المستلم. الدالة التي تقرأ فقط يجب ألا تقدر.</p>"
		}
		'moretypes/7':    PageText{
			title: 'تمرين: عد الكلمات'
			body:  "<h2>تمرين: عد الكلمات</h2>
<p>نفذ <code>word_count</code> ليعد كم مرة تظهر كل كلمة في نص.</p>
<p>تفصل الكلمات بكل ما ليس حرفا، ويجب ألا يعتمد العد على حالة الأحرف. استخدم <code>map[string]int</code>.</p>
<p>عندما يعمل، اجعل المخرجات مرتبة بدلا من أي ترتيب تمشيه الخريطة.</p>
<p>اضغط <b>Solution</b> عندما تجرب، أو عندما تعلق.</p>"
		}
		'moretypes/8':    PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/optionresult/1'>معالجة الغياب والفشل</a>.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>يميز V بين حالتين تخلطهما لغات كثيرة، ويعطي كلا منهما نوعه.</p>
<p><code>?T</code> قيمة أو <em>none</em>. وهو للحالة حيث لا شيء ليرجع ولم يسؤ شيء: بحث لم يجد شيئا، وتنقيب نفد مرشحوه.</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>يفك option بـ <code>or</code> الذي يعطي قيمة لحالة none:</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>أو بـ <code>if</code> الذي يشغل فرعا آخر بدلا من ذلك:</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>يرتبط المتغير فقط في الفرع حيث توجد قيمة. في فرع <code>else</code> كان الoption هو <code>none</code>.</p>
<p>تتركب options دون مراسم. الدالة التي ترجع <code>?int</code> يمكن أن ترجع option دالة أخرى مباشرة:</p>
<pre><code>n := name?.len</code></pre>
<p>ذلك <code>?</code> يعني «إذا كان none، أرجع none من هذه الدالة أيضا». إنه الفرق بين نشر قيمة واختراع افتراضي، ولهذا لا يحتاج الجسم أعلاه إلى فك أصلا.</p>
<p>طباعة option تظهر أي النصفين لديك، لذلك <code>Option(3)</code> و <code>Option(none)</code> يصفان نفسيهما بينما تكتشف ما الذي ساء.</p>"
		}
		'optionresult/2': PageText{
			title: 'Result والأخطاء'
			body:  "<h2>Result والأخطاء</h2>
<p>الoption يقول لا شيء هناك. أما <code>!T</code> فيقول شيئا <em>فشل</em>، ويحمل رسالة عن الكيفية.</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>إرجاع قيمة عادية لا يحتاج فكا؛ يلفها V. إرجاع <code>error(...)</code> يصنع الفشل. هذا هو العقد كله.</p>
<p>موقع الاستدعاء بنفس شكل option، ويربط <code>err</code> في فرع <code>else</code>:</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p>يعطي <code>err.msg()</code> الرسالة وحدها، دون أي شيء ربما أضافه نوع الخطأ حولها. وتستخدم الصيغتان في المثال.</p>
<p>يعمل الانتشار كما يعمل للoptions. لاحظ <code>!</code> على كل استدعاء في <code>parse_pair</code>: أي نصف يفشل يفشل الكل، والرسالة تسافر معه.</p>
<p>تتبع المكتبة القياسية هذه الاتفاقية في كل مكان، لذلك يستطيع <code>json2.decode</code> أن يخبر أين ساء JSON لديك:</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>فقاعدة الاختيار بينهما قصيرة. إذا لم يوجد شيء، option. وإذا جرب شيء ولم ينجح، result. وعندما يجب على دالة تمرير فشل لم تسببه، انشره بـ <code>?</code> أو <code>!</code> بدلا من تسطيحه إلى افتراضي.</p>"
		}
		'optionresult/3': PageText{
			title: 'تمرين: Options'
			body:  "<h2>تمرين: Options</h2>
<p>اكتب أربع دوال، كل منها يرجع option.</p>
<p><code>second_largest</code> ترجع ثاني أكبر قيمة <em>متميزة</em> في شريحة، أو none عندما لا توجد. الأكبر المكرر لا يحسب، لذلك <code>[5, 5]</code> ليس لها ثاني أكبر.</p>
<p><code>first_word</code> ترجع أول كلمة في نص، أو none للفارغ.</p>
<p><code>sum_all</code> تأخذ شريحة options وترجع int، متخطية ما كان none منها.</p>
<p>ثم <code>describe_all</code> التي تلخص المدخل. اكتبها بانتشار <code>?</code> بحيث لا تحتوي أي فك.</p>
<p>اضغط <b>Solution</b> عندما تجرب، أو عندما تعلق.</p>"
		}
		'optionresult/4': PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/methods/1'>الدوال والواجهات</a>.</p>"
		}
		'methods/1':      PageText{
			title: 'الواجهات'
			body:  "<h2>الواجهات</h2>
<p>لا توجد أصناف في V. بنية بطرق هي كل شيء، وهو لكل معظم البرامج كل ما تحتاج.</p>
<p><em>الواجهة</em> قائمة طرق. النوع ينفذها ببساطة بامتلاكها: لا كلمة مفتاحية تكتب ولا شيء يعلن.</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p>عندما يمتلك <code>Dog</code> و <code>Cat</code> طريقة <code>speak</code>، يمكن تمرير أي منهما حيث يراد <code>Speaker</code>:</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>لأن التنفيذ ضمني، تظل الواجهة تعمل عندما يضاف نوع لاحقا. المتحدث الثالث لا يحتاج تغييرا في <code>announce</code> ولا في الواجهة.</p>
<p>شريحة الواجهة عادة ما تريد بدلا من شريحة نوع ملموس واحد:</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>قاعدتان تستحقان التمسك. أبق الواجهات صغيرة: طريقة أو طريقتان علامة أن التجريد حقيقي، حيث خمس عادة تعني أنك نسخت نوعا ملموسا. وأعلن الواجهة حيث <em>تستخدم</em>، لا بجانب التنفيذ. لا يتطلب V أيا منهما، لكن القارئ سيبحث عن الواجهة في الدالة التي تستهلكها.</p>"
		}
		'methods/2':      PageText{
			title: 'التضمين'
			body:  "<h2>التضمين</h2>
<p>يمكن للبنية أن تضمن بنية أخرى، مكتوبة كاسم نوع مجرد:</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>تصبح حقول البنية المضمنة حقول الخارجية، وتأتي طرقها معها. <code>u.id</code> و <code>u.name</code> كلاهما مجرد حقلي <code>User</code>، و <code>u.describe()</code> هي الطريقة التي جاءت من <code>Base</code>.</p>
<p>هكذا يكتب الحقل المشترك والطريقة المشتركة مرة واحدة. تضمين <em>واجهة</em> يعمل أيضا، وهكذا يستبدل النوع سلوكا بحقل.</p>
<p>هناك قاعدة تفاجئ الناس، وتستحق أن تعرف بالطريقة الصعبة. البنية المضمنة ترث أعضاء النوع الخارجي، لكنها <em>لا</em> تنال الوصول إلى طرق النوع الخارجي نفسه. فطريقة على <code>Base</code> لا تقدر أن تستدعي <code>area()</code> عندما تكون <code>area()</code> للبنية التي تضمنها.</p>
<p>عندما تحتاج دالة تعمل عبر عدة أنواع، خذ الواجهة معاملا بدلا من ذلك:</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>التضمين لمشاركة الحالة والسلوك بين النوع وأجزائه. والواجهات للكتابة مرة عن عدة أنواع غير مترابطة. تجيبان عن سؤالين مختلفين ويجدر إبقاؤهما منفصلين.</p>"
		}
		'methods/3':      PageText{
			title: 'الأنواع القابلة للطباعة'
			body:  "<h2>الأنواع القابلة للطباعة</h2>
<p>يطبع V القيمة بطريقة <code>str</code> الخاصة بها بدلا من عكس حقولها، لذلك يتحكم النوع في كيفية ظهوره بتعريف واحدة:</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>منذ ذلك <code>println(t)</code> واستيفاء النص والربط كلها تستخدمها:</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>هذه هي الطريقة التي ستكتبها غالبا، وتستحق الكتابة مبكرا: النوع الذي يطبع نفسه بحس يجعل كل جلسة تنقيح لاحقة أسهل.</p>
<p>هذا يؤثر في الطباعة فقط. حيث تتوقع <code>string</code> في غير ذلك، مرر <code>.str()</code> بنفسك: النوع ذو طريقة <code>str</code> يبقى نوعه نفسه، ولن يحوله المترجم لك.</p>"
		}
		'methods/4':      PageText{
			title: 'تمرين: الأشكال'
			body:  "<h2>تمرين: الأشكال</h2>
<p>أربعة أشياء لتكتب.</p>
<p>أعط <code>Square</code> و <code>Triangle</code> طريقة <code>area</code>، واجعل <code>total_area</code> تجمع شريحة أشكال عبر الواجهة.</p>
<p>ثم اكتب <code>describe(s Shape)</code> التي تبلغ اسم الشكل ومساحته دون معرفة ما هو.</p>
<p>الجزء الأخير فيه فخ، وإيجاده معظم التمرين. ستميل إلى وضع <code>describe</code> على <code>Base</code> ليرثها كل شكل. هذا لا يعمل، وسيخبرك المترجم لماذا.</p>
<p>اضغط <b>Solution</b> عندما تجرب، أو عندما تعلق.</p>"
		}
		'methods/5':      PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/generics/1'>التعميمات</a>.</p>"
		}
		'generics/1':     PageText{
			title: 'الدوال العامة'
			body:  "<h2>الدوال العامة</h2>
<p>يقف معامل النوع مكان نوع، فيمكن لإعلان واحد أن يخدم عائلة كاملة منها. يكتبه V بين قوسين مربعين، وهذه هي قطعة الصياغة الوحيدة الجديرة بالحفظ:</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>الأقواس الزاوية <em>ليست</em> الصياغة هنا. مكتوبا كـ <code>fn max_of&lt;T&gt;(...)</code> فهو خطأ تحليل لا تهجئة مختلفة، وهو أول ما يجب إصابته.</p>
<p>نادرا ما تسمي وسيط النوع. يستنتجه المترجم من الوسائط، ويقرأ المتغير بقدر الحرفي:</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>لا يحتاج معامل النوع إلا حيث لا يقدر المترجم على استنتاجه وحده. في موضع الإرجاع غالبا هو النقطة:</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>ذلك <code>?T</code> يعني بالضبط ما كان في الدرس السابق: قيمة أو none، أيا كان نوع هذا التخصيص.</p>
<p>يكتب رد النداء كنوع دالة، أي <code>fn (T) R</code>. وهذا يجعل نوعي المدخل والمخرج مستقلين، وهو ما يجعل دالة خط أنابيب:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>إعلان واحد، وتخصيص منفصل لكل نوع وسيط يتم تسليمه. لا تغليف ولا محو: <code>apply</code> المستدعاة برد <code>int</code> والمستدعاة برد <code>string</code> دالتان مختلفتان، لذلك يجب كتابة نوع رد النداء بدلا من تخمينه.</p>"
		}
		'generics/2':     PageText{
			title: 'البنى العامة'
			body:  "<h2>البنى العامة</h2>
<p>تأخذ البنية معامل نوع مثل الدالة، وكل حقل يذكره ينتمي إلى التخصيص:</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>فـ <code>Stack[int]</code> تحمل <code>[]int</code> و <code>Stack[string]</code> تحمل <code>[]string</code>، وهما نوعان مختلفان. يجدر التوقف هنا، لأنه يعني أنك لا تقدر أن تضع مكدس <code>int</code> ومكدس <code>string</code> في شريحة واحدة دون محو النوع في مكان ما.</p>
<p>تحمل الطرق المعامل أيضا. <code>mut</code> على المستلم هو ما يتيح للطريقة تغيير البنية، و <code>&amp;</code> يقول إنها تقرأ فقط:</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p><code>?T</code> هو نوع الخيار المعامل بنفس الطريقة، فالأخذ من مكدس فارغ يعطي <code>none</code> بدلا من panic.</p>
<p>معاملان هما الفكرة نفسها مرتين، وهما مستقلان عن بعضهما:</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>ها هو الحد الذي يمسك بالناس، ويجدر الدقة بشأنه، لأن رسالة الخطأ لا تشير إلى الطريقة التي تنظر إليها. <code>A</code> و <code>B</code> لا علاقة بينهما، فلا تحويل يعرض بينهما، والطريقة لا تقدر أن تنقل قيمة من حقل إلى آخر:</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>السبب خاصية الطرق العامة لا الأزواج، ويجدر فهمه لا حفظه. يفحص جسم الطريقة العامة مقابل <em>كل</em> تخصيص مستخدم، فيجب أن يكون صالحا لها جميعا معا. لذلك الطريقة سليمة على <code>Pair[int, int]</code>، حيث يحمل الحقلان نوعا واحدا، وما زالت مرفوضة حالما يستخدمها <code>Pair[string, int]</code>. يسمي الخطأ التخصيص المخالف بدلا من الإعلان:</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>فالقاعدة المتمسك بها أن الطريقة العامة لا تعد إلا بما هو صحيح لكل نوع ستخصص به. قراءة الحقلين مؤهلة دائما، لذلك تعمل <code>describe</code> لكل تخصيص:</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: 'خرائط الأنواع العامة'
			body:  "<h2>خرائط الأنواع العامة</h2>
<p>يمكن للنوع العام أن يكون نوع قيمة خريطة، ويكتب وسيط النوع عند نقطة الاستخدام. والخريطة عندها خريطة عادية من نوع ملموس واحد:</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p><code>Stack</code> المجرد لا يكفي هنا. يجب أن تعرف الخريطة مكدسات <em>ماذا</em> قيمها، وترك الوسيط خطأ لا شيء يستنتجه المترجم لاحقا.</p>
<p>ونتيجة جديرة بالمعرفة: <code>map[string]Stack[int]</code> و <code>map[string]Stack[string]</code> نوعان مختلفان، فالبرنامج الذي يحتاج كليهما يجب أن يقول ذلك بدلا من ترك أحدهما محل الآخر.</p>
<p>الطرق العامة متاحة على القيم التي تسلمها الخريطة، وهو ما يجعل الخريطة مفيدة لا مجرد قانونية:</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>لاحظ <code>_,</code> في حلقة الخريطة. تسمية المفتاح ستكون <code>for team, stack in teams</code>؛ والشرطة السفلية المجردة تقول إن المفتاح غير مطلوب. يجب أن تكون مجردة: شرطة متبوعة باسم مرفوضة، فـ <code>_k</code> لن يجدي.</p>
<p>الخرائط أنواع مرجعية، وهو ما يجعل الكتابة ذات الخطوتين تعمل: <code>teams['red'].push(10)</code> يجد المكدس في الخريطة ويغير البنية نفسها، بدلا من نسخها وفقدان التغيير.</p>"
		}
		'generics/4':     PageText{
			title: 'معاملات نوع متعددة'
			body:  "<h2>معاملات نوع متعددة</h2>
<p>تتكدس معاملات النوع. اثنان على دالة هما عادة نوع المدخل ونوع المخرج، وهو ما يجعل الدالة العامة تخطيطا:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>لا يجب أن يظهر معامل النوع في الجسم. يبدو طريقة لكتابة دالة عديمة الفائدة، وغالبا هذا صحيح تماما: يقيد المعامل التوقيع دون أي تكلفة في موقع الاستدعاء.</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>لا شيء في الجسم يذكر <code>K</code>، فهي نفس الدالة لخريطة بمفاتيح نصوص ولأخرى بمفاتيح أعداد. والـ <code>?V</code> مقصود: الخريطة الفارغة لا أول قيمة لها، فترجع الدالة none بدلا من اختراع واحدة.</p>
<p>الشكل الأكثر ورودا دالة عامة على خريطة، مع رد نداء يقرر ما يفعل بكل قيمة:</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p>يستنتج <code>K</code> و <code>V</code> كلاهما من الخريطة، ويثبت <code>R</code> على <code>int</code> لأن ذلك ما يرجعه رد النداء. حيث لا يجد الاستنتاج ما يعمل عليه، سم الوسائط صراحة: <code>first_map[string, int](m)</code>.</p>
<p>شيء واحد لن يفعله الاستنتاج وهو إنقاذ وسيط غير متوافق. إذا مررت <code>Counter[V]</code> حيث يراد <code>map[K]Counter[V]</code>، فسيسمي الخطأ <code>K</code> غير قابل للاستنتاج بدلا من المشكلة الحقيقية، وهو لقاء أول مربك. تحقق من نوع الوسيط قبل البحث عن عل عام.</p>"
		}
		'generics/5':     PageText{
			title: 'تمرين: التعميمات'
			body:  "<h2>تمرين: التعميمات</h2>
<p>أربعة أشياء لتكتب، وبينها تستخدم كل شكل من هذا الدرس.</p>
<p><code>index_of[T]</code> ترجع موضع قيمة في شريحة، أو -1. تعمل على أي نوع يدعم <code>==</code>.</p>
<p><code>count_matching[T]</code> تعد كم عنصرا يحقق مسندا. المسند رد نداء، لذلك يكتب نوعه <code>fn (T) bool</code>.</p>
<p>ثم <code>Counter[K]</code>، بنية عامة تحمل عدا لكل مفتاح. أعطها <code>add</code> و <code>get</code>، ولاحظ أن <code>K</code> مستخدم داخل نوع عام آخر هنا: خريطة مفتاحها معامل النوع.</p>
<p>أخيرا <code>grand_total[K, V]</code> التي تجمع خريطة عدادات مرجحة برد نداء المفتاح. معاملا نوع، وبنية عامة كنوع قيمة الخريطة.</p>
<p>اضغط <b>Solution</b> عندما تجرب، أو عندما تعلق.</p>"
		}
		'generics/6':     PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس!</p>
<p>يمكنك العودة إلى <a href='/list'>قائمة الوحدات</a> لمعرفة ما تعلمه بعد ذلك، أو المتابعة مع <a href='/concurrency/1'>التزامن</a>.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p>يبدأ <code>spawn</code> خيطا ويعود فورا. يسلم مقبضا، والمقبض هو كيفية انتظار الخيط لاحقا:</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> نفسه لا ينتظر شيئا. البرنامج الذي ينتهي بينما خيط ما زال يعمل يترك ذلك الخيط في منتصف الكتابة، لذلك القاعدة أن كل spawn ينتظر في النهاية.</p>
<p>لمجموعة مهام ثابتة، اجمع المقابض في شريحة. نوع العنصر <code>thread</code>، و <code>wait()</code> على الشريحة يجمعها كلها:</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>عندما يرجع العمال شيئا، تكون الشريحة <code>[]thread int</code> و <code>wait()</code> يسلم النتائج بالترتيب:</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>الترتيب يستحق الدقة. تعود النتائج بترتيب إضافة المقابض، لا بترتيب انتهاء الخيوط، فهذه طريقة لجمع الإجابات لا لفرض ترتيب على العمل. أي خيط يطبع أولا ليس مما يجب أن يعتمد عليه برنامج، والمخرجات المتداخلة في المثال هي النسخة الصادقة من ذلك.</p>"
		}
		'concurrency/2':  PageText{
			title: 'القنوات'
			body:  "<h2>القنوات</h2>
<p>تنقل القناة قيما من نوع واحد من خيط إلى آخر. أنشئها بنوع العنصر وسعة، وأرسل واستقبل بالسهم نفسه:</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>كلا الاتجاهين <code>&lt;-</code>، لأن كليهما يستقبل من الجانب الآخر. لا يوجد <code>ch.recv()</code> ولا <code>ch.pop()</code>: يرفضهما المترجم كدالتين مجهولتين. إذا اعتدت طريقة هنا، فهذا ما يجب نسيانه.</p>
<p><code>chan int{}</code> دون سعة <em>غير مخزن</em>، أي أن القناة لا تمسك شيئا أبدا. لا يمكن أن ينتهي إرسال حتى يقف مستقبل هناك، ولا يمكن أن ينتهي استقبال حتى ينتج مرسل شيئا. كل قيمة مصافحة بين خيطين:</p>
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
<p>اقرأ مخرجات المثال والمصافحة ظاهرة: الإرسالات والاستقبالات تتناوب، وليست في ترتيب ثابت ينبغي الاعتماد عليه. هذه هي نقطة القناة غير المخزنة، لا عيب.</p>
<p>تحمل القناة نوعا واحدا بالضبط، فانتظار نوعين مختلفين من الرسائل يعني قناتين. <code>select</code> لاحقا هو كيفية الانتظار على أكثر من واحدة معا.</p>"
		}
		'concurrency/3':  PageText{
			title: 'القنوات المخزنة مؤقتا'
			body:  "<h2>القنوات المخزنة مؤقتا</h2>
<p>تمنح السعة القناة مكانا، فيستطيع المرسل التقدم بدلا من الانسداد عند كل قيمة:</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>هذا الفرق قابل للقياس. مع المخزن المؤقت، تكتمل كل الإرسالات ويبلغ <code>len()</code> كم قيمة تنتظر. بدونه، يبقى <code>len()</code> صفرا مهما انتظرت، لأنه لا مكان لوضعها:</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>اختر المخزن عندما يجب ألا يعيقه مستهلك بطيء. تثبت السعة عند إنشاء القناة، وقناة مخزنة وقناة غير مخزنة من نفس نوع العنصر نوعان مختلفان.</p>
<p>ها هو فخ يستحق نصف الدقيقة اللازمة لتذكره. الحقل الذي يضبط الحجم هو <code>cap:</code>، وكتابة <code>len:</code> بدلا منه مرفوضة لا متجاهلة بصمت:</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>تسمي الرسالة الحقل المقصود، وهو تقريبا أفضل الممكن. الفخ الآخر ليس إملائيا. التخزين يساعد فقط حتى السعة: مرسل لديه ما يرسله أكثر من المكان ينسد عند أول قيمة لا تتسع. فبأربع خانات وست مهام، دون مستهلك بدأ، ينتظر الإرسال الخامس مستهلكا لا يعمل. إما خزن القائمة كلها أو ابدأ المستهلكين أولا.</p>"
		}
		'concurrency/4':  PageText{
			title: 'الاستقبال حتى الإغلاق'
			body:  "<h2>الاستقبال حتى الإغلاق</h2>
<p><strong>لا يوجد <code>for x in ch</code> في V.</strong> القناة ليست مجموعة، فلا شيء لحلقة for لتفهرسه، ويقول المترجم:</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>إذا جئت من لغة يمكن فيها عبور القناة، فهذا أول ما ستخطئه. استقبل بـ <code>&lt;-ch</code>، ولقراءة قناة حتى النهاية، استقبل حتى تتوقف عن العطاء:</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p>تعطي <code>or</code> القيمة التي تنهي الحلقة، وهذا هو الجزء السهل الخطأ في الاتجاه الآخر: <strong>تعمل <code>or</code> فقط عندما تكون القناة مغلقة وفارغة.</strong> على قناة مفتوحة لا شيء فيها، ما زال <code>&lt;-ch or { -1 }</code> ينسد منتظرا مرسلا. إنه ليس استطلاعا غير حاجب، مهما بدا.</p>
<p>تفصيل عن الإرسالات سيكلفك عصرا إذا لم يذكره أحد. تعبير الإرسال يتوقف عند السهم، فتحتاج القيمة المحسوبة على اليمين أقواسا:</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>بدونها يحاول المترجم ضرب الـ void التي أنتجها <code>ch &lt;- i</code>، ويقول ذلك بطريقة لا تشير إلى السهم بوضوح.</p>
<p>عندما أخبرك المنتج بالعدد، فالحلقة غير ضرورية:</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>لتلك الصيغة الأبسط حافة حادة. <code>&lt;-ch</code> العادي على قناة مغلقة فارغة لا ينسد ولا يذعر: يسلم <em>القيمة الصفرية</em> لنوع العنصر، كل مرة. اطلب قيمة زائدة واحدة واحصل على <code>0</code> صامت، أو نص فارغ، أو بنية صفرية بدلا من خطأ:</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>ففضل <code>or</code> عندما لا يكون العدد مؤكدا، ومد يدك إلى <code>try_pop</code> عندما تريد النظر دون انتظار أبدا:</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: 'الإغلاق'
			body:  "<h2>الإغلاق</h2>
<p>أغلق القناة عندما ينتهي منتجها منها، وأغلقها من المنتج. يملك المنتج القناة كما يملك قرار التوقف:</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>تفصيل يمسك بالناس: <code>close</code> وحده ليس كيف تغلق قناة. مكتوبا كاستدعاء مجرد فهو الدالة المدمجة التي تغلق واصف ملف، ويفشل على قناة برسالة مربكة:</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>الإغلاق لا يرمي ما ما زال مخزنا. تسلم القيم في القناة أولا إلى القارئ، بالترتيب، وفقط عندما تفرغ لا يجد استقبال شيئا. ذلك الترتيب هو ما يجعل close الإشارة المقصود بها.</p>
<p>وما لا يفعله الإغلاق هو جعل الإرسال قانونيا. الإرسال على قناة مغلقة ذعر وقت التشغيل، وكذلك الإغلاق مرتين، فالقاعدة إغلاق واحد لكل قناة من المكان الوحيد الذي يملكها.</p>
<p>والإغلاق ليس انتظارا. الاستقبال من قناة مفتوحة فارغة ما زال ينسد، سواء أغلقها أحد يوما أم لا.</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  "<h2>Select</h2>
<p>ينتظر <code>select</code> على عدة قنوات ويشغل جسم الجاهز منها. هكذا تأخذ أول إجابة بدلا من ترتيب ثابت:</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>الفرع استقبال أو إرسال، فيمكن للاتجاهين التنافس:</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>قيدان يستحقان المعرفة قبل كتابة واحد، وكلاهما مقاس ضد المترجم لا موثق.</p>
<p><strong>أبق الشكلين في select منفصلين.</strong> select يحمل فرع إرسال <em>و</em> فرع استقبال يسقط المترجم تماما بدلا من الإبلاغ عن خطأ، فقرن إرسالا بمهلة أو بإرسال آخر.</p>
<p><strong>يجب أن يسمي الفرع قناة موجودة فعلا.</strong> كتابة القناة مضمنة مرفوضة:</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>والفروع تسند بدلا من أن ترجع، فالمتغير الذي تكتب فيه يجب أن يكون <code>mut</code>. المدة في موضع الفرع مهلة، وواحدة فقط لكل select. هكذا يتوقف الانتظار عن كونه غير محدود:</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> هو الفرع لعندما لا يكون شيء جاهزا، وهو لا ينتظر. هذه هي الصيغة غير الحاجبة:</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>كتعبير يُقيم select إلى <strong>bool</strong>: true عندما عمل فرع قناة، وfalse عندما عمل <code>else</code>. لا يقيم إلى قيمة الفرع، فاقرأ القيمة في الفرع واختبر الـ bool منفصلا.</p>
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
<p>عدم تماثل واحد للاستعداد له. متى أغلقت قناة، صار الاستقبال منها جاهزا دائما، فقناة مغلقة تكسب الـ select كل جولة. في حلقة على عدة قنوات، أفرغ ما يهمك وتحقق من الإغلاق بنفسك بدلا من الاعتماد على select لتجاوزه.</p>"
		}
		'concurrency/7':  PageText{
			title: 'الحالة المشتركة'
			body:  "<h2>الحالة المشتركة</h2>
<p>تنقل القنوات القيم. عندما يجب على الخيوط تغيير <em>نفس</em> القيمة، فذلك عمل القفل.</p>
<p>الجزء غير الواضح هو كيف تصبح الحالة مشتركة. البنية الممررة إلى خيط بالقيمة نسخة، وسيحصل كل خيط على خاصته. الكلمة المفتاحية <code>shared</code> على المعامل هي ما يجعلها واحدة:</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>لاحظ <code>shared t</code> في قائمة المعاملات و <code>spawn add(shared total, i)</code> في موقع الاستدعاء. كلاهما مطلوب. مرر دون الكلمة وسيحصل الخيط على نسخة، فلا يتحرك العداد أبدا.</p>
<p><code>lock</code> كتلة، لا استدعاء، وقوس الإغلاق يحرره. لا توجد عبارة <code>unlock</code> تقابلها، وكتابة واحدة خطأ صياغي. أمسكه أقل ما يمكن: لا عبر spawn، ولا عبر إرسال قناة، ولا حول العمل الفعلي. القفل الممسوك عبر ما يمكن أن ينسد هو كيفية deadlock البرنامج.</p>
<p><code>rlock</code> هو نسخة القراءة، وهو لبنية تقرأ أكثر بكثير مما تكتب:</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p>يجب أيضا قفل متغير <code>shared</code> عند نقطة الاستخدام، فلن يدع المترجم نسيان القفل بالخطأ.</p>
<p>هناك شيء واحد للحذر منه، وهو سبب قراءة المثال قيمة قبل انتظار خيوطه. Spawn لا ينتظر، فقراءة حالة مشتركة بعد spawn مباشرة سباق: القيمة المرئية تعتمد على مدى وصول الخيوط. انتظر الكتاب قبل القراءة، أو اقبل أن الرقم مؤقت.</p>"
		}
		'concurrency/8':  PageText{
			title: 'مجموعات الانتظار'
			body:  "<h2>مجموعات الانتظار</h2>
<p>تعد مجموعة الانتظار العمل الجاري. <code>add</code> قبل الـ spawn، و <code>done</code> داخله، و <code>wait</code> عندما تبدأ كل شيء:</p>
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
<p>خذ المجموعة كـ <code>&amp;sync.WaitGroup</code> لا <code>mut &amp;sync.WaitGroup</code>. المرجع <code>mut</code> يترجم ثم يسقط داخل العداد الذري وقت التشغيل، فالمرجع العادي هو الصيغة للاستخدام.</p>
<p>تحزم <code>wg.go</code> الـ add وبدء الخيط، مما يزيل الخطوة حيث يتباعدان:</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>تأخذ إغلاقا لا استدعاء، والإغلاق في V يجب أن يسمي ما يقرأ. قائمة <code>fn [ch, i] ()</code> هي ذلك الإعلان، وترك متغير خطأ ترجمة يسمي المتغير لا شيئا عن التزامن.</p>
<p>ثلاث قواعد، وهي معظم ما يسوء. كل <code>add</code> يحتاج <code>done</code> مطابقا، و <code>done</code> دون <code>add</code> يذعر. كل spawn يجب أن يحدث قبل <code>wait</code>، لأن ذلك كل ما يراه الـ wait. والخيط الذي يذعر يأخذ العملية كلها معه، فتحتاج الدالة المشغلة عبر spawn <code>defer</code> خاصا بها إذا أمكن أن تفشل في منتصف الطريق.</p>"
		}
		'concurrency/9':  PageText{
			title: 'تمرين: مجموعة عمال'
			body:  "<h2>تمرين: مجموعة عمال</h2>
<p>ابن مجموعة عمال وأطعمها مهام.</p>
<p><code>worker</code> يأخذ مهمة من قناة، يضاعفها، ويرسل النتيجة إلى قناة أخرى. وتعطى مجموعة انتظار ليعرف المجموع متى انتهى.</p>
<p><code>run_all</code> تأخذ شريحة مهام وعدد عمال، وترجع النتائج بترتيب وصولها.</p>
<p>ترتيب العمليات هو التمرين كله، وأربعة أشياء يجب أن تكون صحيحة معا:</p>
<ul>
<li>قناة المهام مغلقة <em>قبل</em> بدء العمال، وإلا قد يبقى عامل منتظرا إغلاقا لم يكن قادما.</li>
<li>كل <code>add</code> يحدث قبل <code>wait</code>، وكل <code>done</code> داخل العامل.</li>
<li>القناتان مخزنتان، حتى لا ينسد عامل أبدا وهو يسلم قيمة.</li>
<li>تجمع النتائج بـ <code>&lt;-results or { break }</code>، إذ لا يوجد <code>for</code> على قناة.</li>
</ul>
<p>اثنان منها هما الـ deadlock الذي يكشفه هذا التمرين عادة: قناة مهام بمكان أقل من قائمة المهام، أو نتائج تقرأ قبل <code>wait</code>.</p>
<p>اضغط <b>Solution</b> عندما تجرب، أو عندما تعلق.</p>"
		}
		'concurrency/10': PageText{
			title: 'تهانينا!'
			body:  "<p>لقد أكملت هذا الدرس، ومعه الجولة بأكملها!</p>
<p>عد إلى <a href='/list'>قائمة الوحدات</a> لإعادة قراءة أي شيء، أو ابدأ من جديد في <a href='/welcome/1'>البداية</a>.</p>"
		}
		'cli/1':          PageText{
			title: 'أوامر يومية'
			body:  "<h2>أوامر يومية</h2>
<p>تعمل ثلاثة أوامر مع كل تغيير تقريبا. <code>v fmt -w .</code> ينسق المشروع، و <code>v vet .</code> يبلغ عن البنى المشبوهة، و <code>v test .</code> يشغل مجموعة الاختبارات:</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>نسق قبل كل commit، حتى لا يجادل المراجع أبدا في التخطيط.</p>
<p><code>v doc strings</code> يعرض توثيق وحدة، و <code>v repl</code> يفتح موجها تفاعليا، و <code>v watch run main.v</code> يعيد البناء والتشغيل كلما تغير ملف مصدر.</p>"
		}
		'vpm/1':          PageText{
			title: 'حزم'
			body:  "<h2>حزم</h2>
<p>تعيش المكتبات في سجل الحزم. ابحث فيه، وافحص نتيجة، وثبتها:</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p>يعرض <code>v list</code> ما يعتمد عليه المشروع. ويبلغ <code>v outdated</code> عن النسخ الأحدث، ويجلبها <code>v update</code>، ويزيل واحدة <code>v remove</code>.</p>
<p>تصل هذه الأوامر إلى الشبكة، لذلك تعمل على جهازك لا في صندوق هذه الجولة.</p>"
		}
		'mcp/1':          PageText{
			title: 'بروتوكول سياق النموذج'
			body:  "<h2>v mcp</h2>
<p>يعرض <code>v mcp serve</code> المترجم نفسه لوكيل الشيفرة: إعلانات ومراجع وتشخيصات عبر المدخلات والمخرجات القياسية:</p>
<pre><code>v mcp serve</code></pre>
<p>يسرد <code>v mcp tools</code> ما هو معروض. اخدم عبر HTTP بدلا من ذلك مع <code>--http</code>، وحل المسارات النسبية مقابل دليل مع <code>--root</code>، ولا تسجل أدوات كتابة ملفات مع <code>--read-only</code>.</p>
<p>يوصل <code>v mcp install</code> الخادم بوكيل، ويزيله <code>v mcp uninstall</code>. هذا السطح جديد، لذلك يحتاج V حديثا لا الإصدار الذي يشغله هذا الصندوق.</p>"
		}
		'skills/1':       PageText{
			title: 'مهارات'
			body:  "<h2>مهارات</h2>
<p>المهارات تعليمات محزمة يحملها الوكيل لمهمة: قواعد اللغة، وحلقة الاختبار، وسطح الأدوات:</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>تثبت المهارات في <code>.agents/skills/</code> في المشروع، أو تحت بيتك مع <code>--global</code>. يعرض <code>v skills path v-tools</code> أين تعيش واحدة، ويبلغ <code>--dry-run</code> دون كتابة شيء.</p>
<p>مثل <code>v mcp</code>، هذا سطح جديد: يحتاج V حديثا.</p>"
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
