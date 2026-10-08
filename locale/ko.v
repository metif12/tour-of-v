module locale

// 한국어 (Korean) translation.

pub const ko = Text{
	modules: {
		'mechanics':    '투어 사용법'
		'basics':       '기본 타입'
		'controlflow':  '제어 흐름'
		'moretypes':    '더 많은 타입'
		'optionresult': 'Option과 Result'
		'methods':      '메서드와 인터페이스'
		'generics':     '제네릭'
		'concurrency':  '동시성'
	}
	lessons: {
		'welcome':      '시작하기'
		'basics':       '기본 타입'
		'controlflow':  '제어 흐름'
		'moretypes':    '더 많은 타입'
		'optionresult': 'Option과 Result'
		'methods':      '메서드와 인터페이스'
		'generics':     '제네릭'
		'concurrency':  '동시성'
	}
	pages:   {
		'welcome/1':      PageText{
			title: '안녕, 세계'
			body:  "<p><a href='https://vlang.io'>V 프로그래밍 언어</a> 투어에 오신 것을 환영합니다.</p>
<p>투어는 모듈로 나뉘어 있습니다. <a href='/list'>목차</a> 또는 오른쪽 상단의 메뉴 버튼에서 접근할 수 있습니다.</p>
<p>투어 전체에서 슬라이드와 연습 문제를 만날 수 있습니다. 텍스트 아래의 <b>이전</b> 및 <b>다음</b> 링크 또는 <code>PageUp</code> 및 <code>PageDown</b> 키로 탐색하세요.</p>
<p>투어는 인터랙티브입니다. <b>실행</b>(또는 <code>Shift</code>+<code>Enter</code>)을 눌러 프로그램을 컴파일하고 실행하세요. 결과가 코드 아래에 표시됩니다.</p>
<p>이 프로그램들은 여러분만의 실험을 위한 출발점입니다. 프로그램을 편집하고 다시 실행해 보세요.</p>"
		}
		'welcome/2':      PageText{
			title: '이 투어 사용법'
			body:  '<p>각 페이지는 왼쪽에 텍스트 열, 오른쪽에 코드 열이 있습니다. 그 사이에 드래그 핸들이 있어 코드에 더 많은 공간을 줄 수 있습니다.</p>'
		}
		'welcome/3':      PageText{
			title: '오프라인 V (선택)'
			body:  '<p>이 투어를 사용하기 위해 로컬 V 설치가 필요하지는 않지만 권장됩니다.</p>'
		}
		'welcome/4':      PageText{
			title: '샌드박스'
			body:  '<p>프로그램은 서버의 샌드박스에서 실행됩니다.</p>'
		}
		'welcome/5':      PageText{
			title: '축하합니다!'
			body:  "<p>투어의 첫 번째 모듈을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/basics/1'>언어 기초</a>로 바로 계속하세요.</p>"
		}
		'basics/1':       PageText{
			title: '모듈'
			body:  "<h2>모듈</h2>
<p>각 V 파일은 자신이 속한 <em>모듈</em>을 선언한다. 선언은 파일의 첫머리에 온다.</p>
<p>프로그램은 <code>main</code>이라는 모듈의 <code>main</code>이라는 함수에서 시작한다.</p>
<p>이 프로그램은 표준 라이브러리 모듈 <code>math</code>와 <code>strings</code>를 사용한다.</p>
<p>V에서는 디렉터리마다 하나의 모듈이 있고, 모듈 이름은 디렉터리와 일치한다. 심볼은 <code>pub</code> 표시가 있어야 모듈 밖에서 보인다.</p>"
		}
		'basics/2':       PageText{
			title: '임포트'
			body:  "<h2>임포트</h2>
<p>임포트한 모듈은 내보낸 이름들을 현재 파일로 가져온다.</p>
<p>표준 라이브러리는 모듈 이름으로 임포트한다: <code>import math</code>, <code>import strings</code>. 서드파티 라이브러리도 마찬가지다.</p>
<p>모듈의 모든 동작이 함수 호출로 쓰이지는 않는다. 값에 대한 _메서드_인 것도 있어, <code>s.to_upper()</code>는 임포트 없이 문자열에 작용한다.</p>
<p>두 스타일이 표준 라이브러리 전반에 보이므로, 추측 말고 시그니처를 읽을 가치가 있다.</p>"
		}
		'basics/3':       PageText{
			title: '변수'
			body:  "<h2>변수</h2>
<p>코드를 실행하라. 오류 메시지에 주목하라.</p>
<p>V 변수는 <code>:=</code>로 선언한다. 대부분 언어와 달리, V 변수는 기본적으로<em>불변</em>이며, 가변성은 명시히 요구해야 한다.</p>
<p>컴파일러도 같은 말을 한다. 6행은 허락 없이 <code>sum</code>에 대입하려 한다.</p>
<p>오류를 고치려면 4행 선언에 <code>mut</code>을 더하고 다시 시도하라.</p>"
		}
		'basics/4':       PageText{
			title: '가변 변수'
			body:  "<h2>가변 변수</h2>
<p>가변 변수를 선언하려면 이름 앞에 키워드 <code>mut</code>을 붙여라.</p>
<p>V가 이를 요구하는 것은 변경이 의도되어야 하기 때문이다. 다시 대입되지 않는 변수는 컴파일러가 추론하기 쉽고, 나중에 코드로 돌아온 당신에게도 쉽다.</p>
<p><code>mut</code>을 빼고 다시 실행하라. 앞 페이지의 오류이다.</p>
<p><code>mut</code>은 함수 매개변수와 구조체 필드를 포함해 V 도처에서 보인다.</p>"
		}
		'basics/5':       PageText{
			title: '짧은 선언'
			body:  "<h2>짧은 선언</h2>
<p><code>:=</code>은 변수를 선언하고 값에서 타입을 추론한다.</p>
<p>타입이 분명치 않거나 명확히 하고 싶으면, <code>i64(42)</code>나 <code>f64(1.5)</code> 같은 _변환_으로 직접 이름 붙여라.</p>
<p>«지금 선언하고 나중에 대입»의 별도 형태는 없다. V 변수는 스코프에 들어서는 시점에 항상 값이 있으므로, 뒤 페이지에서 만날 제로 값은 당신이 아닌 컴파일러가 만든다.</p>"
		}
		'basics/6':       PageText{
			title: '함수'
			body:  "<h2>함수</h2>
<p>함수는 <code>fn</code>으로 선언한다.</p>
<p>함수는 0개 이상의 매개변수를 취할 수 있다. 매개변수는 이름과 타입으로 쓰고, 같은 타입의 연속 매개변수는 <code>x, y int</code>로 쓴다.</p>
<p>함수 결과는 매개변수 목록 뒤에 이름 붙는다. V 함수는 반환 타입이 튜플이 아닌 한 정확히 하나의 값을 반환한다.</p>
<p>본문이 단일 식인 함수는 한 줄로 쓸 수 있다: <code>fn double(x int) int { return x * 2 }</code></p>"
		}
		'basics/7':       PageText{
			title: '여러 반환 값'
			body:  "<h2>여러 반환 값</h2>
<p>함수는 둘 이상의 값을 반환할 수 있다. 반환 타입을 튜플로 써라:</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>호출자는 결과를 변수에 분해한다:</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>반환 타입은 각 값을 그저 나열하고, 호출자는 그것들을 변수에 분해한다. 필요 없는 값은 <code>_</code>로 무시하라.</p>
<p>이것이 실패할 수 있는 일에 보이는 형태이며, 뒤 모듈에서 다룬다.</p>"
		}
		'basics/8':       PageText{
			title: '기본 타입'
			body:  "<h2>기본 타입</h2>
<p>불리언 값은 <code>true</code>와 <code>false</code>이다.</p>
<p>정수는 고정 크기다: <code>i8</code>, <code>i16</code>, <code>i32</code>, <code>i64</code>, 부호 없는 크기는 <code>u8</code>부터 <code>u64</code>까지. <code>int</code> 자체는 32비트이며, <code>isize</code>가 플랫폼 너비다. 너비가 중요하면 <code>i32</code>나 <code>i64</code>을 이름 붙여라.</p>
<p>부동소수점 타입은 <code>f32</code>와 <code>f64</code>이다.</p>
<p><code>rune</code>은 유니코드 코드 포인트를 담는다.</p>
<p>문자열은 불변이며 작은따옴표로 쓴다.</p>"
		}
		'basics/9':       PageText{
			title: '제로 값'
			body:  "<h2>제로 값</h2>
<p>각 타입에는<em>제로 값</em>이 있어, 변수가 아무것도 대입되기 전에 들고 있는 값이다.</p>
<p>제로 값은 수에 <code>0</code>, 불리언에 <code>false</code>, 문자열에 빈 문자열, 배열·슬라이스·맵에 빈 컬렉션이다.</p>
<p>구조체에서는 제로 값이 모든 필드를 제로 값으로 가진 구조체이다.</p>
<p>V는 선언 지점에 값을 요구하므로 직접 쓸 일은 드물다. 컴파일러가 대신 만들므로, 오른쪽이 군더더기 같아도 예제는 컴파일된다.</p>"
		}
		'basics/10':      PageText{
			title: '상수'
			body:  "<h2>상수</h2>
<p><code>const</code>는 컴파일러가 프로그램을 만들 때 아는 값이므로, 상수 식이어야 한다.</p>
<p>상수는 <code>const</code>로 쓰고, 하나씩 또는 괄호로 묶어 쓴다.</p>
<p>일부 언어의 <code>final</code>과 달리, <code>const</code> 이름을 변수에 재사용해도 컴파일러 경고만 나온다. 그 경고를 오류로 다뤄라: 이름이 상수면 어디서든 상수여야 한다.</p>"
		}
		'basics/11':      PageText{
			title: '타입 변환'
			body:  "<h2>타입 변환</h2>
<p>V는 타입을 암시적으로 변환하지 않는다. 하나에서 다른 하나로 가는 것은 항상 쓴다:</p>
<pre><code>fl := f64(i)</code></pre>
<p>어떤 변환은 정보를 잃고 어떤 것은 정면으로 거부되므로, 변환이 무의미하면 컴파일러가 말해준다.</p>
<p>문자열은 수가 아니다. 하나를 수로 읽으려면 변환하고, 텍스트가 파싱되지 않으면 결과가 제로 값일 수 있음을 기억하라.</p>
<p><code>typeof(x).name</code>으로 타입 이름을 컴파일러에 물을 수도 있다.</p>"
		}
		'basics/12':      PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/controlflow/1'>제어 흐름</a>으로 계속하세요.</p>"
		}
		'basics/13':      PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/controlflow/1'>제어 흐름</a>으로 계속하세요.</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  "<h2>For</h2>
<p>V의 루프 키워드는 하나이며 세 가지 형태로 온다.</p>
<p>세는 형태는 C와 같다:</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>단독 조건은 while 루프이며, 조건 없으면 영원히 돈다.</p>
<p><code>break</code>는 루프를 나가고 <code>continue</code>는 다음 반복으로 뛴다.</p>
<p>3까지 세는 대신 5부터 거꾸로 세도록 고쳐 다시 실행하라.</p>"
		}
		'controlflow/2':  PageText{
			title: 'For는 V의 "while"'
			body:  "<h2>For는 V의 “while”</h2>
<p>단일 조건의 <code>for</code>는 그 조건이 거짓이 될 때까지 돈다.</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p>조건 없는 <code>for</code>는<em>무한 루프</em>이다:</p>
<pre><code>for {</code></pre>
<p>예제는 세 번 돈 뒤 두 번째 루프를 나간다. <code>if</code>와 <code>break</code>를 지우면 CPU 시간을 다 쓸 때 샌드박스가 프로그램을 멈춘다.</p>"
		}
		'controlflow/3':  PageText{
			title: 'For 계속'
			body:  "<h2>For 계속</h2>
<p>컬렉션을 도는 데는 인덱스 대신 <code>in</code>을 쓴다. 범위를 벗어날 수 없으므로 기본으로 손이 가야 할 형태이다.</p>
<pre><code>for i, v in items {</code></pre>
<p>인덱스를 무시하려면 <code>_</code>를 써라:</p>
<pre><code>for _, v in items {</code></pre>
<p>알고 있는 횟수만큼 돌리려면 범위를 써라: <code>for i in 0 .. n</code>. <code>..</code>는 배타적임에 유의하라: <code>n</code>번, <code>0</code>부터 <code>n-1</code>까지 돈다.</p>
<p>맵은 키와 값을 준다.</p>"
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  "<h2>If</h2>
<p><code>if</code>는 이렇게 쓴다:</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>조건을 감싸는 괄호도 <code>then</code> 키워드도 없다.</p>
<p><code>if</code>는 값을 반환할 수 있는 식이므로 위 형태가 관용적이다: 흥미로운 경우를 처리하고 일찍 반환한 뒤 보통으로 내려가라.</p>
<p>검사 체인에는 <code>else if</code>를 써라. V는 각 가지를 액면 그대로 받으므로, 체인은 직접 확인하라: 검사가 참이 될 수 없는 가지는 그저 돌지 않으며, 컴파일러는 그것을 가리키지 않는다.</p>"
		}
		'controlflow/5':  PageText{
			title: '언래핑 값이 있는 If'
			body:  "<h2>언래핑 값이 있는 If</h2>
<p>V 함수는 값 <em>또는</em> 오류를 반환할 수 있다. 반환 타입은 앞에 <code>!</code>을 붙여 쓴다:</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>본문 안에서는 순수한 값을 <code>return</code>하면 V가 감싸준다. 실패하려면 대신 <code>error(...)</code>를 반환하라.</p>
<p>호출 지점에서 <code>if</code>는 결과를 풀 수 있다. 성공 값은 <code>v</code>에 묶이고, 오류가 있으면 <code>else</code> 가지가 <code>err</code>에 묶인 오류로 돈다:</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>두 번 실행하라. 첫 호출은 성공하고 두 번째는 실패하며, 둘 다 기대 가지로 간다.</p>
<p>대부분 V 코드는 잘못될 수 있는 일을 이렇게 다룬다. <a href='/optionresult/1'>다음 모듈</a>이 제대로 다룬다.</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  "<h2>Match</h2>
<p>V에 <code>switch</code> 키워드는 없다. <code>match</code>가 있어 일반 switch보다 많은 경우를 다룬다.</p>
<p>값에 매치:</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>범위에 매치. <code>match</code>의 범위는 양끝 모두<em>포함</em>이며, <code>for</code>에서 쓰는 <code>..</code>와 반대이다:</p>
<pre><code>1 ... 3 { }</code></pre>
<p>enum에 매치. 각 값은 가지를 필요로 한다. 그렇지 않으면 <code>match</code>에 <code>else</code>를 필요로 한다. 컴파일러가 업데이트할 각 <code>match</code>를 가리키지 않고 값을 더할 수 없다.</p>"
		}
		'controlflow/7':  PageText{
			title: 'Match와 합 타입'
			body:  "<h2>Match와 합 타입</h2>
<p><em>합 타입</em>은 <code>=</code>와 대안 목록으로 선언한다:</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>그 타입의 값은 정확히 대안 중 하나이며, 둘 이상이 아니다.</p>
<p>매치하면 어느 것인지 안다. 가지 안에서는 원래 변수가 그 변종으로<em>스마트 캐스트</em>되므로, 필드를 캐스트 없이 직접 쓸 수 있다.</p>
<p>각 대안은 가지를 필요로 하며, 아니면 match에 <code>else</code>가 필요하다. 컴파일러가 강제하므로 새 대안을 조용히 무시할 수 없다.</p>
<p>합 타입에 네 번째 도형을 더해 실행하라. 빠뜨린 <code>match</code> 문을 컴파일러가 정확히 말해준다.</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  "<h2>Defer</h2>
<p><code>defer</code>는 감싸는 블록이 나갈 때 실행할 문을 예약한다.</p>
<p>블록이 어떻게 나가든 실행된다: 끝에 닿아도, 일찍 <code>return</code>해도, panic 풀기 중에도. 정리에 유용한 이유이다.</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>예제에서 <code>with_defer</code>는 본문을 실행한 뒤 지연 문을 실행한다. <code>early_return</code>은 중간에 반환하지만 지연 문은 그래도 실행된다.</p>"
		}
		'controlflow/9':  PageText{
			title: '연습: 루프와 함수'
			body:  "<h2>연습: 루프와 함수</h2>
<p><code>sum_to</code>가 <code>0</code>부터 <code>n</code>까지 수의 합을 반환하도록, <code>sum_squares</code>가 그 제곱의 합을 반환하도록 써라.</p>
<p>두 번 하라: 한 번은 가장 직접적으로, 한 번은 명시 <code>for</code> 루프로.</p>
<p>그런 다음 둘 다 <em>O(1)</em> 시간에 돌도록 고쳐 써라.</p>
<p>시도했거나 막히면 <b>Solution</b>을 눌러라.</p>"
		}
		'controlflow/10': PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/moretypes/1'>더 많은 타입</a>으로 계속하세요.</p>"
		}
		'moretypes/1':    PageText{
			title: '구조체'
			body:  "<h2>구조체</h2>
<p><em>구조체</em>는 값을 하나의 이름 아래 묶는다. V가 «이것들은 함께다»라고 말하는 방식이다.</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>값은 <code>Point{ x: 3, y: 4 }</code>로 만들고 필드는 <code>p.x</code>로 읽는다.</p>
<p>주목할 두 가지.</p>
<p>첫째, 구조체는 스스로 출력할 수 있어 <code>println(p)</code>는 별다른 작업 없이 모든 필드를 보여준다.</p>
<p>둘째, 가변성은 일반 변수와 같이 동작한다. 변수에 <code>mut</code>이 필요하다:</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>그리고 필드 자체는 구조체 안에서 <code>mut</code> 아래 선언되어야 한다:</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p><code>mut</code> 아래 있지 않은 필드에는 전혀 대입할 수 없다. 읽고 전달하고 복사할 수 있다.</p>
<p>구조체에서 <code>mut:</code>을 빼고 예제를 실행하라. 컴파일러가 <code>x</code>에 대입하는 행을 가리킨다.</p>"
		}
		'moretypes/2':    PageText{
			title: '배열'
			body:  "<h2>배열</h2>
<p>배열은 길이가 고정되고 원소 타입은 첫 원소에서 온다:</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>배열은 길이와 초깃값으로도 만들 수 있다:</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>배열은 <code>[]</code>로 인덱싱하고 길이를 가진다:</p>
<pre><code>println(numbers.len)</code></pre>
<p>두 값이 내용을 공유하면 안 되면 <code>clone</code>으로 명시 복사를 요구하라:</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>바꾸면 안 되는 상대에게 컬렉션을 넘길 때 써라. 외워야 할 규칙에 기대지 않고 사용점에서 말하기 때문이다.</p>
<p>흔한 변환은 자유 함수가 아닌 메서드다:</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code>은 현재 원소다.</p>"
		}
		'moretypes/3':    PageText{
			title: '슬라이스'
			body:  "<h2>슬라이스</h2>
<p>슬라이스는 배열이나 다른 슬라이스 구간에 대한 보기이며, 같은 <code>[]</code> 문법으로 쓴다:</p>
<pre><code>part := arr[1..3]</code></pre>
<p>슬라이스는 빈 상태에서 만들어 키울 수도 있다. 키우면 데이터가 옮겨갈 수 있어 변수는 <code>mut</code>이어야 한다:</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code>은 추가한다. 모든 슬라이스에 동작하며, 고정 크기 배열에서는 실행 시간의 놀람 대신 컴파일 오류가 난다.</p>
<p>다른 슬라이스를 자르면 그 슬라이스가 나온다. 배열처럼, 독립 복사가 필요하면 <code>clone</code>:</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>구간은<em>배타적</em>임에 유의하라: <code>0 .. n</code>은 <code>n</code>번 돈다. <code>for</code> 문은 이 형태만 받는다. <code>match</code> 안의 구간은 <code>...</code>로 쓰고 양끝 모두 포함적이다.</p>"
		}
		'moretypes/4':    PageText{
			title: '맵'
			body:  "<h2>맵</h2>
<p>맵은 키와 값의 쌍을 들고 리터럴로 쓴다:</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>값 타입은 추론된다. 키를 더하고 있는지 묻기:</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>없는 키를 찾으면 <em>제로 값</em>이 나오므로, 없음과 0을 가려야 하는 조회는 <code>or</code>를 쓴다:</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>돌리면 키와 값을 준다:</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>맵은 참조 타입이라순수한 대입은 한 맵에 두 이름을 남긴다. <code>clone</code>이 독립된 것을 얻는 법이다:</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p><code>clone</code> 없이 컴파일러는 맵을 복사할 수 없다고 말하고 <code>move</code>·<code>clone</code>·참조 중 고르라 한다. 그 질문이 요점이다: 실수로 맵을 공유하기 쉬우므로 V는 어느 쪽인지 말하게 한다.</p>"
		}
		'moretypes/5':    PageText{
			title: '문자열'
			body:  "<h2>문자열</h2>
<p>V 문자열은 바이트의 나열이라 직접 결과가 하나 있다: 인덱싱은 바이트를 주고 <code>.len</code>은 바이트를 센다.</p>
<pre><code>println(s[0])</code></pre>
<p>ASCII에는 정확하고 나머지는 틀리므로 <code>.runes()</code>가 있다. 대신 문자를 걷는다:</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>문자열은 불변이므로 그 위의 각 메서드는 새 문자열을 반환한다:</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>이것들은 모듈 안 함수가 아닌 메서드라 임포트할 것이 없다. 일부 연산은 <code>strings</code>에 사는데, 특히 빌더:</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>루프에서 긴 문자열을 만들 때 반복 <code>+</code> 대신 빌더를 써라.</p>"
		}
		'moretypes/6':    PageText{
			title: '메서드'
			body:  "<h2>메서드</h2>
<p>메서드는 <em>리시버</em> 있는 함수다: 호출되는 값.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>리시버 타입은 메서드 이름 앞에 오고, 메서드는 <code>p.sum()</code>으로 호출된다.</p>
<p><code>&amp;</code> 없는 리시버는 <em>복사</em>라서 메서드가 원본을 바꿀 수 없다. 뚫고 쓰려면 리시버를 참조로 선언하고 <code>mut</code>으로 하라:</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>이 구분이 V 메서드 이야기의 전부이며, 일반 값에서 본 구분과 같다: 대입은 값을 주고, 참조는 이름으로 요구하는 것이다.</p>
<p>메서드가 리시버를 정말 바꿔야 하는 게 아니면 값 리시버를 잡아라. 읽기만 하는 메서드는 바꿀 수 없어야 한다.</p>"
		}
		'moretypes/7':    PageText{
			title: '연습: 단어 개수'
			body:  "<h2>연습: 단어 개수</h2>
<p><code>word_count</code>을 구현해 문자열에 각 단어가 몇 번 나오는지 세어라.</p>
<p>단어는 글자가 아닌 것으로 구분되고, 세기는 대소문자에 무관해야 한다. <code>map[string]int</code>을 써라.</p>
<p>돌아가면 출력을 맵이 걷는 대로가 아닌 정렬해서 내라.</p>
<p>시도했거나 막히면 <b>Solution</b>을 눌러라.</p>"
		}
		'moretypes/8':    PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/optionresult/1'>부재와 실패 처리</a>로 계속하세요.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>V는 많은 언어가 섞는 두 상황을 가르고 각각에 타입을 준다.</p>
<p><code>?T</code>는 값 또는 <em>none</em>이다. 돌려줄 것이 없고 잘못된 것도 없을 때 쓴다: 아무것도 찾지 못한 검색, 후보가 떨어진 탐색.</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>option은 <code>or</code>로 풀며, none 경우의 값을 준다:</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>또는 <code>if</code>로, 대신 다른 가지를 돈다:</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>변수는 값이 있는 가지에서만 묶인다. <code>else</code> 가지에서는 option이 <code>none</code>이었다.</p>
<p>option은 의식 없이 합성된다. <code>?int</code>를 반환하는 함수는 다른 함수의 option을 직접 반환할 수 있다:</p>
<pre><code>n := name?.len</code></pre>
<p>그 <code>?</code>는 «none이면 이 함수에서도 none을 반환하라»는 뜻이다. 값을 전하는 것과 기본을 지어내는 것의 차이이며, 위 본문이 풀 필요가 없는 이유이다.</p>
<p>option을 출력하면 어느 쪽을 가졌는지 보여주므로, 무엇이 잘못됐는지 파악하는 동안 <code>Option(3)</code>과 <code>Option(none)</code>은 스스로 말한다.</p>"
		}
		'optionresult/2': PageText{
			title: 'Result와 오류'
			body:  "<h2>Result와 오류</h2>
<p>option은 아무것도 없다고 말한다. <code>!T</code>는 뭔가 <em>실패했다</em>고 말하며 경위를 담은 메시지를 가진다.</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>순수한 값을 반환하는 데 풀 필요가 없다. V가 감싼다. <code>error(...)</code>를 반환하면 실패를 만든다. 계약의 전부이다.</p>
<p>호출 지점은 option과 같은 모양이며, <code>else</code> 가지에 <code>err</code>을 묶는다:</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code>는 메시지 자체를 주며, 오류 타입이 주변에 덧붙인 것은 없다. 두 형태가 예제에 쓰였다.</p>
<p>전파는 option과 같이 동작한다. <code>parse_pair</code> 안의 각 호출의 <code>!</code>에 유의하라: 절반이 실패하면 전체가 실패하고 메시지는 따라간다.</p>
<p>표준 라이브러리는 도처에서 이 약속을 따르므로, <code>json2.decode</code>는 당신의 JSON이 어디서 잘못됐는지 말할 수 있다:</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>둘 중 고르는 규칙은 짧다. 아무것도 찾지 못했으면 option. 뭔가 시도해 안 됐으면 result. 자신이 일으키지 않은 실패를 넘겨야 하는 함수는 기본으로 뭉개지 말고 <code>?</code>나 <code>!</code>로 전하라.</p>"
		}
		'optionresult/3': PageText{
			title: '연습: Options'
			body:  "<h2>연습: Options</h2>
<p>네 함수를 써라. 각각 option을 반환한다.</p>
<p><code>second_largest</code>는 슬라이스에서 두 번째로 큰 <em>다른</em> 값을 반환하며, 없으면 none이다. 반복되는 최대는 세지 않으므로 <code>[5, 5]</code>에는 두 번째가 없다.</p>
<p><code>first_word</code>는 문자열의 첫 낱말을 반환하며, 비었으면 none이다.</p>
<p><code>sum_all</code>은 option 슬라이스를 취해 int를 반환하며, none은 건너뛴다.</p>
<p>다음 입력을 요약하는 <code>describe_all</code>. 풀기가 전혀 없도록 <code>?</code> 전파로 써라.</p>
<p>시도했거나 막히면 <b>Solution</b>을 눌러라.</p>"
		}
		'optionresult/4': PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/methods/1'>메서드와 인터페이스</a>로 계속하세요.</p>"
		}
		'methods/1':      PageText{
			title: '인터페이스'
			body:  "<h2>인터페이스</h2>
<p>V에 클래스는 없다. 메서드가 있는 구조체가 전부이며, 대부분 프로그램에는 그것으로 충분하다.</p>
<p><em>인터페이스</em>는 메서드 목록이다. 타입은 그것들을 가짐으로써 구현한다: 쓸 키워드도 선언할 것도 없다.</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p><code>Dog</code>과 <code>Cat</code>이 모두 <code>speak</code> 메서드를 가지면, 둘 다 <code>Speaker</code>가 필요한 곳에 전달될 수 있다:</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>구현이 암시적이므로 나중에 타입을 더해도 인터페이스는 동작한다. 세 번째 화자는 <code>announce</code>의 변경도 인터페이스의 변경도 필요 없다.</p>
<p>인터페이스의 슬라이스가 대개 원하는 것이지, 하나의 구체 타입의 슬라이스가 아니다:</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>지킬 두 규칙. 인터페이스는 작게 유지하라: 한두 메서드는 추상이 진짜라는 표시이며, 다섯은 대개 구체 타입을 복사했다는 뜻이다. 인터페이스는 구현 옆이 아니라 <em>쓰는</em> 곳에 선언하라. V는 둘 다 요구하지 않지만, 독자는 소비하는 함수에서 찾는다.</p>"
		}
		'methods/2':      PageText{
			title: '임베딩'
			body:  "<h2>임베딩</h2>
<p>구조체는 다른 구조체를 끼워 넣을 수 있으며,그대로의 타입 이름으로 쓴다:</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>끼워진 구조체의 필드는 바깥의 필드가 되고, 메서드는 따라온다. <code>u.id</code>와 <code>u.name</code>은 모두 그저 <code>User</code>의 필드이며, <code>u.describe()</code>는 <code>Base</code>에서 온 메서드이다.</p>
<p>이렇게 공통 필드와 공통 메서드를 한 번 쓴다. <em>인터페이스</em>를 끼워 넣어도 되며, 타입이 필드 대신 동작을 갖는방식이다.</p>
<p>놀라운 규칙이 하나 있어, 아픈눈으로 배울 가치가 있다. 끼워진 구조체는 바깥 타입의구성원을 물려받지만, 바깥 타입 자체의 메서드에는 닿지 <em>않는다</em>. 따라서 <code>Base</code> 위의 메서드는 그것을 끼워 넣는 구조체에 속한 <code>area()</code>를 호출할 수 없다.</p>
<p>한 함수가 여러 타입에 걸쳐 일해야 하면 대신 인터페이스를인수로취하라:</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>끼워 넣기는 타입과 부품 사이에 상태와 동작을 공유하기 위한 것이다. 인터페이스는 무관계한 여러 타입에 대해 한 번 쓰기 위한 것이다. 다른 물음에 답하므로 갈라둘 가치가 있다.</p>"
		}
		'methods/3':      PageText{
			title: '출력 가능한 타입'
			body:  "<h2>출력 가능한 타입</h2>
<p>V는 값을 필드 반사로 출력하지 않고 그 <code>str</code> 메서드로 출력한다. 그래서 타입은 하나를 정의해 보이는 모양을 제어한다:</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>이후 <code>println(t)</code>도 문자열 보간도 결합도 그것을 쓴다:</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>가장 자주 쓸 메서드이며, 일찍 쓸 가치가 있다: 현명하게 스스로를 출력하는 타입은 이후의 모든 디버그를 쉽게 한다.</p>
<p>이것은 출력에만 영향을 준다. 달리 <code>string</code>이 기대되는 곳에서는 <code>.str()</code>를 불러 명시적으로 넘겨라: <code>str</code> 메서드 있는 타입은 어디까지나 자신의 타입이며, 컴파일러는 너를 위해 변환하지 않는다.</p>"
		}
		'methods/4':      PageText{
			title: '연습: 도형'
			body:  "<h2>연습: 도형</h2>
<p>쓸 것 네 가지.</p>
<p><code>Square</code>와 <code>Triangle</code>에 <code>area</code> 메서드를 주고, <code>total_area</code>가 인터페이스를 통해 도형 슬라이스를 합산하게 하라.</p>
<p>다음 어떤 모양인지 모른 채 도형의 이름과 넓이를 보고하는 <code>describe(s Shape)</code>를 쓰라.</p>
<p>마지막에 함정이 있고, 찾는 것이 연습의 대반이다. <code>describe</code>를 <code>Base</code>에 두면 모든 도형이 상속받는다고 유혹된다. 그것은 동작하지 않고, 컴파일러가 이유를 말해준다.</p>
<p>시도했거나 막히면 <b>Solution</b>을 눌러라.</p>"
		}
		'methods/5':      PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/generics/1'>제네릭</a>으로 계속하세요.</p>"
		}
		'generics/1':     PageText{
			title: '제네릭 함수'
			body:  "<h2>제네릭 함수</h2>
<p>타입 매개변수는 타입을 대신하므로, 하나의 선언이 타입의 온 가족에 봉사할 수 있다. V는 각괄호로 쓰며, 외울 가치 있는 유일한 구문이다:</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>꺾쇠는 여기서 <em>구문이 아니다</em>. <code>fn max_of&lt;T&gt;(...)</code>로 쓰면 다른 철자가 아닌 파싱 오류이며, 먼저 바로잡을 일이다.</p>
<p>타입 인수를 이름 붙이는 일은 드물다. 컴파일러가 인수에서 추론하고, 변수를 리터럴만큼 읽는다:</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>타입 매개변수는 컴파일러가 스스로 추론 못 하는 데만 필요하다. 반환 자리에서는 흔히 그게 요점이다:</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>그 <code>?T</code>는 앞 과정에서와 정확히 같은 뜻이다: 값 또는 none, 이번 구체화가 무슨 타입이든.</p>
<p>콜백은 함수 타입으로 쓰므로 <code>fn (T) R</code>이다. 입력 타입과 출력 타입을 독립시켜, 한 함수를 파이프로 만든다:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>하나의 선언과, 받은 인수 타입마다 별도 구체화. boxing도 소거도 없다: <code>int</code> 콜백의 <code>apply</code>와 <code>string</code> 콜백의 것은 다른 함수이므로, 콜백 타입은 추측 말고 써야 하는 이유이다.</p>"
		}
		'generics/2':     PageText{
			title: '제네릭 구조체'
			body:  "<h2>제네릭 구조체</h2>
<p>구조체는 함수처럼 타입 매개변수를 취하고, 그것을 언급하는 각 필드는 구체화에 속한다:</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>따라서 <code>Stack[int]</code>는 <code>[]int</code>를 들고 <code>Stack[string]</code>은 <code>[]string</code>을 들고, 둘은 다른 타입이다. 타입을 어딘가 지우지 않고 <code>int</code> 쌓음과 <code>string</code> 쌓음을 한 슬라이스에 담을 수 없다는 뜻이므로 곰곰할 가치 있다.</p>
<p>메서드도 매개변수를 진다. 리시버의 <code>mut</code>이 메서드에 구조체를 바꾸게 하며, <code>&amp;</code>는 읽기만 한다고 말한다:</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p><code>?T</code>는 같이 매개변수화된 option 타입이라 빈 쌓음에서 꺼내면 panic 대신 <code>none</code>이 나온다.</p>
<p>두 매개변수는 같은 생각 두 번이며 서로 독립이다:</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>사람을 잡는 상한이 여기 있어, 보고 있는 메서드를 오류문이 가리키지 않으므로 정확할 가치 있다. <code>A</code>와 <code>B</code>는 관계가 없어,둘 사이에 내놓을 변환은 없고, 메서드는 값을 한 필드에서 다른 필드로 옮길 수 없다:</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>이유는 쌍보다 제네릭 메서드의 성질이며, 외우기보다 이해할 가치 있다. 제네릭 메서드 본문은 쓰이는 <em>매</em> 구체화에 검사되므로 한 번에 모두에 유효해야 한다. <code>Pair[int, int]</code>에서는 두 필드가 한 타입을 들어서 좋고, <code>Pair[string, int]</code>이 쓰자마자 거부되는 이유이다. 오류는 선언이 아닌 위반 구체화를 이름 붙인다:</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>잡을 규칙은 제네릭 메서드는 구체화될 각 타입에 참인 것만 약속할 수 있다는 것이다. 두 필드를 읽는 것은 항상 적격하므로 <code>describe</code>는 각 구체화에 동작한다:</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: '제네릭 타입의 맵'
			body:  '<h2>제네릭 타입의 맵</h2>'
		}
		'generics/4':     PageText{
			title: '여러 타입 매개변수'
			body:  '<h2>여러 타입 매개변수</h2>'
		}
		'generics/5':     PageText{
			title: '연습: 제네릭'
			body:  '<h2>연습: 제네릭</h2>'
		}
		'generics/6':     PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/concurrency/1'>동시성</a>으로 계속하세요.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p><code>spawn</code>은 스레드를 일으키고 즉시 돌아온다. 핸들을 주고, 나중에 스레드를 기다리는 방법이 핸들이다:</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> 자체는 아무것도 기다리지 않는다. 스레드가 일하는 동안 끝나는 측은 쓰기 한복판에 두고 가므로, 각 spawn은 언젠가 기다리는 것이 규칙이다.</p>
