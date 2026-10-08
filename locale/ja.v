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
			body:  "<h2>モジュール</h2>
<p>各 V ファイルは所属する<em>モジュール</em>を宣言する。宣言はファイルの先頭に書く。</p>
<p>プログラムは <code>main</code> というモジュールの <code>main</code> という関数から始まる。</p>
<p>このプログラムは標準ライブラリのモジュール <code>math</code> と <code>strings</code> を使っている。</p>
<p>V ではディレクトリごとに一つのモジュールがあり、モジュール名はディレクトリと一致する。シンボルは <code>pub</code> で印を付けない限りモジュールの外からは見えない。</p>"
		}
		'basics/2':       PageText{
			title: 'インポート'
			body:  "<h2>インポート</h2>
<p>インポートしたモジュールは、エクスポートされた名前を現在のファイルに持ち込む。</p>
<p>標準ライブラリはモジュール名でインポートする：<code>import math</code>、<code>import strings</code>。サードパーティのライブラリも同様にインポートする。</p>
<p>モジュール内のすべての操作が関数呼び出しとして書かれるわけではない。値に対する_メソッド_であるものもあり、<code>s.to_upper()</code> はインポートなしで文字列に作用する。</p>
<p>どちらの流儀も標準ライブラリ全体に見られるので、推測せずシグネチャを読む価値がある。</p>"
		}
		'basics/3':       PageText{
			title: '変数'
			body:  "<h2>変数</h2>
<p>コードを実行せよ。エラーメッセージに注目。</p>
<p>V の変数は <code>:=</code> で宣言する。多くの言語と異なり、V の変数はデフォルトで<em>不変</em>であり、可変性は明示的に求めなければならない。</p>
<p>コンパイラも同様に言う。6 行目は許可なく <code>sum</code> に代入しようとしている。</p>
<p>エラーを直すには 4 行目の宣言に <code>mut</code> を加えて再試行せよ。</p>"
		}
		'basics/4':       PageText{
			title: 'ミュータブル変数'
			body:  "<h2>ミュータブル変数</h2>
<p>ミュータブル変数を宣言するには、名前の前にキーワード <code>mut</code> を付ける。</p>
<p>V がこれを求めるのは、変更は意図すべきものだからである。再代入されない変数はコンパイラにとって推論しやすく、後でコードに戻ったあなたにとっても分かりやすい。</p>
<p><code>mut</code> を外して再実行せよ。前ページのエラーである。</p>
<p><code>mut</code> は関数引数や構造体フィールドを含め V の至る所で見る。</p>"
		}
		'basics/5':       PageText{
			title: '短い宣言'
			body:  "<h2>短い宣言</h2>
<p><code>:=</code> は変数を宣言し、その型を値から推論する。</p>
<p>型が自明でない場合や明示したい場合は、<code>i64(42)</code> や <code>f64(1.5)</code> のような_変換_で直接名指せ。</p>
<p>「今宣言して後で代入」の別形式は存在しない。V の変数はスコープに入る時点で常に値を持つため、後のページで会うゼロ値はあなたではなくコンパイラが作る。</p>"
		}
		'basics/6':       PageText{
			title: '関数'
			body:  "<h2>関数</h2>
<p>関数は <code>fn</code> で宣言する。</p>
<p>関数はゼロ個以上の仮引数を取れる。仮引数は名前と型で書き、同型の連続する仮引数は <code>x, y int</code> と書く。</p>
<p>関数の結果は仮引数リストの後に命名する。V の関数は戻り値型がタプルでない限りちょうど一つの値を返す。</p>
<p>本体が単一式の関数は一行で書ける：<code>fn double(x int) int { return x * 2 }</code></p>"
		}
		'basics/7':       PageText{
			title: '複数の戻り値'
			body:  "<h2>複数の戻り値</h2>
<p>関数は複数の値を返せる。戻り値型をタプルとして書け：</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>呼び出し側は結果を変数に分解する：</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>戻り値型は各値を単に列挙し、呼び出し側はそれらを変数に分解する。不要な値は <code>_</code> で無視する。</p>
<p>これは失敗しうる事柄に見られる形であり、後のモジュールで扱う。</p>"
		}
		'basics/8':       PageText{
			title: '基本型'
			body:  "<h2>基本型</h2>
<p>真偽値は <code>true</code> と <code>false</code> である。</p>
<p>整数は固定サイズで来る。<code>i8</code>、<code>i16</code>、<code>i32</code>、<code>i64</code>、符号なしは <code>u8</code> から <code>u64</code>。<code>int</code> 自体は 32 ビットであり、<code>isize</code> がプラットフォーム幅である。幅が重要なら <code>i32</code> か <code>i64</code> を名指せ。</p>
<p>浮動小数点型は <code>f32</code> と <code>f64</code> である。</p>
<p><code>rune</code> は Unicode コードポイントを保持する。</p>
<p>文字列は不変でシングルクォートで書く。</p>"
		}
		'basics/9':       PageText{
			title: 'ゼロ値'
			body:  "<h2>ゼロ値</h2>
<p>各型には<em>ゼロ値</em>があり、変数が何も代入される前に保持する値である。</p>
<p>ゼロ値は数値で <code>0</code>、真偽値で <code>false</code>、文字列で空文字列、配列・スライス・マップで空集合である。</p>
<p>構造体では、ゼロ値は全フィールドをゼロ値にした構造体である。</p>
<p>V は宣言点で値を要求するため、自分で書くことは稀である。コンパイラが代わりに作るので、右辺が冗長に見えても例はコンパイルできる。</p>"
		}
		'basics/10':      PageText{
			title: '定数'
			body:  "<h2>定数</h2>
<p><code>const</code> はプログラム構築時にコンパイラが知る値なので、定数式でなければならない。</p>
<p>定数は <code>const</code> で書き、一つずつか括弧でグループ化する。</p>
<p>一部言語の <code>final</code> と異なり、<code>const</code> 名を変数に再利用してもコンパイラ警告が出るだけである。その警告をエラーとして扱え：名が定数なら至る所で定数であるべきである。</p>"
		}
		'basics/11':      PageText{
			title: '型変換'
			body:  "<h2>型変換</h2>
<p>V は型を暗黙に変換しない。一方から他方へは常に書く：</p>
<pre><code>fl := f64(i)</code></pre>
<p>情報を失う変換もあれば真っ向拒否されるものもあり、変換が無意味ならコンパイラが教えてくれる。</p>
<p>文字列は数値ではない。一つを数として読むには変換し、テキストが解析できなければ結果がゼロ値になりうることを覚えておけ。</p>
<p><code>typeof(x).name</code> で型名をコンパイラに尋ねることもできる。</p>"
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
			body:  "<h2>For</h2>
<p>V のループキーワードは一つで、三つの形で来る。</p>
<p>数える形は C に似ている：</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>単独条件は while ループであり、条件なしは永久に回る。</p>
<p><code>break</code> はループを抜け、<code>continue</code> は次の反復へ飛ぶ。</p>
<p>3 まで数える代わりに 5 から数え下ろすよう変えて再実行せよ。</p>"
		}
		'controlflow/2':  PageText{
			title: 'For は V の "while"'
			body:  "<h2>For は V の「while」</h2>
<p>単一条件の <code>for</code> はその条件が偽になるまで続く。</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p>条件なしの <code>for</code> は<em>無限ループ</em>である：</p>
<pre><code>for {</code></pre>
<p>例は三反復で二つ目のループを抜ける。<code>if</code> と <code>break</code> を消せば CPU 時間切れでサンドボックスが止める。</p>"
		}
		'controlflow/3':  PageText{
			title: 'For 続き'
			body:  "<h2>For 続き</h2>
<p>コレクションの反復は添字でなく <code>in</code> を使う。範囲外に出られないためデフォルトで手を伸ばすべき形である。</p>
<pre><code>for i, v in items {</code></pre>
<p>添字を無視するには <code>_</code> を使え：</p>
<pre><code>for _, v in items {</code></pre>
<p>既知回数回すには範囲を使え：<code>for i in 0 .. n</code>。<code>..</code> は排他的であることに注意：<code>n</code> 回、<code>0</code> から <code>n-1</code> まで動く。</p>
<p>マップはキーと値を与える。</p>"
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  "<h2>If</h2>
<p><code>if</code> はこう書く：</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>条件を囲む括弧はなく、<code>then</code> キーワードもない。</p>
<p><code>if</code> は値を返しうる式なので、上の形は慣用的である：面白い場合を処理して早期 return し、通常に進め。</p>
<p>連鎖検査には <code>else if</code> を使え。V は各分岐を額面どおりに受け取るので、連鎖は自分で確かめよ：検査が真になりえない分岐は単に動かず、コンパイラはそれを指さない。</p>"
		}
		'controlflow/5':  PageText{
			title: 'アンラップ値付きの If'
			body:  "<h2>アンラップ値付きの If</h2>
<p>V 関数は値<em>または</em>エラーを返せる。戻り値型は前に <code>!</code> を付けて書く：</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>本体内では素朴な値を <code>return</code> すれば V が包んでくれる。失敗には代わりに <code>error(...)</code> を返せ。</p>
<p>呼び出し側では <code>if</code> が結果を開ける。成功値は <code>v</code> に束縛され、エラーがあれば <code>else</code> 分岐が <code>err</code> に束縛されたエラーで動く：</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>二度実行せよ。一度目は成功し二度目は失敗し、共に期待の分岐を取る。</p>
<p>失敗しうる事柄を扱う大半の V コードはこうである。<a href='/optionresult/1'>次モジュール</a>が本格的に扱う。</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  "<h2>Match</h2>
<p>V に <code>switch</code> キーワードはない。<code>match</code> があり、通常の switch より多くの場合を扱う。</p>
<p>値にマッチ：</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>範囲にマッチ。<code>match</code> の範囲は両端とも<em>含む</em>。これは <code>for</code> で使う <code>..</code> と逆である：</p>
<pre><code>1 ... 3 { }</code></pre>
<p>enum にマッチ。各値は分岐を要する。さもなくば <code>match</code> に <code>else</code> を要する。コンパイラが更新すべき各 <code>match</code> を指さずに値を足すことはできない。</p>"
		}
		'controlflow/7':  PageText{
			title: 'Match とサム型'
			body:  "<h2>Match とサム型</h2>
<p><em>サム型</em>は <code>=</code> と代替リストで宣言する：</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>その型の値は代替のちょうど一つであり、複数であることはない。</p>
<p>マッチすればどれかが分かる。分岐内では元の変数がその亜種に<em>スマートキャスト</em>されるので、フィールドはキャストなしで直接使える。</p>
<p>各代替に分岐が要るか、match に <code>else</code> が要る。コンパイラが強制するので、新代替を黙って無視できない。</p>
<p>サム型に四つ目の図形を足して実行せよ。欠けた <code>match</code> 文をコンパイラが正確に教えてくれる。</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  "<h2>Defer</h2>
<p><code>defer</code> は囲むブロックの出口で走る文を予約する。</p>
<p>ブロックがどう出ても走る：末尾到達でも早期 <code>return</code> でも panic 巻き戻し中でも。それが後片付けに役立つ理由である。</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>例では <code>with_defer</code> が本体を走らせ、次に遅延文。<code>early_return</code> は途中で返るが遅延文はやはり走る。</p>"
		}
		'controlflow/9':  PageText{
			title: '練習：ループと関数'
			body:  "<h2>練習：ループと関数</h2>
<p><code>sum_to</code> が <code>0</code> から <code>n</code> の合計を返すよう、<code>sum_squares</code> が二乗和を返すよう書け。</p>
<p>二度やれ：一度は最も直接的に、一度は明示 <code>for</code> ループで。</p>
<p>次に両方を <em>O(1)</em> 時間で動くよう書き直せ。</p>
<p>試したか詰まったら <b>Solution</b> を押せ。</p>"
		}
		'controlflow/10': PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/moretypes/1'>その他の型</a>に進んでください。</p>"
		}
		'moretypes/1':    PageText{
			title: '構造体'
			body:  "<h2>構造体</h2>
<p><em>構造体</em>は値を一つの名前の下に束ねる。V の「これらは一緒だ」と言う流儀である。</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>値は <code>Point{ x: 3, y: 4 }</code> で作り、フィールドは <code>p.x</code> で読む。</p>
<p>注目すべき二点。</p>
<p>第一に構造体は自らを表示できるので、<code>println(p)</code> は余計な手間なく全フィールドを見せる。</p>
<p>第二に可変性は通常変数と同様に働く。変数に <code>mut</code> が要る：</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>そしてフィールド自体が構造体内で <code>mut</code> の下に宣言されねばならない：</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p><code>mut</code> 下にないフィールドには一切代入できない。読む・渡す・複写はできる。</p>
<p>構造体から <code>mut:</code> を外して例を実行せよ。コンパイラが <code>x</code> に代入する行を指す。</p>"
		}
		'moretypes/2':    PageText{
			title: '配列'
			body:  "<h2>配列</h2>
<p>配列は長さ固定で、要素型は最初の要素から来る：</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>長さと初期値でも作れる：</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>配列は <code>[]</code> で添字付けし、長さを携える：</p>
<pre><code>println(numbers.len)</code></pre>
<p>二つの値が内容を共有すべきでない場合、<code>clone</code> で明示コピーを求めよ：</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>変えてほしくない相手にコレクションを渡すときに使え。覚えるべき規則に頼らず使用点で言うからである。</p>
<p>いつもの変換は自由関数でなくメソッドである：</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> は現在の要素である。</p>"
		}
		'moretypes/3':    PageText{
			title: 'スライス'
			body:  "<h2>スライス</h2>
<p>スライスは配列や他スライスの区間への眺めであり、同じ <code>[]</code> 構文で書く：</p>
<pre><code>part := arr[1..3]</code></pre>
<p>スライスは無からも作って伸ばせる。伸長はデータを動かしうるので変数は <code>mut</code> でなければならない：</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> は追加である。任意のスライスに働き、固定長配列では実行時驚愕でなくコンパイルエラーになる。</p>
<p>他スライスを切ればそのスライスになる。配列同様、独立コピーが要れば <code>clone</code>：</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>区間は<em>排他的</em>であることに注意：<code>0 .. n</code> は <code>n</code> 回動く。<code>for</code> 文はこの形のみを受け付ける。<code>match</code> 内の区間は <code>...</code> と書き両端とも包含的である。</p>"
		}
		'moretypes/4':    PageText{
			title: 'マップ'
			body:  "<h2>マップ</h2>
<p>マップはキーと値の組を持ち、リテラルとして書く：</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>値型は推論される。キーを足し、あるか問う：</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>ないキーを探すと<em>ゼロ値</em>が返るので、欠如とゼロを区別すべき検索は <code>or</code> を使う：</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>反復はキーと値を与える：</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>マップは参照型なので、素朴な代入は一つのマップに二つの名前を残す。<code>clone</code> が独立したものを得る方法である：</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p><code>clone</code> なしではマップは複写できないとコンパイラが言い、<code>move</code>・<code>clone</code>・参照から選べと求める。その問いこそ要点である：うっかりマップを共有するのは容易なので、V はどちらを意図したか言わせる。</p>"
		}
		'moretypes/5':    PageText{
			title: '文字列'
			body:  "<h2>文字列</h2>
<p>V 文字列はバイト列であり、直接の帰結が一つある：添字はバイトを返し、<code>.len</code> はバイトを数える。</p>
<pre><code>println(s[0])</code></pre>
<p>ASCII にはまったく正しく他には誤りなので <code>.runes()</code> がある。代わりに文字を歩く：</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>文字列は不変なので、その上の各メソッドは新文字列を返す：</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>これらはモジュール内関数でなくメソッドなので、インポートは不要である。一部操作は <code>strings</code> に住み、とりわけビルダ：</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>ループで長い文字列を組むときは繰り返し <code>+</code> でなくビルダを使え。</p>"
		}
		'moretypes/6':    PageText{
			title: 'メソッド'
			body:  "<h2>メソッド</h2>
<p>メソッドは<em>レシーバ</em>付き関数である：呼び出される値のこと。</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>レシーバ型はメソッド名の前に来て、メソッドは <code>p.sum()</code> と呼ばれる。</p>
<p><code>&amp;</code> なしのレシーバは<em>複製</em>なので、メソッドは原本を変えられない。透かして書くにはレシーバを参照で宣言し <code>mut</code> にせよ：</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>この区別が V メソッド話の全体であり、通常値で会った区別と同じである：代入は値を与え、参照は名指しで求めるものである。</p>
<p>メソッドが本当にレシーバを変えるのでなければ値レシーバを選べ。読むだけのメソッドに変える資格はない。</p>"
		}
		'moretypes/7':    PageText{
			title: '練習：単語カウント'
			body:  "<h2>練習：単語カウント</h2>
<p><code>word_count</code> を実装し、各単語が文字列に何度現れるか数えよ。</p>
<p>単語は非字で区切られ、数え上げは大小無視でなければならない。<code>map[string]int</code> を使え。</p>
<p>動いたら出力を、マップの気まぐれな巡り順でなく整列させよ。</p>
<p>試したか詰まったら <b>Solution</b> を押せ。</p>"
		}
		'moretypes/8':    PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/optionresult/1'>欠如と失敗の処理</a>に進んでください。</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>V は多くの言語が混ぜる二つの状況を分け、各々に型を与える。</p>
<p><code>?T</code> は値または <em>none</em> である。返すべきものがなく何も間違っていない場合のためである：何も見つけなかった検索、候補の尽きた探索。</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>option は <code>or</code> で開き、none の場合の値を与える：</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>または <code>if</code> で、代わりに別分岐を動かす：</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>変数が束縛されるのは値がある分岐だけである。<code>else</code> 分岐では option は <code>none</code> であった。</p>
<p>option は儀式なく合成する。<code>?int</code> を返す関数は他関数の option を直接返せる：</p>
<pre><code>n := name?.len</code></pre>
<p>その <code>?</code> は「none ならこの関数からも none を返せ」の意である。値を伝えることと既定を捏造することの違いであり、上の本体が開く必要のない理由である。</p>
<p>option の表示はどちらを持っているかを示すので、何が悪かったか調べる間 <code>Option(3)</code> と <code>Option(none)</code> は自らを語る。</p>"
		}
		'optionresult/2': PageText{
			title: 'Result とエラー'
			body:  "<h2>Result とエラー</h2>
<p>option は何もないと言う。<code>!T</code> は何かが<em>失敗した</em>と言い、経緯の文を持つ。</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>素朴な値を返すのに開く必要はない。V が包む。<code>error(...)</code> を返せば失敗を作る。契約の全体である。</p>
<p>呼び出し側は option と同じ形であり、<code>else</code> 分岐で <code>err</code> を束縛する：</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code> は文だけを与え、エラー型が周りに付け足したものはない。両形が例に使われている。</p>
<p>伝播は option と同様に働く。<code>parse_pair</code> 内の各呼び出しの <code>!</code> に注意：半分が失敗すれば全体が失敗し、文は連れて行く。</p>
<p>標準ライブラリは至る所でこの約束に従う。だから <code>json2.decode</code> はあなたの JSON がどこで間違ったか報告できる：</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>両者の選び方の規則は短い。何も見つからなければ option。何か試して駄目なら result。起こしていない失敗を渡す関数は、既定に潰すより <code>?</code> か <code>!</code> で伝えよ。</p>"
		}
		'optionresult/3': PageText{
			title: '練習：Options'
			body:  "<h2>練習：Options</h2>
<p>四つの関数を書け。各々 option を返す。</p>
<p><code>second_largest</code> はスライス中二番目に大きい<em>異なる</em>値を返す。なければ none。繰り返す最大は数えないので <code>[5, 5]</code> に二番目はない。</p>
<p><code>first_word</code> は文字列の最初の語を返し、空なら none。</p>
<p><code>sum_all</code> は option のスライスを取り int を返し、none は飛ばす。</p>
<p>次に入力を要約する <code>describe_all</code>。開きが一切ないよう <code>?</code> 伝播で書け。</p>
<p>試したか詰まったら <b>Solution</b> を押せ。</p>"
		}
		'optionresult/4': PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/methods/1'>メソッドとインターフェース</a>に進んでください。</p>"
		}
		'methods/1':      PageText{
			title: 'インターフェース'
			body:  "<h2>インターフェース</h2>
<p>V にクラスはない。メソッド付き構造体が全部であり、大半のプログラムにはそれで足りる。</p>
<p><em>インターフェース</em>はメソッドの一覧である。型はそれらを持つだけで実装する：書くキーワードも宣言するものもない。</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p><code>Dog</code> と <code>Cat</code> が共に <code>speak</code> メソッドを持てば、どちらも <code>Speaker</code> が欲しい所に渡せる：</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>実装が暗黙なので、後から型を足してもインターフェースは働く。三番目の話し手に <code>announce</code> の変更もインターフェースの変更も要らない。</p>
<p>インターフェースのスライスが大抵欲しいものであり、一つの具象型のスライスではない：</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>持つべき二規則。インターフェースは小さく保て：一二のメソッドは抽象が本物である印であり、五つは大抵具象型を写した意味である。インターフェースは実装の隣でなく<em>使う</em>所で宣言せよ。V はどちらも要求しないが、読者は消費する関数に探す。</p>"
		}
		'methods/2':      PageText{
			title: '埋め込み'
			body:  "<h2>埋め込み</h2>
<p>構造体は他構造体を埋め込める。裸の型名で書く：</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>埋め込まれた構造体のフィールドは外側のフィールドになり、メソッドも付いてくる。<code>u.id</code> と <code>u.name</code> は共に単なる <code>User</code> のフィールドであり、<code>u.describe()</code> は <code>Base</code> から来たメソッドである。</p>
<p>共通フィールドと共通メソッドをこうして一度書く。<em>インターフェース</em>の埋め込みも働き、型がフィールドの代わりに振る舞いを持つ流儀である。</p>
<p>驚く規則が一つあり、痛い目で学ぶ価値がある。埋め込まれた構造体は外側の型の成員を継承するが、外側の型自身のメソッドへの到達は<em>得ない</em>。つまり <code>Base</code> 上のメソッドは、それを埋め込む構造体に属する <code>area()</code> を呼べない。</p>
<p>一関数を複数型に渡って働かせたい場合は代わりにインターフェースを引数に取れ：</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>埋め込みは型と部品の間で状態と振る舞いを共有するためである。インターフェースは無関係な複数型について一度書くためである。異なる問いに答えるので分けて保つ価値がある。</p>"
		}
		'methods/3':      PageText{
			title: '表示可能な型'
			body:  "<h2>表示可能な型</h2>
<p>V は値をフィールド反射でなくその <code>str</code> メソッドで表示する。だから型は一つ定義して見え方を制御する：</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>以後 <code>println(t)</code> も文字列補間も結合もそれを使う：</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>最もよく書くメソッドであり、早めに書く価値がある：賢く自らを表示する型は後の全デバッグを楽にする。</p>
<p>これは表示にのみ影響する。他に <code>string</code> が期待される所では <code>.str()</code> を呼んで明示的に渡せ：<code>str</code> メソッド付き型はあくまで自らの型であり、コンパイラは君のために変換しない。</p>"
		}
		'methods/4':      PageText{
			title: '練習：図形'
			body:  "<h2>練習：図形</h2>
<p>書くこと四つ。</p>
<p><code>Square</code> と <code>Triangle</code> に <code>area</code> メソッドを与え、<code>total_area</code> にインターフェース越しで図形スライスを合計させよ。</p>
<p>次に何形か知らず図形の名と面積を報告する <code>describe(s Shape)</code> を書け。</p>
<p>最後に罠があり、見つけることが練習の大半である。<code>describe</code> を <code>Base</code> に置けば全図形が継承すると誘惑される。それは動かず、コンパイラが理由を教えてくれる。</p>
<p>試したか詰まったら <b>Solution</b> を押せ。</p>"
		}
		'methods/5':      PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/generics/1'>ジェネリクス</a>に進んでください。</p>"
		}
		'generics/1':     PageText{
			title: 'ジェネリック関数'
			body:  "<h2>ジェネリック関数</h2>
<p>型引数は型の代わりを務めるので、一つの宣言が型の一族全体に仕えられる。V は角括弧で書き、これが覚える価値ある唯一の構文である：</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>山括弧はここでは<em>構文でない</em>。<code>fn max_of&lt;T&gt;(...)</code> と書けば別綴りでなく解析エラーであり、最初に正すべき事である。</p>
<p>型実引数を名指すことは稀である。コンパイラが実引数から推論し、変数もリテラル同様に読む：</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>型引数が必要なのはコンパイラが独力で推論できない所だけである。戻り位置ではしばしばそこが要点である：</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>その <code>?T</code> は前の課とまったく同義である：値または none、この具現が何型であれ。</p>
<p>コールバックは関数型として書く。つまり <code>fn (T) R</code>。入力型と出力型を独立させ、一関数を管にする仕掛けである：</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>一つの宣言と、受けた実引数型ごとの別具現。ボックス化も消去もない：<code>int</code> コールバックの <code>apply</code> と <code>string</code> コールバックのは別関数であり、コールバック型は推測でなく書かねばならない理由である。</p>"
		}
		'generics/2':     PageText{
			title: 'ジェネリック構造体'
			body:  "<h2>ジェネリック構造体</h2>
<p>構造体は関数同様に型引数を取る。それに触れる各フィールドは具現に属する：</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>つまり <code>Stack[int]</code> は <code>[]int</code> を持ち、<code>Stack[string]</code> は <code>[]string</code> を持ち、二つの異なる型である。型をどこかで消さずに <code>int</code> 積みと <code>string</code> 積みを一スライスに入れられない意味なので、腰を据える価値がある。</p>
<p>メソッドも引数を担う。レシーバの <code>mut</code> がメソッドに構造体を変えさせ、<code>&amp;</code> は読むだけと言う：</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p><code>?T</code> は同様に引数化された option 型なので、空積みから取れば panic でなく <code>none</code> になる。</p>
<p>二引数は同じ考えの二度であり、互いに独立である：</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>人を捕まえる上限がここにあり、見ているメソッドをエラー文が指さないため正確を期す価値がある。<code>A</code> と <code>B</code> に関係はなく、両者間に提供すべき変換はなく、メソッドは値を一フィールドから他へ動かせない：</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>理由は対でなくジェネリックメソッドの性質であり、暗記より理解する価値がある。ジェネリックメソッド本体は使われる<em>各</em>具現に対して検査されるので、一度に全てに有効でなければならない。<code>Pair[int, int]</code> では両フィールド一型なので良く、<code>Pair[string, int]</code> が使った途端に拒まれる。エラーは宣言でなく違反具現を名指す：</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>掴むべき規則は、ジェネリックメソッドは具現される各型に真であることしか約束できないことである。両フィールドを読むことは常に適格なので、<code>describe</code> は各具現に作用する：</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: 'ジェネリック型のマップ'
			body:  "<h2>ジェネリック型のマップ</h2>
<p>ジェネリック型はマップの値型になれ、型実引は使用点で綴る。マップは単一具象型の普通マップになる：</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p>裸の <code>Stack</code> ではここは足りない。マップは値が何の積みかを知らねばならず、引数を省けば後で推論されるものではなくエラーである。</p>
<p>知っておくべき帰結：<code>map[string]Stack[int]</code> と <code>map[string]Stack[string]</code> は異なる型なので、両方要る側が言わねばならず、一方を他方の身代わりにできない。</p>
<p>ジェネリックメソッドはマップの渡す値に使え、それがマップを単に合法でなく有用にする：</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>マップ循環の <code>_,</code> に注意。鍵を名指せば <code>for team, stack in teams</code> である。裸の下線は鍵が不要と言う。下線は裸でなければならず、名付きは拒まれるので <code>_k</code> は不可である。</p>
<p>マップは参照型であり、二段階書きが働く理由である：<code>teams['red'].push(10)</code> はマップ内の積みを見つけて同じ構造体を変え、複写して変更を失わない。</p>"
		}
		'generics/4':     PageText{
			title: '複数の型パラメータ'
			body:  "<h2>複数の型パラメータ</h2>
<p>型引数は積み重なる。関数上の二つは大抵入力型と出力型であり、ジェネリック関数を写像たらしめるもの：</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>型引数は本体に現れなくてよい。無用な関数を書く流儀に聞こえ、しばしばまさに正しい：引数は呼び出し側無負担で署名を縛る。</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>本体内で <code>K</code> に触れるものはなく、文字列鍵マップにも整数鍵マップにも同一関数である。<code>?V</code> は故意である：空マップに先頭値はないので、捏造せず none を返す。</p>
<p>最も出る形はマップ上のジェネリック関数であり、コールバックが各値の扱いを決める：</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p><code>K</code> も <code>V</code> もマップから推論され、<code>R</code> はコールバックの返すものなので <code>int</code> に固定される。推論に働き口のない所では実引数を明示命名せよ：<code>first_map[string, int](m)</code>。</p>
<p>推論がしないのは不適合実引の救済である。<code>map[K]Counter[V]</code> が欲しい所に <code>Counter[V]</code> を渡せば、真の問題でなく推論不能な <code>K</code> を名指す。戸惑う初対面である。ジェネリクス虫を探す前に実引の型を確かめよ。</p>"
		}
		'generics/5':     PageText{
			title: '練習：ジェネリクス'
			body:  "<h2>練習：ジェネリクス</h2>
<p>書くこと四つ。合わせてこの課の全形を使う。</p>
<p><code>index_of[T]</code> はスライス内値の位置か -1 を返す。<code>==</code> 持ちの任意型に働く。</p>
<p><code>count_matching[T]</code> は述語を満たす項を数える。述語はコールバックなので型は <code>fn (T) bool</code> と書く。</p>
<p>次に鍵ごと計数を持つジェネリック構造体 <code>Counter[K]</code>。<code>add</code> と <code>get</code> を与え、<code>K</code> がここで他ジェネリック型内、鍵が型引数のマップ内で使われることに注目せよ。</p>
<p>最後に鍵コールバックで重み付けた計数マップを足す <code>grand_total[K, V]</code>。二型引数と、マップ値型としてのジェネリック構造体。</p>
<p>試したか詰まったら <b>Solution</b> を押せ。</p>"
		}
		'generics/6':     PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って次に学ぶことを確認するか、<a href='/concurrency/1'>並行処理</a>に進んでください。</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p><code>spawn</code> はスレッドを起こして即戻る。ハンドルを渡し、後でスレッドを待つ手段がハンドルである：</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> 自体は何も待たない。スレッドが働く間に終わる側は書きかけで置いていくので、spawn はいずれ待つのが決まりである。</p>
