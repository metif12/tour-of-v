module locale

// 中文 (Chinese Simplified) translation.

pub const zh = Text{
	modules: {
		'mechanics':    '使用教程'
		'basics':       '基础类型'
		'controlflow':  '控制流'
		'moretypes':    '更多类型'
		'optionresult': 'Option 和 Result'
		'methods':      '方法和接口'
		'generics':     '泛型'
		'concurrency':  '并发'
	}
	lessons: {
		'welcome':      '入门'
		'basics':       '基础类型'
		'controlflow':  '控制流'
		'moretypes':    '更多类型'
		'optionresult': 'Option 和 Result'
		'methods':      '方法和接口'
		'generics':     '泛型'
		'concurrency':  '并发'
	}
	pages:   {
		'welcome/1':      PageText{
			title: '你好，世界'
			body:  "<p>欢迎使用 <a href='https://vlang.io'>V 编程语言</a> 教程。</p>
<p>教程分为多个模块。你可以从<a href='/list'>目录</a>或右上角的菜单按钮访问它们。</p>
<p>教程中包含幻灯片和练习。使用文本下方的<b>上一页</b>和<b>下一页</b>链接，或使用 <code>PageUp</code> 和 <code>PageDown</code> 键进行导航。</p>
<p>教程是交互式的。按<b>运行</b>（或 <code>Shift</code>+<code>Enter</code>）编译并运行程序。结果显示在代码下方。</p>
<p>这些程序是你自己实验的起点。编辑程序并重新运行。</p>"
		}
		'welcome/2':      PageText{
			title: '使用本教程'
			body:  '<p>每页左侧是文本栏，右侧是代码栏。中间有一个拖拽手柄：拖动它可以给代码更多空间。</p>'
		}
		'welcome/3':      PageText{
			title: '离线 V（可选）'
			body:  '<p>使用本教程不需要本地安装 V，但建议安装。</p>'
		}
		'welcome/4':      PageText{
			title: '沙箱'
			body:  '<p>你的程序在服务器的沙箱中运行。</p>'
		}
		'welcome/5':      PageText{
			title: '恭喜！'
			body:  "<p>你已完成教程的第一个模块！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或直接继续<a href='/basics/1'>语言基础</a>。</p>"
		}
		'basics/1':       PageText{
			title: '模块'
			body:  "<h2>模块</h2>
<p>每个 V 文件都要声明它所属的<em>模块</em>。声明是文件的第一件事。</p>
<p>程序从名为 <code>main</code> 的模块、在名为 <code>main</code> 的函数中开始。</p>
<p>这个程序使用了标准库模块 <code>math</code> 和 <code>strings</code>。</p>
<p>V 中每个目录一个模块，模块名与其目录一致。只有被标记为 <code>pub</code> 的符号才能在模块外可见。</p>"
		}
		'basics/2':       PageText{
			title: '导入'
			body:  "<h2>导入</h2>
<p>被导入的模块将其导出的名称带入当前文件。</p>
<p>标准库按模块名导入：<code>import math</code>、<code>import strings</code>。第三方库同样导入。</p>
<p>模块中的操作并非都写成函数调用。有些是值上的_方法_，所以 <code>s.to_upper()</code> 无需任何导入就能在字符串上工作。</p>
<p>两种风格遍布标准库，所以值得读签名而不是猜。</p>"
		}
		'basics/3':       PageText{
			title: '变量'
			body:  "<h2>变量</h2>
<p>运行代码。注意错误信息。</p>
<p>V 变量用 <code>:=</code> 声明。与大多数语言不同，V 中的变量默认<em>不可变</em>，必须显式要求可变性。</p>
<p>编译器也是这么说的。第 6 行试图在未获许可的情况下给 <code>sum</code> 赋值。</p>
<p>要修复错误，在第 4 行的声明中加上 <code>mut</code>，再试一次。</p>"
		}
		'basics/4':       PageText{
			title: '可变变量'
			body:  "<h2>可变变量</h2>
<p>要声明可变变量，在名称前加上关键字 <code>mut</code>。</p>
<p>V 之所以要求这样，是因为改变是必须有意为之的事。从不重新赋值的变量对编译器更容易推理，你以后回头看代码时也更容易。</p>
<p>去掉 <code>mut</code> 再运行一次。这就是上一页的错误。</p>
<p>你会在 V 中到处看到 <code>mut</code>，包括函数参数和结构体字段。</p>"
		}
		'basics/5':       PageText{
			title: '短声明'
			body:  "<h2>短声明</h2>
<p><code>:=</code> 声明变量并从值推断其类型。</p>
<p>当类型不明显，或你想明确时，用<em>转换</em>直接命名，如 <code>i64(42)</code> 或 <code>f64(1.5)</code>。</p>
<p>没有“先声明、后赋值”的单独形式。V 变量在进入作用域时总有值，所以后面页面会见到的零值由编译器产生，而不是由你。</p>"
		}
		'basics/6':       PageText{
			title: '函数'
			body:  "<h2>函数</h2>
<p>函数用 <code>fn</code> 声明。</p>
<p>函数可以带零个或多个参数。参数写名和类型，同类型连续参数写作 <code>x, y int</code>。</p>
<p>函数结果命名在参数列表之后。V 函数恰返回一个值，除非返回类型是元组。</p>
<p>函数体是单个表达式时可写成一行：<code>fn double(x int) int { return x * 2 }</code></p>"
		}
		'basics/7':       PageText{
			title: '多返回值'
			body:  "<h2>多返回值</h2>
<p>函数可以返回多个值。返回类型写作元组：</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>调用者把结果解构到变量：</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>返回类型只是列出每个值，调用者把它们解构到变量。不需要的值用 <code>_</code> 忽略。</p>
<p>这是所有可能失败之事的形状，后面模块会讲。</p>"
		}
		'basics/8':       PageText{
			title: '基础类型'
			body:  "<h2>基础类型</h2>
<p>布尔值是 <code>true</code> 和 <code>false</code>。</p>
<p>整数有固定大小，<code>i8</code>、<code>i16</code>、<code>i32</code> 和 <code>i64</code>，无符号大小从 <code>u8</code> 到 <code>u64</code>。<code>int</code> 本身是 32 位，<code>isize</code> 才是平台宽度，所以宽度重要时命名 <code>i32</code> 或 <code>i64</code>。</p>
<p>浮点类型是 <code>f32</code> 和 <code>f64</code>。</p>
<p><code>rune</code> 容纳一个 Unicode 码点。</p>
<p>字符串不可变，用单引号书写。</p>"
		}
		'basics/9':       PageText{
			title: '零值'
			body:  "<h2>零值</h2>
<p>每种类型都有<em>零值</em>，即变量在任何赋值之前所持有的。</p>
<p>零值对数字是 <code>0</code>，对布尔是 <code>false</code>，对字符串是空串，对数组、切片和映射是空集合。</p>
<p>对结构体，零值是所有字段都为零值的结构体。</p>
<p>V 要求声明点有值，所以你很少自己写它们。编译器替你产生，所以示例能编译，尽管右边看起来多余。</p>"
		}
		'basics/10':      PageText{
			title: '常量'
			body:  "<h2>常量</h2>
<p><code>const</code> 是编译器构建程序时已知的值，所以必须是常量表达式。</p>
<p>常量用 <code>const</code> 书写，逐个或括号分组。</p>
<p>与某些语言的 <code>final</code> 不同，重用 <code>const</code> 名给变量只产生编译器警告。把该警告当错误：名字若是常量，就该处处常量。</p>"
		}
		'basics/11':      PageText{
			title: '类型转换'
			body:  "<h2>类型转换</h2>
<p>V 从不隐式转换类型。从一种到另一种总要写出来：</p>
<pre><code>fl := f64(i)</code></pre>
<p>有些转换丢失信息，有些直接拒绝，所以转换无意义时编译器会告诉你。</p>
<p>字符串不是数字。要把一个当数字读，就转换它，并记住文本解析失败时结果可能是零值。</p>
<p>也可以用 <code>typeof(x).name</code> 问编译器类型的名字。</p>"
		}
		'basics/12':      PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/controlflow/1'>控制流</a>。</p>"
		}
		'basics/13':      PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/controlflow/1'>控制流</a>。</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  "<h2>For</h2>
<p>V 只有一个循环关键字，有三种形式。</p>
<p>计数形式像 C：</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>单独条件是 while 循环，无条件则永远循环。</p>
<p><code>break</code> 跳出循环，<code>continue</code> 跳到下一次迭代。</p>
<p>把循环改成从 5 倒数而不是数到 3，再运行一次。</p>"
		}
		'controlflow/2':  PageText{
			title: 'For 是 V 的 "while"'
			body:  "<h2>For 是 V 的“while”</h2>
<p>带单个条件的 <code>for</code> 会一直跑到条件为假。</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p>没有任何条件的 <code>for</code> 是<em>死循环</em>：</p>
<pre><code>for {</code></pre>
<p>示例在三次迭代后跳出第二个循环。如果删掉 <code>if</code> 和 <code>break</code>，CPU 时间耗尽时沙盒会停掉程序。</p>"
		}
		'controlflow/3':  PageText{
			title: 'For 续'
			body:  "<h2>For 续</h2>
<p>遍历集合用 <code>in</code> 而不用下标。这是默认该用的形式，因为它不会越界。</p>
<pre><code>for i, v in items {</code></pre>
<p>用 <code>_</code> 忽略下标：</p>
<pre><code>for _, v in items {</code></pre>
<p>迭代已知次数用区间：<code>for i in 0 .. n</code>。注意 <code>..</code> 是左闭右开的：跑 <code>n</code> 次，从 <code>0</code> 到 <code>n-1</code>。</p>
<p>映射给出键和值。</p>"
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  "<h2>If</h2>
<p><code>if</code> 这样写：</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>条件没有括号，也没有 <code>then</code> 关键字。</p>
<p><code>if</code> 是能返回值的表达式，所以上面的模式很地道：处理有趣的情况并早返回，再落到平常情况。</p>
<p>测试链用 <code>else if</code>。V 照单全收每个分支，所以链条自己检查：测试永真不了的分支根本不会跑，编译器也不会指出。</p>"
		}
		'controlflow/5':  PageText{
			title: '带解包值的 If'
			body:  "<h2>带解包值的 If</h2>
<p>V 函数可以返回一个值<em>或</em>一个错误。返回类型写在前面的 <code>!</code>：</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>函数体内 <code>return</code> 普通值，V 替你包装。要失败就返回 <code>error(...)</code>。</p>
<p>调用处 <code>if</code> 可以解包结果。成功值绑定到 <code>v</code>，出错则 <code>else</code> 分支运行，错误绑定到 <code>err</code>：</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>运行两次。第一次调用成功第二次不成功，各走预期的分支。</p>
<p>大多数 V 代码就是这样处理可能出错的事。<a href='/optionresult/1'>下一模块</a>会讲透。</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  "<h2>Match</h2>
<p>V 没有 <code>switch</code> 关键字。有 <code>match</code>，覆盖的情况比一般 switch 多。</p>
<p>按值匹配：</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>按区间匹配。<code>match</code> 中的区间两端都<em>包含</em>，正好和 <code>for</code> 里的 <code>..</code> 相反：</p>
<pre><code>1 ... 3 { }</code></pre>
<p>按枚举匹配。每个值都要有分支，否则 <code>match</code> 要有 <code>else</code>，所以加新值时编译器会指出每个要更新的 <code>match</code>。</p>"
		}
		'controlflow/7':  PageText{
			title: 'Match 和和类型'
			body:  "<h2>Match 和和类型</h2>
<p><em>和类型</em>用 <code>=</code> 加备选项列表声明：</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>该类型的值恰是其中之一，绝不多于一个。</p>
<p>匹配即知是哪个。分支内原变量被<em>智能转换</em>到该变体，其字段直接可用，无需转换。</p>
<p>每个备选项都要有分支，否则 match 要有 <code>else</code>。编译器强制执行，所以新备选项不会被悄悄忽略。</p>
<p>给和类型加第四个形状再运行。编译器会准确告诉你漏了哪些 <code>match</code> 语句。</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  "<h2>Defer</h2>
<p><code>defer</code> 安排一条语句在外层块退出时运行。</p>
<p>块怎么退出它都运行：正常结束、提前 <code>return</code>，或从 panic  unwind。它因此适合清理。</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>示例中 <code>with_defer</code> 先跑正文，再跑延迟语句。<code>early_return</code> 中途返回，延迟语句照样运行。</p>"
		}
		'controlflow/9':  PageText{
			title: '练习：循环和函数'
			body:  "<h2>练习：循环和函数</h2>
<p>写 <code>sum_to</code> 返回 <code>0</code> 到 <code>n</code> 的和，写 <code>sum_squares</code> 返回它们平方的和。</p>
<p>做两遍：一遍用最直接的办法，一遍用显式 <code>for</code> 循环。</p>
<p>然后把两个都改写成 <em>O(1)</em> 时间。</p>
<p>试过或卡住就按 <b>Solution</b>。</p>"
		}
		'controlflow/10': PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/moretypes/1'>更多类型</a>。</p>"
		}
		'moretypes/1':    PageText{
			title: '结构体'
			body:  "<h2>结构体</h2>
<p><em>结构体</em>把值归到一个名字下。这是 V 说“它们属于一起”的方式。</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>值用 <code>Point{ x: 3, y: 4 }</code> 构造，字段用 <code>p.x</code> 读取。</p>
<p>两件事值得注意。</p>
<p>第一，结构体能打印自己，所以 <code>println(p)</code> 无需额外工作就展示每个字段。</p>
<p>第二，可变性和普通变量一样。变量需要 <code>mut</code>：</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>字段本身必须在结构体里声明在 <code>mut</code> 之下：</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p>不在 <code>mut</code> 下的字段完全不能赋值。仍可读、可传、可拷贝。</p>
<p>去掉结构体里的 <code>mut:</code> 再运行示例。编译器会指向给 <code>x</code> 赋值的行。</p>"
		}
		'moretypes/2':    PageText{
			title: '数组'
			body:  "<h2>数组</h2>
<p>数组长度固定，元素类型来自第一个元素：</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>数组也可以用长度和初值构造：</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>数组用 <code>[]</code> 下标，并携带长度：</p>
<pre><code>println(numbers.len)</code></pre>
<p>两个值不该共享内容时，用 <code>clone</code> 显式要拷贝：</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>把集合传给不该改它的东西时就用它，因为在使用点说清，而不是依赖要记住的规则。</p>
<p>常用变换是方法而不是自由函数：</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> 指当前元素。</p>"
		}
		'moretypes/3':    PageText{
			title: '切片'
			body:  "<h2>切片</h2>
<p>切片是数组或另一切片某区间的视图，写法同样是 <code>[]</code>：</p>
<pre><code>part := arr[1..3]</code></pre>
<p>切片也可从空构造并增长。增长可能搬运数据，所以变量必须是 <code>mut</code>：</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> 追加。任何切片都行，固定大小数组上则是编译错误而非运行时惊吓。</p>
<p>对切片再切片得到它的切片。和数组一样，需要独立拷贝时 <code>clone</code>：</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>注意区间是<em>左闭右开</em>的：<code>0 .. n</code> 跑 <code>n</code> 次，<code>for</code> 循环只接受这种写法。<code>match</code> 里的区间写作 <code>...</code> 且两端包含。</p>"
		}
		'moretypes/4':    PageText{
			title: '映射'
			body:  "<h2>映射</h2>
<p>映射持有键值对，写作字面量：</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>值类型被推断。加键、问有无：</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>查缺失的键得到<em>零值</em>，所以缺失和零要区分的查找用 <code>or</code>：</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>迭代给出键和值：</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>映射是引用类型，所以朴素赋值会留两个名字给一个映射。<code>clone</code> 是得到独立那个的办法：</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p>没有 <code>clone</code> 编译器会说映射不能拷贝，并要你在 <code>move</code>、<code>clone</code> 或引用之间选。这个问题就是要点：意外共享映射很容易，所以 V 要你说清要哪个。</p>"
		}
		'moretypes/5':    PageText{
			title: '字符串'
			body:  "<h2>字符串</h2>
<p>V 字符串是字节序列，直接后果是：下标给出字节，<code>.len</code> 数字节。</p>
<pre><code>println(s[0])</code></pre>
<p>对 ASCII 完全正确，对其他全错，所以有 <code>.runes()</code>。它改为走字符：</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>字符串不可变，所以它上面的每个方法都返回新字符串：</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>这些是方法而不是模块里的函数，所以无需为它们导入。有些操作住在 <code>strings</code> 里，特别是构造器：</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>循环里拼长字符串时用构造器而不用重复 <code>+</code>。</p>"
		}
		'moretypes/6':    PageText{
			title: '方法'
			body:  "<h2>方法</h2>
<p>方法是带<em>接收者</em>的函数：被调用的那个值。</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>接收者类型写在方法名前，方法之后按 <code>p.sum()</code> 调用。</p>
<p>没有 <code>&amp;</code> 的接收者是<em>拷贝</em>，所以方法改不了原件。要透过它写，就把接收者声明为引用并加 <code>mut</code>：</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>这个区分就是 V 方法故事的全部，和普通值见过的区分一样：赋值给出值，引用是具名索取的东西。</p>
<p>除非方法真要改接收者，否则用值接收者。只读的方法就不该能改。</p>"
		}
		'moretypes/7':    PageText{
			title: '练习：词频统计'
			body:  "<h2>练习：词频统计</h2>
<p>实现 <code>word_count</code>，数每个词在字符串里出现几次。</p>
<p>词按非字母分隔，计数不分大小写。用 <code>map[string]int</code>。</p>
<p>跑通后把输出排序，而不是映射随便走出的顺序。</p>
<p>试过或卡住就按 <b>Solution</b>。</p>"
		}
		'moretypes/8':    PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/optionresult/1'>处理缺失和错误</a>。</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>V 区分很多语言混在一起的两种情形，各给其类型。</p>
<p><code>?T</code> 是值或 <em>none</em>。用于无值可返又没出错的情况：没找到的查找、跑完候选的搜索。</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>option 用 <code>or</code> 解包，给 none 情形一个值：</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>或用 <code>if</code>，改跑另一分支：</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>变量只在有值的分支绑定。在 <code>else</code> 分支 option 是 <code>none</code>。</p>
<p>option 不讲排场直接组合。返回 <code>?int</code> 的函数可直接返回另一函数的 option：</p>
<pre><code>n := name?.len</code></pre>
<p>那个 <code>?</code> 意思是“若是 none，也从本函数返回 none”。这是传播值和编造默认的区别，也是上面正文根本无需解包的原因。</p>
<p>打印 option 显示你手里是哪一半，所以 <code>Option(3)</code> 和 <code>Option(none)</code> 在你排查时自解释。</p>"
		}
		'optionresult/2': PageText{
			title: 'Result 和错误'
			body:  "<h2>Result 和错误</h2>
<p>option 说没有东西。<code>!T</code> 说某事<em>失败了</em>，并带如何失败的信息。</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>返回普通值无需解包；V 替你包装。返回 <code>error(...)</code> 即制造失败。整个契约就这些。</p>
<p>调用处和 option 同形，在 <code>else</code> 分支绑定 <code>err</code>：</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code> 只给信息本身，不带错误类型可能在周围加的东西。示例里两种形式都用了。</p>
<p>传播和 option 一样。注意 <code>parse_pair</code> 里每次调用上的 <code>!</code>：一半失败则全失败，信息随行。</p>
<p>标准库处处遵循此约定，所以 <code>json2.decode</code> 能报出你的 JSON 错在哪：</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>二选一的规则很短。没找到东西用 option；尝试了没成用 result。函数要转交非己之错时，用 <code>?</code> 或 <code>!</code> 传播，别压平成默认。</p>"
		}
		'optionresult/3': PageText{
			title: '练习：Options'
			body:  "<h2>练习：Options</h2>
<p>写四个函数，每个返回 option。</p>
<p><code>second_largest</code> 返回切片中第二大的<em>不同</em>值，没有则 none。重复的最大不算，所以 <code>[5, 5]</code> 没有第二大。</p>
<p><code>first_word</code> 返回字符串首词，空串则 none。</p>
<p><code>sum_all</code> 取 option 切片返回 int，跳过 none 的。</p>
<p>然后 <code>describe_all</code> 总结输入。用 <code>?</code> 传播来写，使其不含任何解包。</p>
<p>试过或卡住就按 <b>Solution</b>。</p>"
		}
		'optionresult/4': PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/methods/1'>方法和接口</a>。</p>"
		}
		'methods/1':      PageText{
			title: '接口'
			body:  "<h2>接口</h2>
<p>V 没有类。有方法的结构体就是全部，大多数程序有它就够了。</p>
<p><em>接口</em>是方法列表。类型只要有它们即实现：没有要写的关键字，没有要声明的东西。</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p><code>Dog</code> 和 <code>Cat</code> 都有 <code>speak</code> 方法后，两者都可传到要 <code>Speaker</code> 的地方：</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>实现是隐式的，所以以后加类型时接口照样工作。第三个说话者既不用改 <code>announce</code> 也不用改接口。</p>
<p>接口切片通常才是想要的，而不是某个具体类型的切片：</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>两条值得记住的规则。接口保持小：一两个方法是抽象真实的标志，五六个通常意味着你抄了个具体类型。接口声明在<em>用</em>的地方，而不是实现旁边。V 都不强制，但读者会在消费它的函数里找接口。</p>"
		}
		'methods/2':      PageText{
			title: '嵌入'
			body:  "<h2>嵌入</h2>
<p>结构体可以嵌入另一结构体，写作裸类型名：</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>被嵌入结构体的字段成为外部的字段，方法也跟着来。<code>u.id</code> 和 <code>u.name</code> 都只是 <code>User</code> 的字段，<code>u.describe()</code> 是从 <code>Base</code> 来方法。</p>
<p>公共字段和公共方法这样只写一次。嵌入<em>接口</em>也行，这就是类型拿行为当字段用的办法。</p>
<p>有一条让人意外的规则，值得吃亏学会。被嵌入结构体继承外部类型的成员，但<em>不</em>获得外部类型自身方法的访问权。所以 <code>Base</code> 上的方法在 <code>area()</code> 属于嵌入它的结构体时，不能调用 <code>area()</code>。</p>
<p>需要一个函数横跨多种类型时，改取接口作参数：</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>嵌入用于在类型与其部件间共享状态和行为。接口用于对多个不相干类型只写一次。回答的是不同问题，值得分开。</p>"
		}
		'methods/3':      PageText{
			title: '可打印类型'
			body:  "<h2>可打印类型</h2>
<p>V 用值的 <code>str</code> 方法打印它，而不是反射其字段，所以类型通过定义一个来控制长相：</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>此后 <code>println(t)</code>、字符串插值和拼接都用它：</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>这是你最常写的方法，值得早写：把自己打印得明白的类型，让以后每次调试都轻松。</p>
<p>这只影响打印。别处要 <code>string</code> 时，调用 <code>.str()</code> 显式传入：有 <code>str</code> 方法的类型仍是它自己的类型，编译器不会替你转换。</p>"
		}
		'methods/4':      PageText{
			title: '练习：形状'
			body:  "<h2>练习：形状</h2>
<p>四件事要写。</p>
<p>给 <code>Square</code> 和 <code>Triangle</code> 一个 <code>area</code> 方法，让 <code>total_area</code> 经接口累加形状切片。</p>
<p>再写 <code>describe(s Shape)</code>，报告形状的名字和面积而不知其为何。</p>
<p>最后部分有坑，找到它就是练习的大半。你会想把 <code>describe</code> 放 <code>Base</code> 上让每个形状继承。这行不通，编译器会告诉你为什么。</p>
<p>试过或卡住就按 <b>Solution</b>。</p>"
		}
		'methods/5':      PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/generics/1'>泛型</a>。</p>"
		}
		'generics/1':     PageText{
			title: '泛型函数'
			body:  "<h2>泛型函数</h2>
<p>类型参数代表一个类型，所以一个声明能服务一整个类型家族。V 用方括号写它，这是唯一值得背的语法：</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>尖括号<em>不是</em>这里的语法。写成 <code>fn max_of&lt;T&gt;(...)</code> 是解析错误而非另一种拼法，这是首先要做对的事。</p>
<p>类型实参很少手写。编译器从实参推断，读变量和读字面量一样：</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>类型参数只在编译器自己推不出来时才需要。返回位置常常就是关键：</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>那个 <code>?T</code> 和前面课程的意思完全一样：值或 none，是这次实例化是什么类型就是什么。</p>
<p>回调写作函数类型，即 <code>fn (T) R</code>。输入输出类型因此独立，这让一个函数能做管道：</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>一个声明，每种收到的实参类型各一次实例化。没有装箱也没有擦除：带 <code>int</code> 回调的 <code>apply</code> 和带 <code>string</code> 回调的是两个不同函数，所以回调类型必须写明而不能靠猜。</p>"
		}
		'generics/2':     PageText{
			title: '泛型结构体'
			body:  "<h2>泛型结构体</h2>
<p>结构体取类型参数和函数一样，提到它的每个字段都属于这次实例化：</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>于是 <code>Stack[int]</code> 装 <code>[]int</code> 而 <code>Stack[string]</code> 装 <code>[]string</code>，是两个不同类型。值得停下来想想，因为这意味着不能把 <code>int</code> 栈和 <code>string</code> 栈放进一切片而不抹掉某处类型。</p>
<p>方法也携带参数。接收者上的 <code>mut</code> 让方法能改结构体，<code>&amp;</code> 表示只读：</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p><code>?T</code> 是同样参数化的 option 类型，所以弹空栈得 <code>none</code> 而非 panic。</p>
<p>两个参数是同一主意两次，相互独立：</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>坑人的上限在此，值得精确，因为报错并不指向你在看的方法。<code>A</code> 和 <code>B</code> 无关联，所以两者间没有可提供的转换，方法不能把值从一字段搬到另一字段：</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>原因是泛型方法的性质而非 pair 的性质，值得理解而非死记。泛型方法体要对<em>每个</em>用到的实例化检查，所以必须同时对全部成立。这就是方法在 <code>Pair[int, int]</code>（两字段同类型）上没事、一被 <code>Pair[string, int]</code> 用就拒绝的原因。报错点的是犯事的实例化而非声明：</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>要记住的规则是泛型方法只能承诺对将来实例化的每种类型都真的事。读两字段永远成立，所以 <code>describe</code> 对每次实例化都行：</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: '泛型类型的映射'
			body:  "<h2>泛型类型的映射</h2>
<p>泛型类型可做映射的值类型，类型实参写在使用点。映射于是成了单一具体类型的普通映射：</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p>光秃 <code>Stack</code> 在此不够。映射必须知道它的值是什么的栈，漏掉实参是错误而不是编译器稍后推断的事。</p>
<p>值得知道的推论：<code>map[string]Stack[int]</code> 和 <code>map[string]Stack[string]</code> 是不同类型，需要两者的程序得明说，不能拿一个当另一个。</p>
<p>泛型方法在映射交出的值上可用，这让映射有用而不只是合法：</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>注意映射循环里的 <code>_,</code>。命名键会是 <code>for team, stack in teams</code>；光秃下划线表示不需要键。必须光秃：下划线后跟名字会被拒绝，所以 <code>_k</code> 不行。</p>
<p>映射是引用类型，两步写能成的道理在此：<code>teams['red'].push(10)</code> 在映射里找到栈并改同一个结构体，而不是拷贝一份丢掉改动。</p>"
		}
		'generics/4':     PageText{
			title: '多个类型参数'
			body:  "<h2>多个类型参数</h2>
<p>类型参数可叠加。函数上两个通常是输入输出类型，这让泛型函数成为映射：</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>类型参数不必出现在函数体。那听着像写无用函数的办法，也常常恰恰正确：参数零成本约束签名，调用处无代价。</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>函数体没提 <code>K</code>，所以对 string 键映射和 int 键映射是同一函数。<code>?V</code> 是故意的：空映射没有首值，所以函数返回 none 而不是编一个。</p>
<p>最常见的形状是映射上的泛型函数，回调决定每个值怎么办：</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p><code>K</code> 和 <code>V</code> 都从映射推断，<code>R</code> 定为 <code>int</code> 因为回调返回它。推断无米下锅处就显式命名实参：<code>first_map[string, int](m)</code>。</p>
<p>推断不会救不匹配的实参。把 <code>Counter[V]</code> 传到要 <code>map[K]Counter[V]</code> 处，报错点的是推不出的 <code>K</code> 而非真正问题，初见困惑。找泛型 bug 前先查实参类型。</p>"
		}
		'generics/5':     PageText{
			title: '练习：泛型'
			body:  "<h2>练习：泛型</h2>
<p>四件事要写，合起来用遍本课每种形状。</p>
<p><code>index_of[T]</code> 返回值在切片中的位置，或 -1。支持 <code>==</code> 的任何类型都行。</p>
<p><code>count_matching[T]</code> 数满足谓词的项数。谓词是回调，所以其类型写作 <code>fn (T) bool</code>。</p>
<p>然后 <code>Counter[K]</code>，每键记数的泛型结构体。给它 <code>add</code> 和 <code>get</code>，注意 <code>K</code> 用在另一泛型类型里：键为类型参数的映射。</p>
<p>最后 <code>grand_total[K, V]</code>，按 key 回调加权的计数器映射求和。两个类型参数，映射值类型是泛型结构体。</p>
<p>试过或卡住就按 <b>Solution</b>。</p>"
		}
		'generics/6':     PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/concurrency/1'>并发</a>。</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p><code>spawn</code> 启动线程立即返回。交回句柄，之后靠句柄等线程：</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> 自己不等。线程还在干活程序就结束，会把线程撂在写一半，所以规则是每个 spawn 最终都要等。</p>