<p>고정된 일 묶음에는 핸들을 슬라이스에 모아라. 원소 타입은 <code>thread</code>이며, 슬라이스 위의 <code>wait()</code>가 모두 합친다:</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>일꾼이 뭔가 반환하면 슬라이스는 <code>[]thread int</code>이며, <code>wait()</code>는 결과를 순서대로 건넨다:</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>순서는 정확할 가치 있다. 결과는 핸들을 더한 순서대로 돌아오지, 스레드가 끝난 순서대로가 아니다. 답을 모으는 방법이지 일에 순서를 매기는 방법이 아니다. 어느 스레드가 먼저 찍는지에 측은 기대지 말아야 하며, 예제의 얽힌 출력이 그 정직판이다.</p>"
		}
		'concurrency/2':  PageText{
			title: '채널'
			body:  "<h2>채널</h2>
<p>채널은 한 타입의 값을 한 스레드에서 다른 스레드로 옮긴다. 원소 타입과 용량으로 만들고, 보내고 받기를 같은 화살로 한다:</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>양방향 모두 <code>&lt;-</code>이다. 둘 다 상대에게서 받기 때문이다. <code>ch.recv()</code>도 <code>ch.pop()</code>도 없다: 모르는 함수로彈く. 여기에 익숙한流儀があれば忘れるべき事である。</p>
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
<p>예제의 출력을 읽으면 악수가 보인다: 보내기와 받기가 엇갈리며, 믿을 고정 순서는 아니다. 이것이 무버퍼 채널의 요지이며 결함이 아니다.</p>
<p>채널은 정확히 한 타입을 나르므로, 두 가지 메시지를 기다리면 두 채널이다. 뒤의 <code>select</code>가 한 번에 둘 이상 기다리는流儀이다.</p>"
		}
		'concurrency/3':  PageText{
			title: '버퍼 채널'
			body:  "<h2>버퍼 채널</h2>
<p>용량이 채널에 자리를 주어, 보내는 측은 값마다 막히지 않고 앞서갈 수 있다:</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>차이는 잴 수 있다. 버퍼가 있으면 모든 보내기가 끝나고 <code>len()</code>은 기다리는 값을 알린다. 없으면 <code>len()</code>은 아무리 기다려도 0 그대로이다. 둘 곳이 없기 때문이다:</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>느린 먹는이를 보내는 측이 기다리지 말아야 할 때 버퍼를 골라라. 용량은 채널 만들 때 고정되고, 같은 원소 타입의 버퍼 있음과 없음은 다른 타입이다.</p>
<p>기억에 30초 값어치 함정이 여기 있다. 크기를 정하는 필드는 <code>cap:</code>이며, 대신 <code>len:</code>을 쓰면 조용 무시 대신 거부된다:</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>문장은 원하는 필드를 이름 붙이며, 거의 최선이다. 다른 함정은 맞춤법이 아니다. 버퍼는 용량까지만 돕는다: 둘 곳보다 보낼 것이 많으면 들어맞지 않는 첫 값에 막힌다. 네 칸 여섯 일에 먹는이가未起動なら、 다섯째 보내기는 움직이지 않는 먹는이를 기다린다. 목록째 버퍼하거나, 먼저 먹는이를 일으키거나이다.</p>"
		}
		'concurrency/4':  PageText{
			title: '닫힐 때까지 수신'
			body:  "<h2>닫힐 때까지 수신</h2>
<p><strong>V에 <code>for x in ch</code>는 없다.</strong> 채널은 모음이 아니므로 for 순환에标할 것이 없고, 컴파일러는 말한다:</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>채널을 辿れる言語에서 오면 이것이 먼저 틀리는 것이다. <code>&lt;-ch</code>로 받아, 채널을 끝까지 읽으려면 주지 않을 때까지 받아라:</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p><code>or</code>는 순환을 끝내는 값을 주며, 거꾸로 틀리기 쉬운 대목이다: <strong><code>or</code>는 채널이 닫히고 비었을 때만 발동한다.</strong> 안에 아무것도 없는 열린 채널에서는 <code>&lt;-ch or { -1 }</code>은 보내는 이를 기다리며 계속 막힌다. 겉보기와 달리 비차단 엿보기가 아니다.</p>
<p>보내기에 대해 아무도 말해주지 않으면 오후를 잡아먹을细部. 보내기 식은 화살에서 멈추므로, 오른쪽 계산값은 括弧가 필요하다:</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>없으면 컴파일러는 <code>ch &lt;- i</code>의產んだ void를 곱하려 들고, 화살을 똑바로 가리키지 않는 말투로 말한다.</p>
<p>만드는 이가 개수를 알려줬으면 순환은 군더더기다:</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>이素朴한 꼴에 날카로운 모서리 있다. 닫히고 빈 채널에서의素朴한 <code>&lt;-ch</code>는 막히지도 panic하지도 않는다: 원소 타입의<em>제로 값</em>을 매번 준다. 하나 더 달라고 하면 오류 대신黙った <code>0</code>이나 빈 문자열이나 제로 구조체를 얻는다:</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>개수가 확실치 않으면 <code>or</code>를 골라라, 기다리지 않고 들여다보려면 <code>try_pop</code>을 잡아라:</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: '닫기'
			body:  "<h2>닫기</h2>
<p>채널은 그 만드는 이가 다 쓰면 닫고, 만드는 이에게서 닫아라. 만드는 이는 채널을 멈춤 결정처럼 소유한다:</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>사람을 잡는细部：裸の <code>close</code> は通道の閉じ方ではない. 벌거벗은 호출로 쓰면 기술자를 닫는 붙박이이며, 채널에서는 어지러운 말로 실패한다：</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>닫아도 버퍼된 것을 버리지 않는다. 채널 안의 값은 먼저 순서대로 읽는 이에게 건네지고, 비어야 비로소 받기가 아무것도 찾지 못한다. 이 순서가 close를 있어야 할 신호로 만든다.</p>
<p>close가 안 하는 것은 보내기를 합법으로 만드는 것이다. 닫힌 채널에 보내기는 실행 시간 panic이며, 두 번 닫기도 그러하므로, 규칙은 소유하는 한 곳에서 채널마다 한 번 닫기이다.</p>
<p>close는 기다림도 아니다. 열린 빈 채널에서 받기는 언젠가 누가 닫든 계속 막힌다.</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':  PageText{
			title: '공유 상태'
			body:  '<h2>공유 상태</h2>'
		}
		'concurrency/8':  PageText{
			title: '대기 그룹'
			body:  '<h2>대기 그룹</h2>'
		}
		'concurrency/9':  PageText{
			title: '연습: 워커 풀'
			body:  '<h2>연습: 워커 풀</h2>'
		}
		'concurrency/10': PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했으며, 투어 전체를 마쳤습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 원하는 내용을 다시 읽거나 <a href='/welcome/1'>시작하기</a>에서 다시 시작하세요.</p>"
		}
		'cli/1':          PageText{
			title: '일상 명령'
			body:  '<h2>일상 명령</h2>'
		}
		'vpm/1':          PageText{
			title: '패키지'
			body:  '<h2>패키지</h2>'
		}
		'mcp/1':          PageText{
			title: '모델 컨텍스트 프로토콜'
			body:  '<h2>모델 컨텍스트 프로토콜</h2>'
		}
		'skills/1':       PageText{
			title: '스킬'
			body:  '<h2>스킬</h2>'
		}
	}
	ui:      {
		'site_title':       'V 투어'
		'toc':              '목차'
		'toggle_theme':     '테마 전환'
		'language':         '언어'
		'run':              '실행'
		'format':           '포맷'
		'reset':            '재설정'
		'solution':         '해답'
		'output':           '출력'
		'help':             '키보드 단축키'
		'help_close':       '닫기'
		'run_program':      '프로그램 실행'
		'next_page':        '다음 페이지'
		'prev_page':        '이전 페이지'
		'toggle_help':      '이 도움말 열기/닫기'
		'move_panes':       '패널 간 이동'
		'previous':         '이전'
		'next':             '다음'
		'resize_panes':     '패널 크기 조정'
		'page_of':          '\${number} / \${total}'
		'no_program':       '샌드박스에 테스트 프로그램이 없습니다.'
		'compile_failed':   '프로그램이 컴파일되지 않았습니다.'
		'could_not_reach':  '서버에 연결할 수 없습니다: '
		'could_not_format': '이 프로그램을 포맷할 수 없습니다.'
		'sandbox_busy':     '샌드박스가 사용 중입니다. 다시 시도하세요.'
		'too_large':        '요청이 너무 큽니다.'
		'no_compiler':      '샌드박스에 컴파일러가 없습니다.'
		'link_counterpart': '이 페이지를 \${language}로 읽기'
		'lang_other':       '다른 언어'
	}
}