<p>固定仕事の集まりにはハンドルをスライスに集めよ。要素型は <code>thread</code> であり、スライス上の <code>wait()</code> が全てを結ぶ：</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>働き手が何か返す場合スライスは <code>[]thread int</code> であり、<code>wait()</code> は結果を順に渡す：</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>順序は正確を期す価値がある。結果はハンドルを足した順に戻り、スレッドの終わり順ではない。答えを集める手段であり、仕事に順序を課す手段ではない。どのスレッドが先に刷るかに側は頼るべきでなく、例の交ざった出力がその正直版である。</p>"
		}
		'concurrency/2':  PageText{
			title: 'チャンネル'
			body:  "<h2>チャンネル</h2>
<p>チャンネルは一型の値を一スレッドから他へ動かす。要素型と容量で作り、送受は同じ矢印で：</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>両方向とも <code>&lt;-</code> である。どちらも相手から受けるからである。<code>ch.recv()</code> も <code>ch.pop()</code> もない：未知関数として弾く。ここで慣れた流儀があれば忘れるべき事である。</p>
<p>容量なしの <code>chan int{}</code> は<em>無緩衝</em>であり、チャンネルは何も持たない。受け手が立たねば送りは終わらず、送り手が産まね受け取りは終わらない。各値は二スレッドの握手である：</p>
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
<p>例の出力を読めば握手は見える：送受は交互であり、頼るべき固定順序にはない。これが無緩衝チャンネルの要点であり欠陥ではない。</p>
<p>チャンネルはちょうど一型を運ぶので、二種の文を待てば二チャンネルである。後の <code>select</code> が一度に複数を待つ流儀である。</p>"
		}
		'concurrency/3':  PageText{
			title: 'バッファ付きチャンネル'
			body:  "<h2>バッファ付きチャンネル</h2>
<p>容量がチャンネルに余地を与え、送り手は値ごとに詰まらず先行できる：</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>違いは測れる。緩衝あれば全送りが終わり、<code>len()</code> は待つ値を報せる。なければ <code>len()</code> はいくら待っても零のままである。置き場がないからである：</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>遅い受け手を送り手が待つべきでない場合に緩衝を選べ。容量はチャンネル作成時に固定され、同要素型の緩衝ありと無しは異なる型である。</p>
<p>覚えるに半分の価値ある罠がここにある。大きさを決めるフィールドは <code>cap:</code> であり、代わりに <code>len:</code> と書けば黙殺でなく拒否される：</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>文は欲しいフィールドを名指しし、これ以上はほぼない。他の罠は綴りでない。緩衝は容量までしか助けない：置き場より送るものが多ければ、収まらない最初の値で詰まる。四つの枠に六仕事で受け手が未起動なら、五つ目の送りは動いていない受け手を待つ。リストごと緩衝するか、先に受け手を起こすかである。</p>"
		}
		'concurrency/4':  PageText{
			title: '閉じるまで受信'
			body:  "<h2>閉じるまで受信</h2>
<p><strong>V に <code>for x in ch</code> はない。</strong>チャンネルは集合でないので for 循環に添字対象がなく、コンパイラは言う：</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>チャンネルを辿れる言語から来れば、これが最初に誤る事である。<code>&lt;-ch</code> で受け、チャンネルを端まで読むには与えなくなるまで受けよ：</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p><code>or</code> は循環を終える値を与え、逆向きに誤りやすいのはここである：<strong><code>or</code> はチャンネルが閉じて空のときにのみ発火する。</strong>何もない開チャンネルでは <code>&lt;-ch or { -1 }</code> は送り手を待って詰まったままである。見かけによらず非遮断探りではない。</p>
<p>送りについて誰も言わなければ午後を費やす細部。送り式は矢印で止まるので、右の計算値は括弧が要る：</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>なければコンパイラは <code>ch &lt;- i</code> の産んだ void を掛けようとし、矢印を明らかに指さない言い方をする。</p>
<p>産み手が数を教えたら循環は不要である：</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>この素朴形に鋭い縁がある。閉じた空チャンネルでの素朴 <code>&lt;-ch</code> は詰まらず panic せず：要素型の<em>ゼロ値</em>を毎度渡す。一つ多く求めれば誤りの代わりに黙った <code>0</code> か空文字列かゼロ構造体を得る：</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>数が確実でなければ <code>or</code> を選べ、待たずに覗きたければ <code>try_pop</code> を取れ：</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: '閉じる'
			body:  "<h2>閉じる</h2>
<p>チャンネルはその産み手が使い終えたら閉じ、産み手から閉じよ。産み手はチャンネルを止める決定同様に所有する：</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>人を捕まえる細部：裸の <code>close</code> はチャンネルの閉じ方ではない。裸呼び出しで書けば記述子を閉じる組込みであり、チャンネルでは紛らわしい文で失敗する：</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>閉じても緩衝済みは捨てない。チャンネル内の値は先に順に読み手に渡され、空になって初めて受けは何も見つけない。この順序が close をあるべき合図たらしめる。</p>
<p>close がしないのは送りを合法にすることである。閉チャンネルへの送りは実行時 panic であり、二度閉じもそうなので、規則は所有する一所から一チャンネル一閉じである。</p>
<p>close は待ちでもない。開いた空チャンネルからの受けはいつか誰かが閉じようと詰まる。</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  "<h2>Select</h2>
<p><code>select</code> は複数チャンネルで待ち、動けるものの本体を動かす。固定順でなく最初の答えを取る流儀である：</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>分岐は受けか送りなので両方向が競える：</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>書く前に知るべき二制約。どちらも文書でなくコンパイラに対して測った。</p>
<p><strong>二形は別 select に保て。</strong>送り分岐<em>かつ</em>受け分岐を持つ select はエラー報告でなくコンパイラごと落ちる。送りは時限か他送りと組ませよ。</p>
<p><strong>分岐は既存チャンネルを名指さねばならない。</strong>行内書きは拒まれる：</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>分岐は返さず代入するので、書く変数は <code>mut</code> でなければならない。分岐位置の期間は時限であり一 select 一つ。これで待ちは無制限でなくなる：</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> は何も ready でない場合の分岐であり待たない。非遮断形である：</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>式として select は <strong>bool</strong> に評価される：チャンネル分岐が動けば true、<code>else</code> なら false。分岐の値には評価されないので、値は分岐で読み bool は別に試せ。</p>
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
<p>備えるべき非対称。チャンネルが閉じれば受けることは恒常的に可能なので、閉チャンネルは毎回 select に勝つ。複数チャンネルの循環では気になるものを汲み、閉じは自分で確かめよ。通り過ぎを select に頼るな。</p>"
		}
		'concurrency/7':  PageText{
			title: '共有状態'
			body:  "<h2>共有状態</h2>
<p>チャンネルは値を動かす。スレッドが<em>同じ</em>値を変えるべき場合、それが錠の仕事である。</p>
<p>自明でないのは状態の共有のされ方である。値でスレッドに渡された構造体は複写であり、各スレッドは自分のものを持つ。仮引数の <code>shared</code> 指示語がそれを一つにするものである：</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>仮引数並びの <code>shared t</code> と呼び側の <code>spawn add(shared total, i)</code> に注意。両方要る。指示語なしで渡せばスレッドは複写を得て、数えは決して動かない。</p>
<p><code>lock</code> は塊であり呼び出しでない。閉じ括弧が放す。<code>unlock</code> 文の対はなく、書けば構文エラーである。できるだけ短く持て：spawn 跨ぎもチャンネル送り跨ぎも実働囲みも不可である。詰まりうるものを跨いで持つ錠が側の行き詰まり方である。</p>
<p><code>rlock</code> は読み版であり、書くより遥かに読まれる構造のためである：</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p><code>shared</code> 変数は使用点でも錠せねばならず、コンパイラは錠の偶発忘れを許さない。</p>
<p>気を付けるべき一事があり、例が糸を待つ前に値を読む理由である。Spawn は待たないので、spawn 直後に共有状態を読むのは競合である：見える値は糸の進み具合に依存する。読む前に書き手を待つか、数が暫定と受け入れよ。</p>"
		}
		'concurrency/8':  PageText{
			title: 'ウェイトグループ'
			body:  "<h2>ウェイトグループ</h2>
<p>ウェイトグループは進行中仕事を数える。spawn 前に <code>add</code>、内に <code>done</code>、全て起こして <code>wait</code>：</p>
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
<p>組は <code>&amp;sync.WaitGroup</code> で取れ、<code>mut &amp;sync.WaitGroup</code> でない。<code>mut</code> 参照はコンパイルできて実行時に不可分計数内で落ちる。素朴参照が使う形である。</p>
<p><code>wg.go</code> は add と糸起こしを束ね、両者の乖離する段を除く：</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>呼び出しでなく閉包を取り、V 閉包は読むものを名指さねばならない。<code>fn [ch, i] ()</code> 表がその宣言であり、変数を省けば変数を名指すコンパイルエラーである。並行性とは無関係である。</p>
<p>三規則。これが誤る大半である。各 <code>add</code> に対応 <code>done</code> が要り、<code>add</code> なき <code>done</code> は panic する。各 spawn は <code>wait</code> の前にあらねばならない。wait の見るものはそれだけだからである。panic する糸は行程ごと連れていくので、途中で失敗しうる起こし関数は自前の <code>defer</code> が要る。</p>"
		}
		'concurrency/9':  PageText{
			title: '練習：ワーカープール'
			body:  "<h2>練習：ワーカープール</h2>
<p>働き手溜めを作り仕事を食わせよ。</p>
<p><code>worker</code> はチャンネルから一仕事を取り、倍にして別チャンネルへ送る。溜めが終わりを知るよう待ち組を渡される。</p>
<p><code>run_all</code> は仕事スライスと働き手数を取って、結果を着順で返す。</p>
<p>操作順こそ練習の全部であり、四事が同時に真でなければならない：</p>
<ul>
<li>仕事チャンネルは働き手の起動<em>前</em>に閉じる。さもば来ない閉じを待つ働き手が残りうる。</li>
<li>各 <code>add</code> は <code>wait</code> の前に、各 <code>done</code> は働き手の中に。</li>
<li>両チャンネルは緩衝付き。値を返す働き手が決して詰まらないよう。</li>
<li>結果は <code>&lt;-results or { break }</code> で集める。チャンネル上の <code>for</code> はないからである。</li>
</ul>
<p>その内二つがこの練習の掘り出す行き詰まりである：仕事リストより狭い仕事チャンネルか、<code>wait</code> 前に読む結果である。</p>
<p>試したか詰まったら <b>Solution</b> を押せ。</p>"
		}
		'concurrency/10': PageText{
			title: 'おめでとうございます！'
			body:  "<p>このレッスンを完了し、ツアーも完了しました！</p>
<p><a href='/list'>モジュール一覧</a>に戻って何でも再読するか、<a href='/welcome/1'>はじめに</a>からやり直してください。</p>"
		}
		'cli/1':          PageText{
			title: '日常的なコマンド'
			body:  '<h2>日常的なコマンド</h2>'
		}
		'vpm/1':          PageText{
			title: 'パッケージ'
			body:  '<h2>パッケージ</h2>'
		}
		'mcp/1':          PageText{
			title: 'モデルコンテキストプロトコル'
			body:  '<h2>モデルコンテキストプロトコル</h2>'
		}
		'skills/1':       PageText{
			title: 'スキル'
			body:  '<h2>スキル</h2>'
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