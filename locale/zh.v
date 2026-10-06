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
		'welcome/1':       PageText{
			title: '你好，世界'
			body:  "<p>欢迎使用 <a href='https://vlang.io'>V 编程语言</a> 教程。</p>
<p>教程分为多个模块。你可以从<a href='/list'>目录</a>或右上角的菜单按钮访问它们。</p>
<p>教程中包含幻灯片和练习。使用文本下方的<b>上一页</b>和<b>下一页</b>链接，或使用 <code>PageUp</code> 和 <code>PageDown</code> 键进行导航。</p>
<p>教程是交互式的。按<b>运行</b>（或 <code>Shift</code>+<code>Enter</code>）编译并运行程序。结果显示在代码下方。</p>
<p>这些程序是你自己实验的起点。编辑程序并重新运行。</p>"
		}
		'welcome/2':       PageText{
			title: '使用本教程'
			body:  '<p>每页左侧是文本栏，右侧是代码栏。中间有一个拖拽手柄：拖动它可以给代码更多空间。</p>'
		}
		'welcome/3':       PageText{
			title: '离线 V（可选）'
			body:  "<p>使用本教程不需要本地安装 V，但建议安装。</p>"
		}
		'welcome/4':       PageText{
			title: '沙箱'
			body:  '<p>你的程序在服务器的沙箱中运行。</p>'
		}
		'welcome/5':       PageText{
			title: '恭喜！'
			body:  "<p>你已完成教程的第一个模块！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或直接继续<a href='/basics/1'>语言基础</a>。</p>"
		}
		'basics/1':        PageText{
			title: '模块'
			body:  '<h2>模块</h2>'
		}
		'basics/2':        PageText{
			title: '导入'
			body:  '<h2>导入</h2>'
		}
		'basics/3':        PageText{
			title: '变量'
			body:  '<h2>变量</h2>'
		}
		'basics/4':        PageText{
			title: '可变变量'
			body:  '<h2>可变变量</h2>'
		}
		'basics/5':        PageText{
			title: '短声明'
			body:  '<h2>短声明</h2>'
		}
		'basics/6':        PageText{
			title: '函数'
			body:  '<h2>函数</h2>'
		}
		'basics/7':        PageText{
			title: '多返回值'
			body:  '<h2>多返回值</h2>'
		}
		'basics/8':        PageText{
			title: '基础类型'
			body:  '<h2>基础类型</h2>'
		}
		'basics/9':        PageText{
			title: '零值'
			body:  '<h2>零值</h2>'
		}
		'basics/10':       PageText{
			title: '常量'
			body:  '<h2>常量</h2>'
		}
		'basics/11':       PageText{
			title: '类型转换'
			body:  '<h2>类型转换</h2>'
		}
		'basics/12':       PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/controlflow/1'>控制流</a>。</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For 是 V 的 "while"'
			body:  '<h2>For 是 V 的 "while"</h2>'
		}
		'controlflow/3':   PageText{
			title: 'For 续'
			body:  '<h2>For 续</h2>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':   PageText{
			title: '带解包值的 If'
			body:  '<h2>带解包值的 If</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match 和和类型'
			body:  '<h2>Match 和和类型</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: '练习：循环和函数'
			body:  '<h2>练习：循环和函数</h2>'
		}
		'controlflow/10':  PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/moretypes/1'>更多类型</a>。</p>"
		}
		'moretypes/1':     PageText{
			title: '结构体'
			body:  '<h2>结构体</h2>'
		}
		'moretypes/2':     PageText{
			title: '数组'
			body:  '<h2>数组</h2>'
		}
		'moretypes/3':     PageText{
			title: '切片'
			body:  '<h2>切片</h2>'
		}
		'moretypes/4':     PageText{
			title: '映射'
			body:  '<h2>映射</h2>'
		}
		'moretypes/5':     PageText{
			title: '字符串'
			body:  '<h2>字符串</h2>'
		}
		'moretypes/6':     PageText{
			title: '方法'
			body:  '<h2>方法</h2>'
		}
		'moretypes/7':     PageText{
			title: '练习：词频统计'
			body:  '<h2>练习：词频统计</h2>'
		}
		'moretypes/8':     PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/optionresult/1'>处理缺失和错误</a>。</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result 和错误'
			body:  '<h2>Result 和错误</h2>'
		}
		'optionresult/3':  PageText{
			title: '练习：Options'
			body:  '<h2>练习：Options</h2>'
		}
		'optionresult/4':  PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/methods/1'>方法和接口</a>。</p>"
		}
		'methods/1':       PageText{
			title: '接口'
			body:  '<h2>接口</h2>'
		}
		'methods/2':       PageText{
			title: '嵌入'
			body:  '<h2>嵌入</h2>'
		}
		'methods/3':       PageText{
			title: '可打印类型'
			body:  '<h2>可打印类型</h2>'
		}
		'methods/4':       PageText{
			title: '练习：形状'
			body:  '<h2>练习：形状</h2>'
		}
		'methods/5':       PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/generics/1'>泛型</a>。</p>"
		}
		'generics/1':      PageText{
			title: '泛型函数'
			body:  '<h2>泛型函数</h2>'
		}
		'generics/2':      PageText{
			title: '泛型结构体'
			body:  '<h2>泛型结构体</h2>'
		}
		'generics/3':      PageText{
			title: '泛型类型的映射'
			body:  '<h2>泛型类型的映射</h2>'
		}
		'generics/4':      PageText{
			title: '多个类型参数'
			body:  '<h2>多个类型参数</h2>'
		}
		'generics/5':      PageText{
			title: '练习：泛型'
			body:  '<h2>练习：泛型</h2>'
		}
		'generics/6':      PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程！</p>
<p>返回<a href='/list'>模块列表</a>查看下一步学习内容，或继续<a href='/concurrency/1'>并发</a>。</p>"
		}
		'concurrency/1':   PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':   PageText{
			title: '通道'
			body:  '<h2>通道</h2>'
		}
		'concurrency/3':   PageText{
			title: '带缓冲的通道'
			body:  '<h2>带缓冲的通道</h2>'
		}
		'concurrency/4':   PageText{
			title: '接收直到关闭'
			body:  '<h2>接收直到关闭</h2>'
		}
		'concurrency/5':   PageText{
			title: '关闭'
			body:  '<h2>关闭</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: '共享状态'
			body:  '<h2>共享状态</h2>'
		}
		'concurrency/8':   PageText{
			title: '等待组'
			body:  '<h2>等待组</h2>'
		}
		'concurrency/9':   PageText{
			title: '练习：工作池'
			body:  '<h2>练习：工作池</h2>'
		}
		'concurrency/10':  PageText{
			title: '恭喜！'
			body:  "<p>你已完成本课程，也完成了整个教程！</p>
<p>返回<a href='/list'>模块列表</a>重新阅读，或从<a href='/welcome/1'>入门</a>重新开始。</p>"
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
