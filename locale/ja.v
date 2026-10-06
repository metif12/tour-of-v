module locale

// 日本語 (Japanese) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const ja = Text{
	modules: {
		'mechanics':    'ツアーの使い方'
		'basics':       '基本型'
		'controlflow':  '制御フロー'
		'moretypes':    'その他の型'
		'optionresult': 'Option と Result'
		'methods':      'メソッドとインターフェース'
		'generics':     'ジェネリクス'
		'concurrency':  '並行処理'
	}
	lessons: {
		'welcome':      'はじめに'
		'basics':       '基本型'
		'controlflow':  '制御フロー'
		'moretypes':    'その他の型'
		'optionresult': 'Option と Result'
		'methods':      'メソッドとインターフェース'
		'generics':     'ジェネリクス'
		'concurrency':  '並行処理'
	}
	pages:   {}
	ui:      {
		'site_title':       'V ツアー'
		'toc':              '目次'
		'toggle_theme':     'テーマを切り替える'
		'language':         '言語'
		'run':              '実行'
		'format':           '整形'
		'reset':            'リセット'
		'solution':         '解答'
		'output':           '出力'
		'help':             'キーボードショートカット'
		'help_close':       '閉じる'
		'run_program':      'プログラムを実行'
		'next_page':        '次のページ'
		'prev_page':        '前のページ'
		'toggle_help':      'このヘルプを開くまたは閉じる'
		'move_panes':       'ペイン間を移動'
		'previous':         '前へ'
		'next':             '次へ'
		'resize_panes':     'ペインのサイズを変更'
		'page_of':          '\${number} / \${total}'
		'no_program':       'サンドボックスにテストプログラムがありませんでした。'
		'compile_failed':   'プログラムがコンパイルされませんでした。'
		'could_not_reach':  'サーバーに接続できませんでした: '
		'could_not_format': 'このプログラムを整形できませんでした。'
		'sandbox_busy':     'サンドビックスがビジーです。もう一度お試しください。'
		'too_large':        'そのリクエストは大きすぎます。'
		'no_compiler':      'サンドボックスに利用可能なコンパイラがありません。'
		'link_counterpart': 'このページを \${language} で読む'
		'lang_other':       'その他の言語'
	}
}