<p>固定任务集就把句柄收进切片。元素类型是 <code>thread</code>，切片上的 <code>wait()</code> 把它们全等到：</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>工人有返回时切片是 <code>[]thread int</code>，<code>wait()</code> 按序交回结果：</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>顺序值得精确。结果按句柄加入的顺序回来，不按线程完成的顺序，所以这是收答案的办法，不是对工作强加顺序的办法。哪个线程先打印不该是程序依赖的事，示例里交错的输出是诚实版。</p>"
		}
		'concurrency/2':  PageText{
			title: '通道'
			body:  "<h2>通道</h2>
<p>通道把一种类型的值从一线程搬到另一线程。按元素类型加容量创建，收发用同一个箭头：</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>两个方向都是 <code>&lt;-</code>，因为两边都是从对方接收。没有 <code>ch.recv()</code> 也没有 <code>ch.pop()</code>：编译器当未知函数拒绝。习惯了方法的话，这就是要戒掉的。</p>
<p>无容量的 <code>chan int{}</code> 是<em>无缓冲</em>的，即通道什么都不存。接收方不到发送完不了，发送方不产出接收完不了。每个值都是两线程一次握手：</p>
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
<p>读示例输出，握手清晰可见：发送接收交替，不在该依赖的固定顺序里。这就是无缓冲通道的要点，不是毛病。</p>
<p>通道只载一种类型，所以等两种消息就是两个通道。后面的 <code>select</code> 是一次等多个的办法。</p>"
		}
		'concurrency/3':  PageText{
			title: '带缓冲的通道'
			body:  "<h2>带缓冲的通道</h2>
<p>容量给通道腾地方，发送方得以抢跑而不必每值都等：</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>差别可度量。有缓冲则发送全完成，<code>len()</code> 报出等了几个值。没有的话 <code>len()</code> 等多久都是零，因为没地方放：</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>生产者不该被慢消费者拖住时选缓冲。容量创建时定死，同元素类型的缓冲与无缓冲通道是不同类型。</p>
<p>有个坑值得花半分钟记住。定大小的字段是 <code>cap:</code>，写成 <code>len:</code> 会被拒绝而不是悄悄忽略：</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>报错点出想要的字段，已是最好。另一坑不在拼写。缓冲只帮到容量为止：要发的比地方多就卡在第一个装不下的值。所以四槽六活、消费者还没起时，第五发等着个没跑的消费者。要么缓冲整个单子，要么先起消费者。</p>"
		}
		'concurrency/4':  PageText{
			title: '接收直到关闭'
			body:  "<h2>接收直到关闭</h2>
<p><strong>V 里没有 <code>for x in ch</code>。</strong>通道不是集合，for 循环无物可标，编译器说：</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>从可遍历通道的语言过来，这就是你先犯的错。用 <code>&lt;-ch</code> 接收，要读到头就收到它不给为止：</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p><code>or</code> 给出结束循环的值，反方向最易错正在此：<strong><code>or</code> 只在通道关闭且空时触发。</strong>敞口空通道上 <code>&lt;-ch or { -1 }</code> 照样等发送方而阻塞。这不是非阻塞轮询，看着像也不是。</p>
<p>发送有个不提会花一下午的细节。发送表达式止于箭头，所以右边的计算值要括号：</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>没括号编译器就去乘 <code>ch &lt;- i</code> 产出的 void，说法还不明显指箭头。</p>
<p>生产者报过数时循环就多余：</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>这个简单形式有锋利边。关闭且空的通道上朴素 <code>&lt;-ch</code> 不阻塞也不 panic：每次都交回元素类型的<em>零值</em>。多要一个就得悄悄的 <code>0</code>、空串或零结构体而不是错误：</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>数没把握就用 <code>or</code>，想看一眼不等就用 <code>try_pop</code>：</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: '关闭'
			body:  "<h2>关闭</h2>
<p>生产者用完通道就关，从生产者那里关。生产者拥有通道一如拥有停的决定：</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>坑人的细节：光秃 <code>close</code> 不是关通道的办法。写作光秃调用它是关文件描述符的内建，在通道上报令人困惑的错：</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>关闭不丢缓冲里还存的。通道里的值先按序交给读者，空了接收才落空。这个顺序就是 close 之为信号的道理。</p>
<p>close 不使发送合法。往关闭通道发送是运行时 panic，关两次也是，所以规矩是一通道从唯一拥有处关一次。</p>
<p>close 也不是等。敞口空通道接收照样阻塞，不管将来有没有人关它。</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  "<h2>Select</h2>
<p><code>select</code> 在多个通道上等，跑就绪那个的正文。这是取首答而非固定顺序的办法：</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>分支是接收或发送，两方向可竞争：</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>写之前要知的两条约束，都是对编译器量出而非文档所载。</p>
<p><strong>两种形状分开放不同 select。</strong>既有发送分支<em>又有</em>接收分支的 select 直接崩编译器而不报错，所以发送配超时或配另一发送。</p>
<p><strong>分支必须点名已存在的通道。</strong>行内写通道被拒绝：</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>分支是赋值不是返回，所以被写的变量必须是 <code>mut</code>。分支位置的时长是超时，一 select 只一个。这样等就有了上限：</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> 是都没就绪时的分支，它不等。这是非阻塞形式：</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>作表达式 select 求值为 <strong>bool</strong>：通道分支跑了 true，<code>else</code> 跑了 false。它不求值为分支的值，所以分支里读值，bool 另测。</p>
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
<p>要备的不对称。通道一关，从它接收恒就绪，所以关闭通道每轮都赢 select。多通道循环里把在乎的排空，自己查关闭，别指望 select 带过去。</p>"
		}
		'concurrency/7':  PageText{
			title: '共享状态'
			body:  "<h2>共享状态</h2>
<p>通道搬值。线程要改<em>同一个</em>值时，那是锁的活。</p>
<p>不显然的是状态怎么共享。按值传进线程的结构体是拷贝，每线程各得一份。参数上的 <code>shared</code> 关键字让它成为同一个：</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>注意参数表里的 <code>shared t</code> 和调用处的 <code>spawn add(shared total, i)</code>，两个都要。没关键字传进去线程得拷贝，计数器永不动。</p>
<p><code>lock</code> 是块不是调用，右花括号释放它。没有配对的 <code>unlock</code> 语句，写一个是语法错误。持锁越短越好：不横跨 spawn，不横跨通道发送，不包实际工作。持着会阻塞的东西的锁就是程序死锁之道。</p>
<p><code>rlock</code> 是读版，给远多读少写的结构：</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p><code>shared</code> 变量使用点也要加锁，所以编译器不会让锁被意外忘掉。</p>
<p>小心一件事，也是示例先读值后等线程的原因。spawn 不等，所以 spawn 紧接着读共享状态是竞态：看到的值取决于线程跑多远。读前等写者，或接受数字是暂时的。</p>"
		}
		'concurrency/8':  PageText{
			title: '等待组'
			body:  "<h2>等待组</h2>
<p>等待组数进行中的活。spawn 前 <code>add</code>，里面 <code>done</code>，全起好 <code>wait</code>：</p>
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
<p>组取 <code>&amp;sync.WaitGroup</code> 而非 <code>mut &amp;sync.WaitGroup</code>。<code>mut</code> 引用能编译然后运行时栽进原子计数器，所以朴素引用才是用的形式。</p>
<p><code>wg.go</code> 把 add 和起线程打包，去掉两者分岔那步：</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>它取闭包而非调用，V 闭包必须点名所读。<code>fn [ch, i] ()</code> 表即此声明，漏变量是点名变量的编译错误，而非并发什么事。</p>
<p>三条规则，错的多半在此。每 <code>add</code> 要配 <code>done</code>，无 <code>add</code> 的 <code>done</code> 会 panic。每次 spawn 都要在 <code>wait</code> 前，因为 wait 看到的就这些。panic 的线程带走整个进程，所以半路可能失败的被 spawn 函数要有自己的 <code>defer</code>。</p>"
		}
		'concurrency/9':  PageText{
			title: '练习：工作池'
			body:  "<h2>练习：工作池</h2>
<p>建工人池，喂活进去。</p>
<p><code>worker</code> 从通道取一活，加倍，发结果到另一通道。交给它等待组，池才知何时完工。</p>
<p><code>run_all</code> 取活切片和工人数，按到达顺序返回结果。</p>
<p>操作顺序就是练习的全部，四件事须同时成立：</p>
<ul>
<li>任务通道在工人启动<em>前</em>关闭，否则工人可能等一个永不来的关闭。</li>
<li>每个 <code>add</code> 都在 <code>wait</code> 前，每个 <code>done</code> 都在工人里。</li>
<li>两通道都带缓冲，工人交值永不阻塞。</li>
<li>结果用 <code>&lt;-results or { break }</code> 收，因为通道上没有 <code>for</code>。</li>
</ul>
<p>其中两个正是本练习常挖出的死锁：任务单比任务通道地方小，或结果在 <code>wait</code> 前被读。</p>
<p>试过或卡住就按 <b>Solution</b>。</p>"
		}
		'concurrency/10': PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程，也完成了整个教程！</p>
