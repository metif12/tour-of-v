module locale

// Русский (Russian) translation.
// Page bodies fall back to English; the interface and the table of
// contents are translated.

pub const ru = Text{
	modules: {
		'mechanics':    'Использование тура'
		'basics':       'Базовые типы'
		'controlflow':  'Поток управления'
		'moretypes':    'Больше типов'
		'optionresult': 'Option и Result'
		'methods':      'Методы и интерфейсы'
		'generics':     'Дженерики'
		'concurrency':  'Параллелизм'
	}
	lessons: {
		'welcome':      'Начало работы'
		'basics':       'Базовые типы'
		'controlflow':  'Поток управления'
		'moretypes':    'Больше типов'
		'optionresult': 'Option и Result'
		'methods':      'Методы и интерфейсы'
		'generics':     'Дженерики'
		'concurrency':  'Параллелизм'
	}
	pages:   {}
	ui:      {
		'site_title':       'Тур по V'
		'toc':              'Содержание'
		'toggle_theme':     'Переключить тему'
		'language':         'Язык'
		'run':              'Запустить'
		'format':           'Форматировать'
		'reset':            'Сбросить'
		'solution':         'Решение'
		'output':           'Вывод'
		'help':             'Горячие клавиши'
		'help_close':       'Закрыть'
		'run_program':      'Запустить программу'
		'next_page':        'Следующая страница'
		'prev_page':        'Предыдущая страница'
		'toggle_help':      'Открыть или закрыть эту справку'
		'move_panes':       'Перемещение между панелями'
		'previous':         'Назад'
		'next':             'Вперёд'
		'resize_panes':     'Изменить размер панелей'
		'page_of':          '\${number} / \${total}'
		'no_program':       'В песочнице не было тестовой программы.'
		'compile_failed':   'Программа не скомпилировалась.'
		'could_not_reach':  'Не удалось подключиться к серверу: '
		'could_not_format': 'Не удалось отформатировать эту программу.'
		'sandbox_busy':     'Песочница занята. Попробуйте ещё раз.'
		'too_large':        'Этот запрос слишком велик.'
		'no_compiler':      'В песочнице нет доступного компилятора.'
		'link_counterpart': 'Читать эту страницу на \${language}'
		'lang_other':       'Другие языки'
	}
}
