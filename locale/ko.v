module locale

// 한국어 (Korean) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const ko = Text{
	modules: {
		'mechanics':    '투어 사용하기'
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
	pages:   {}
	ui:      {
		'site_title':       'V 투어'
		'toc':              '목차'
		'toggle_theme':     '테마 전환'
		'language':         '언어'
		'run':              '실행'
		'format':           '형식'
		'reset':            '재설정'
		'solution':         '해답'
		'output':           '출력'
		'help':             '키보드 단축키'
		'help_close':       '닫기'
		'run_program':      '프로그램 실행'
		'next_page':        '다음 페이지'
		'prev_page':        '이전 페이지'
		'toggle_help':      '이 도움말 열기 또는 닫기'
		'move_panes':       '패널 간 이동'
		'previous':         '이전'
		'next':             '다음'
		'resize_panes':     '패널 크기 조정'
		'page_of':          '\${number} / \${total}'
		'no_program':       '샌드박스에 테스트 프로그램이 없습니다.'
		'compile_failed':   '프로그램이 컴파일되지 않았습니다.'
		'could_not_reach':  '서버에 연결할 수 없습니다: '
		'could_not_format': '이 프로그램을 형식화할 수 없습니다.'
		'sandbox_busy':     '샌드박스가 사용 중입니다. 다시 시도하세요.'
		'too_large':        '요청이 너무 큽니다.'
		'no_compiler':      '샌드박스에 사용 가능한 컴파일러가 없습니다.'
		'link_counterpart': '이 페이지를 \${language}로 읽기'
		'lang_other':       '다른 언어'
	}
}
