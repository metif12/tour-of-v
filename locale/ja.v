module locale

// 日本語 (Japanese) translation.

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
	pages:   {
		'welcome/1':      PageText{
			title: 'こんにちは、世界'
			body:  "<p><a href='https://vlang.io'>V プログラミング言語</a>のツアーへようこそ。</p>
<p>ツアーはモジュールに分かれています。<a href='/list'>目次</a>または右上のメニューボタンからアクセスできます。</p>
<p>ツアー全体でスライドと練習問題が見つかります。テキストの下の<b>前へ</b>と<b>次へ</b>リンク、または <code>PageUp</code> と <code>PageDown</code> キーで移動します。</p>
<p>ツアーはインタラクティブです。<b>実行</b>（または <code>Shift</code>+<code>Enter</code>）を押してプログラムをコンパイルして実行します。結果がコードの下に表示されます。</p>
<p>これらのプログラムは独自の実験の出発点です。プログラムを編集して再度実行してください。</p>"
		}
		'welcome/2':      PageText{
			title: 'このツアーの使い方'
			body:  '<p>各ページには左側にテキスト欄、右側にコード欄があります。その間にドラッグハンドルがあり、ドラッグしてコードに多くの空間を確保できます。</p>'
		}
		'welcome/3':      PageText{
			title: 'オフライン V（任意）'
			body:  '<p>このツアーを使用するにはローカルの V インストールは必要ありませんが、お勧めします。</p>'
		}
		'welcome/4':      PageText{
			title: 'サンドボックス'
			body:  '<p>プログラムはサーバーのサンドボックスで実行されます。</p>'
		}
		'welcome/5':      PageText{
			title: 'おめでとうございます！'
			body:  "<p>ツアーの最初のモジュールを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/basics/1'>言語の基礎</a>に直接進んでください。</p>"
		}
		'basics/1':       PageText{
			title: 'モジュール'
			body:  '<h2>モジュール</h2>'
		}
		'basics/2':       PageText{
			title: 'インポート'
			body:  '<h2>インポート</h2>'
		}
		'basics/3':       PageText{
			title: '変数'
			body:  '<h2>変数</h2>'
		}
		'basics/4':       PageText{
			title: 'ミュータブル変数'
			body:  '<h2>ミュータブル変数</h2>'
		}
		'basics/5':       PageText{
			title: '短い宣言'
			body:  '<h2>短い宣言</h2>'
		}
		'basics/6':       PageText{
			title: '関数'
			body:  '<h2>関数</h2>'
		}
		'basics/7':       PageText{
			title: '複数の戻り値'
			body:  '<h2>複数の戻り値</h2>'
		}
		'basics/8':       PageText{
			title: '基本型'
			body:  '<h2>基本型</h2>'
		}
		'basics/9':       PageText{
			title: 'ゼロ値'
			body:  '<h2>ゼロ値</h2>'
		}
		'basics/10':      PageText{
			title: '定数'
			body:  '<h2>定数</h2>'
		}
		'basics/11':      PageText{
			title: '型変換'
			body:  '<h2>型変換</h2>'
		}
		'basics/12':      PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/controlflow/1'>制御フロー</a>に進んでください。</p>"
		}
		'basics/13':      PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/controlflow/1'>制御フロー</a>に進んでください。</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':  PageText{
			title: 'For は V の "while"'
			body:  '<h2>For は V の "while"</h2>'
		}
		'controlflow/3':  PageText{
			title: 'For 続き'
			body:  '<h2>For 続き</h2>'
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':  PageText{
			title: 'アンラップ値付きの If'
			body:  '<h2>アンラップ値付きの If</h2>'
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':  PageText{
			title: 'Match とサム型'
			body:  '<h2>Match とサム型</h2>'
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':  PageText{
			title: '練習：ループと関数'
			body:  '<h2>練習：ループと関数</h2>'
		}
		'controlflow/10': PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/moretypes/1'>その他の型</a>に進んでください。</p>"
		}
		'moretypes/1':    PageText{
			title: '構造体'
			body:  '<h2>構造体</h2>'
		}
		'moretypes/2':    PageText{
			title: '配列'
			body:  '<h2>配列</h2>'
		}
		'moretypes/3':    PageText{
			title: 'スライス'
			body:  '<h2>スライス</h2>'
		}
		'moretypes/4':    PageText{
			title: 'マップ'
			body:  '<h2>マップ</h2>'
		}
		'moretypes/5':    PageText{
			title: '文字列'
			body:  '<h2>文字列</h2>'
		}
		'moretypes/6':    PageText{
			title: 'メソッド'
			body:  '<h2>メソッド</h2>'
		}
		'moretypes/7':    PageText{
			title: '練習：単語カウント'
			body:  '<h2>練習：単語カウント</h2>'
		}
		'moretypes/8':    PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/optionresult/1'>欠如と失敗の処理</a>に進んでください。</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2': PageText{
			title: 'Result とエラー'
			body:  '<h2>Result とエラー</h2>'
		}
		'optionresult/3': PageText{
			title: '練習：Options'
			body:  '<h2>練習：Options</h2>'
		}
		'optionresult/4': PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/methods/1'>メソッドとインターフェース</a>に進んでください。</p>"
		}
		'methods/1':      PageText{
			title: 'インターフェース'
			body:  '<h2>インターフェース</h2>'
		}
		'methods/2':      PageText{
			title: '埋め込み'
			body:  '<h2>埋め込み</h2>'
		}
		'methods/3':      PageText{
			title: '表示可能な型'
			body:  '<h2>表示可能な型</h2>'
		}
		'methods/4':      PageText{
			title: '練習：図形'
			body:  '<h2>練習：図形</h2>'
		}
		'methods/5':      PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/generics/1'>ジェネリクス</a>に進んでください。</p>"
		}
		'generics/1':     PageText{
			title: 'ジェネリック関数'
			body:  '<h2>ジェネリック関数</h2>'
		}
		'generics/2':     PageText{
			title: 'ジェネリック構造体'
			body:  '<h2>ジェネリック構造体</h2>'
		}
		'generics/3':     PageText{
			title: 'ジェネリック型のマップ'
			body:  '<h2>ジェネリック型のマップ</h2>'
		}
		'generics/4':     PageText{
			title: '複数の型パラメータ'
			body:  '<h2>複数の型パラメータ</h2>'
		}
		'generics/5':     PageText{
			title: '練習：ジェネリクス'
			body:  '<h2>練習：ジェネリクス</h2>'
		}
		'generics/6':     PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/concurrency/1'>並行処理</a>に進んでください。</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':  PageText{
			title: 'チャンネル'
			body:  '<h2>チャンネル</h2>'
		}
		'concurrency/3':  PageText{
			title: 'バッファ付きチャンネル'
			body:  '<h2>バッファ付きチャンネル</h2>'
		}
		'concurrency/4':  PageText{
			title: '閉じるまで受信'
			body:  '<h2>閉じるまで受信</h2>'
		}
		'concurrency/5':  PageText{
			title: '閉じる'
			body:  '<h2>閉じる</h2>'
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':  PageText{
			title: '共有状態'
			body:  '<h2>共有状態</h2>'
		}
		'concurrency/8':  PageText{
			title: 'ウェイトグループ'
			body:  '<h2>ウェイトグループ</h2>'
		}
		'concurrency/9':  PageText{
			title: '練習：ワーカープール'
			body:  '<h2>練習：ワーカープール</h2>'
		}
		'concurrency/10': PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了し、ツアーも完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って何でも再読するか、<a href='/welcome/1'>はじめに</a>からやり直してください。</p>"
		}
	}
	ui:      {
		'site_title':       'V ツアー'
		'toc':              '目次'
		'toggle_theme':     'テーマ切替'
		'language':         '言語'
		'run':              '実行'
		'format':           'フォーマット'
		'reset':            'リセット'
		'solution':         '解答'
		'output':           '出力'
		'help':             'キーボードショートカット'
		'help_close':       '閉じる'
		'run_program':      'プログラムを実行'
		'next_page':        '次のページ'
		'prev_page':        '前のページ'
		'toggle_help':      'このヘルプを開く/閉じる'
		'move_panes':       'ペイン間を移動'
		'previous':         '前へ'
		'next':             '次へ'
		'resize_panes':     'ペインのサイズ変更'
		'page_of':          '\${number} / \${total}'
		'no_program':       'サンドボックスにテストプログラムがありませんでした。'
		'compile_failed':   'プログラムはコンパイルされませんでした。'
		'could_not_reach':  'サーバーに接続できませんでした：'
		'could_not_format': 'このプログラムをフォーマットできませんでした。'
		'sandbox_busy':     'サンドビックスがビジーです。もう一度お試しください。'
		'too_large':        'リクエストが大きすぎます。'
		'no_compiler':      'サンドビックスにコンパイラがありません。'
		'link_counterpart': 'このページを \${language} で読む'
		'lang_other':       'その他の言語'
	}
}