<p>返回<a href='/list'>模块列表</a>重新阅读，或从<a href='/welcome/1'>入门</a>重新开始。</p>"
		}
		'cli/1':          PageText{
			title: '日常命令'
			body:  "<h2>日常命令</h2>
<p>几乎每次改动都跑三个命令。<code>v fmt -w .</code> 就地格式化项目，<code>v vet .</code> 报告可疑构造，<code>v test .</code> 跑测试集：</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>每次提交前先格式化，评审就永远不争排版。</p>
<p><code>v doc strings</code> 看模块文档，<code>v repl</code> 开交互提示符，源文件一变 <code>v watch run main.v</code> 就重编重跑。</p>"
		}
		'vpm/1':          PageText{
			title: '软件包'
			body:  "<h2>软件包</h2>
<p>库住在包仓库。搜它，看结果，装上：</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p><code>v list</code> 看项目依赖什么。<code>v outdated</code> 报新版本，<code>v update</code> 取回，<code>v remove</code> 删掉一个。</p>
<p>这些命令要联网，所以跑在你的机器而不是本 tour 沙盒。</p>"
		}
		'mcp/1':          PageText{
			title: '模型上下文协议'
			body:  "<h2>v mcp</h2>
<p><code>v mcp serve</code> 把编译器本身暴露给代码智能体：标准输入输出上的声明、引用和诊断：</p>
<pre><code>v mcp serve</code></pre>
<p><code>v mcp tools</code> 列出暴露了什么。改用 <code>--http</code> 走 HTTP 服务，用 <code>--root</code> 相对目录解相对路径，用 <code>--read-only</code> 不注册写文件工具。</p>
<p><code>v mcp install</code> 把服务接进智能体，<code>v mcp uninstall</code> 拿掉。这是新东西，要新版 V 而非本沙盒跑的发行版。</p>"
		}
		'skills/1':       PageText{
			title: '技能'
			body:  "<h2>技能</h2>
<p>技能是智能体为任务加载的打包指令：语言规则、测试循环、工具界面：</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>技能装进项目里的 <code>.agents/skills/</code>，或加 <code>--global</code> 装进家目录。<code>v skills path v-tools</code> 看某技能住哪，<code>--dry-run</code> 只报告不写。</p>
<p>和 <code>v mcp</code> 一样，这是新东西：要新版 V。</p>"
		}
	}
	ui:      {
		'site_title':       'V 语言教程'
		'toc':              '目录'
		'toggle_theme':     '切换主题'
		'language':         '语言'
		'run':              '运行'
		'format':           '格式化'
		'reset':            '重置'
		'solution':         '解答'
		'output':           '输出'
		'help':             '键盘快捷键'
		'help_close':       '关闭'
		'run_program':      '运行程序'
		'next_page':        '下一页'
		'prev_page':        '上一页'
		'toggle_help':      '打开或关闭此帮助'
		'move_panes':       '在面板之间移动'
		'previous':         '上一页'
		'next':             '下一页'
		'resize_panes':     '调整面板大小'
		'page_of':          '\${number} / \${total}'
		'no_program':       '沙箱中没有测试程序。'
		'compile_failed':   '程序未编译。'
		'could_not_reach':  '无法连接服务器：'
		'could_not_format': '无法格式化此程序。'
		'sandbox_busy':     '沙箱正忙。请重试。'
		'too_large':        '请求过大。'
		'no_compiler':      '沙箱没有可用的编译器。'
		'link_counterpart': '用 \${language} 阅读此页面'
		'lang_other':       '其他语言'
	}
}
