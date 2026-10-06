module locale

// 简体中文 (Chinese (Simplified)) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const zh = Text{
	modules: {
		'mechanics':    '使用本导览'
		'basics':       '基本类型'
		'controlflow':  '控制流'
		'moretypes':    '更多类型'
		'optionresult': 'Option 和 Result'
		'methods':      '方法和接口'
		'generics':     '泛型'
		'concurrency':  '并发'
	}
	lessons: {
		'welcome':      '入门'
		'basics':       '基本类型'
		'controlflow':  '控制流'
		'moretypes':    '更多类型'
		'optionresult': 'Option 和 Result'
		'methods':      '方法和接口'
		'generics':     '泛型'
		'concurrency':  '并发'
	}
	pages:   {}
	ui:      {
		'site_title':       'V 语言导览'
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
		'move_panes':       '在窗格之间移动'
		'previous':         '上一页'
		'next':             '下一页'
		'resize_panes':     '调整窗格大小'
		'page_of':          '\${number} / \${total}'
		'no_program':       '沙箱中没有测试程序。'
		'compile_failed':   '程序未编译。'
		'could_not_reach':  '无法连接服务器：'
		'could_not_format': '无法格式化此程序。'
		'sandbox_busy':     '沙箱正忙。请重试。'
		'too_large':        '该请求过大。'
		'no_compiler':      '沙箱没有可用的编译器。'
		'link_counterpart': '用 \${language} 阅读此页'
		'lang_other':       '其他语言'
	}
}
