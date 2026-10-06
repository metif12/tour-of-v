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
		'welcome/1':       PageText{
			title: '안녕, 세계'
			body:  "<p><a href='https://vlang.io'>V 프로그래밍 언어</a> 투어에 오신 것을 환영합니다.</p>
<p>투어는 모듈로 나뉘어 있습니다. <a href='/list'>목차</a> 또는 오른쪽 상단의 메뉴 버튼에서 접근할 수 있습니다.</p>
<p>투어 전체에서 슬라이드와 연습 문제를 만날 수 있습니다. 텍스트 아래의 <b>이전</b> 및 <b>다음</b> 링크 또는 <code>PageUp</code> 및 <code>PageDown</b> 키로 탐색하세요.</p>
<p>투어는 인터랙티브입니다. <b>실행</b>(또는 <code>Shift</code>+<code>Enter</code>)을 눌러 프로그램을 컴파일하고 실행하세요. 결과가 코드 아래에 표시됩니다.</p>
<p>이 프로그램들은 여러분만의 실험을 위한 출발점입니다. 프로그램을 편집하고 다시 실행해 보세요.</p>"
		}
		'welcome/2':       PageText{
			title: '이 투어 사용법'
			body:  '<p>각 페이지는 왼쪽에 텍스트 열, 오른쪽에 코드 열이 있습니다. 그 사이에 드래그 핸들이 있어 코드에 더 많은 공간을 줄 수 있습니다.</p>'
		}
		'welcome/3':       PageText{
			title: '오프라인 V (선택)'
			body:  "<p>이 투어를 사용하기 위해 로컬 V 설치가 필요하지는 않지만 권장됩니다.</p>"
		}
		'welcome/4':       PageText{
			title: '샌드박스'
			body:  '<p>프로그램은 서버의 샌드박스에서 실행됩니다.</p>'
		}
		'welcome/5':       PageText{
			title: '축하합니다!'
			body:  "<p>투어의 첫 번째 모듈을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/basics/1'>언어 기초</a>로 바로 계속하세요.</p>"
		}
		'basics/1':        PageText{
			title: '모듈'
			body:  '<h2>모듈</h2>'
		}
		'basics/2':        PageText{
			title: '임포트'
			body:  '<h2>임포트</h2>'
		}
		'basics/3':        PageText{
			title: '변수'
			body:  '<h2>변수</h2>'
		}
		'basics/4':        PageText{
			title: '가변 변수'
			body:  '<h2>가변 변수</h2>'
		}
		'basics/5':        PageText{
			title: '짧은 선언'
			body:  '<h2>짧은 선언</h2>'
		}
		'basics/6':        PageText{
			title: '함수'
			body:  '<h2>함수</h2>'
		}
		'basics/7':        PageText{
			title: '여러 반환 값'
			body:  '<h2>여러 반환 값</h2>'
		}
		'basics/8':        PageText{
			title: '기본 타입'
			body:  '<h2>기본 타입</h2>'
		}
		'basics/9':        PageText{
			title: '제로 값'
			body:  '<h2>제로 값</h2>'
		}
		'basics/10':       PageText{
			title: '상수'
			body:  '<h2>상수</h2>'
		}
		'basics/11':       PageText{
			title: '타입 변환'
			body:  '<h2>타입 변환</h2>'
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
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For는 V의 "while"'
			body:  '<h2>For는 V의 "while"</h2>'
		}
		'controlflow/3':   PageText{
			title: 'For 계속'
			body:  '<h2>For 계속</h2>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':   PageText{
			title: '언래핑 값이 있는 If'
			body:  '<h2>언래핑 값이 있는 If</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match와 합 타입'
			body:  '<h2>Match와 합 타입</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: '연습: 루프와 함수'
			body:  '<h2>연습: 루프와 함수</h2>'
		}
		'controlflow/10':  PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/moretypes/1'>더 많은 타입</a>으로 계속하세요.</p>"
		}
		'moretypes/1':     PageText{
			title: '구조체'
			body:  '<h2>구조체</h2>'
		}
		'moretypes/2':     PageText{
			title: '배열'
			body:  '<h2>배열</h2>'
		}
		'moretypes/3':     PageText{
			title: '슬라이스'
			body:  '<h2>슬라이스</h2>'
		}
		'moretypes/4':     PageText{
			title: '맵'
			body:  '<h2>맵</h2>'
		}
		'moretypes/5':     PageText{
			title: '문자열'
			body:  '<h2>문자열</h2>'
		}
		'moretypes/6':     PageText{
			title: '메서드'
			body:  '<h2>메서드</h2>'
		}
		'moretypes/7':     PageText{
			title: '연습: 단어 개수'
			body:  '<h2>연습: 단어 개수</h2>'
		}
		'moretypes/8':     PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/optionresult/1'>부재와 실패 처리</a>로 계속하세요.</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result와 오류'
			body:  '<h2>Result와 오류</h2>'
		}
		'optionresult/3':  PageText{
			title: '연습: Options'
			body:  '<h2>연습: Options</h2>'
		}
		'optionresult/4':  PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/methods/1'>메서드와 인터페이스</a>로 계속하세요.</p>"
		}
		'methods/1':       PageText{
			title: '인터페이스'
			body:  '<h2>인터페이스</h2>'
		}
		'methods/2':       PageText{
			title: '임베딩'
			body:  '<h2>임베딩</h2>'
		}
		'methods/3':       PageText{
			title: '출력 가능한 타입'
			body:  '<h2>출력 가능한 타입</h2>'
		}
		'methods/4':       PageText{
			title: '연습: 도형'
			body:  '<h2>연습: 도형</h2>'
		}
		'methods/5':       PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/generics/1'>제네릭</a>으로 계속하세요.</p>"
		}
		'generics/1':      PageText{
			title: '제네릭 함수'
			body:  '<h2>제네릭 함수</h2>'
		}
		'generics/2':      PageText{
			title: '제네릭 구조체'
			body:  '<h2>제네릭 구조체</h2>'
		}
		'generics/3':      PageText{
			title: '제네릭 타입의 맵'
			body:  '<h2>제네릭 타입의 맵</h2>'
		}
		'generics/4':      PageText{
			title: '여러 타입 매개변수'
			body:  '<h2>여러 타입 매개변수</h2>'
		}
		'generics/5':      PageText{
			title: '연습: 제네릭'
			body:  '<h2>연습: 제네릭</h2>'
		}
		'generics/6':      PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 다음에 배울 내용을 확인하거나 <a href='/concurrency/1'>동시성</a>으로 계속하세요.</p>"
		}
		'concurrency/1':   PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':   PageText{
			title: '채널'
			body:  '<h2>채널</h2>'
		}
		'concurrency/3':   PageText{
			title: '버퍼 채널'
			body:  '<h2>버퍼 채널</h2>'
		}
		'concurrency/4':   PageText{
			title: '닫힐 때까지 수신'
			body:  '<h2>닫힐 때까지 수신</h2>'
		}
		'concurrency/5':   PageText{
			title: '닫기'
			body:  '<h2>닫기</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: '공유 상태'
			body:  '<h2>공유 상태</h2>'
		}
		'concurrency/8':   PageText{
			title: '대기 그룹'
			body:  '<h2>대기 그룹</h2>'
		}
		'concurrency/9':   PageText{
			title: '연습: 워커 풀'
			body:  '<h2>연습: 워커 풀</h2>'
		}
		'concurrency/10':  PageText{
			title: '축하합니다!'
			body:  "<p>이 레슨을 완료했으며, 투어 전체를 마쳤습니다!</p>
<p><a href='/list'>모듈 목록</a>으로 돌아가 원하는 내용을 다시 읽거나 <a href='/welcome/1'>시작하기</a>에서 다시 시작하세요.</p>"
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
