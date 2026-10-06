module locale

// Русский (Russian) translation.

pub const ru = Text{
	modules: {
		'mechanics':    'Использование тура'
		'basics':       'Базовые типы'
		'controlflow':  'Управление потоком'
		'moretypes':    'Больше типов'
		'optionresult': 'Option и Result'
		'methods':      'Методы и интерфейсы'
		'generics':     'Дженерики'
		'concurrency':  'Конкурентность'
	}
	lessons: {
		'welcome':      'Первые шаги'
		'basics':       'Базовые типы'
		'controlflow':  'Управление потоком'
		'moretypes':    'Больше типов'
		'optionresult': 'Option и Result'
		'methods':      'Методы и интерфейсы'
		'generics':     'Дженерики'
		'concurrency':  'Конкурентность'
	}
	pages:   {
		'welcome/1':       PageText{
			title: 'Привет, мир'
			body:  "<p>Добро пожаловать в тур по <a href='https://vlang.io'>языку программирования V</a>.</p>
<p>Тур разделён на модули. Вы можете перейти к ним из <a href='/list'>оглавления</a> или через кнопку меню в правом верхнем углу.</p>
<p>На протяжении тура вы будете встречать слайды и упражнения. Навигация осуществляется ссылками <b>назад</b> и <b>вперёд</b> под текстом или клавишами <code>PageUp</code> и <code>PageDown</code>.</p>
<p>Тур интерактивный. Нажмите <b>Выполнить</b> (или <code>Shift</code>+<code>Enter</code>) для компиляции и запуска программы. Результат появится под кодом.</p>
<p>Эти программы — отправная точка для ваших экспериментов. Редактируйте программу и запускайте её снова.</p>"
		}
		'welcome/2':       PageText{
			title: 'Использование тура'
			body:  '<p>Каждая страница имеет колонку текста слева и колонку кода справа. Между ними находится ручка изменения размера: перетащите её, чтобы дать больше места коду.</p>'
		}
		'welcome/3':       PageText{
			title: 'V офлайн (необязательно)'
			body:  "<p>Для использования тура не нужна локальная установка V, но она рекомендуется.</p>"
		}
		'welcome/4':       PageText{
			title: 'Песочница'
			body:  '<p>Ваши программы выполняются в песочнице на сервере.</p>'
		}
		'welcome/5':       PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили первый модуль тура!</p>
<p>Вернитесь к <a href='/list'>списку модулей</a>, чтобы узнать, что изучать дальше, или продолжите с <a href='/basics/1'>основами языка</a>.</p>"
		}
		'basics/1':        PageText{
			title: 'Модули'
			body:  '<h2>Модули</h2>'
		}
		'basics/2':        PageText{
			title: 'Импорты'
			body:  '<h2>Импорты</h2>'
		}
		'basics/3':        PageText{
			title: 'Переменные'
			body:  '<h2>Переменные</h2>'
		}
		'basics/4':        PageText{
			title: 'Изменяемые переменные'
			body:  '<h2>Изменяемые переменные</h2>'
		}
		'basics/5':        PageText{
			title: 'Краткие объявления'
			body:  '<h2>Краткие объявления</h2>'
		}
		'basics/6':        PageText{
			title: 'Функции'
			body:  '<h2>Функции</h2>'
		}
		'basics/7':        PageText{
			title: 'Несколько результатов'
			body:  '<h2>Несколько результатов</h2>'
		}
		'basics/8':        PageText{
			title: 'Базовые типы'
			body:  '<h2>Базовые типы</h2>'
		}
		'basics/9':        PageText{
			title: 'Нулевые значения'
			body:  '<h2>Нулевые значения</h2>'
		}
		'basics/10':       PageText{
			title: 'Константы'
			body:  '<h2>Константы</h2>'
		}
		'basics/11':       PageText{
			title: 'Преобразования типов'
			body:  '<h2>Преобразования типов</h2>'
		}
		'basics/12':       PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили этот урок!</p>
<p>Вы можете вернуться к <a href='/list'>списку модулей</a>, чтобы узнать, что изучать дальше, или продолжить с <a href='/controlflow/1'>управлением потоком</a>.</p>"
		}
		'basics/13':       PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили этот урок!</p>
<p>Вы можете вернуться к <a href='/list'>списку модулей</a>, чтобы узнать, что изучать дальше, или продолжить с <a href='/controlflow/1'>управлением потоком</a>.</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For — это "while" в V'
			body:  '<h2>For — это "while" в V</h2>'
		}
		'controlflow/3':   PageText{
			title: 'For продолжение'
			body:  '<h2>For продолжение</h2>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':   PageText{
			title: 'If с распакованным значением'
			body:  '<h2>If с распакованным значением</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match и суммы типов'
			body:  '<h2>Match и суммы типов</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: 'Упражнение: Циклы и функции'
			body:  '<h2>Упражнение: Циклы и функции</h2>'
		}
		'controlflow/10':  PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили этот урок!</p>
<p>Вернитесь к <a href='/list'>списку модулей</a>, чтобы узнать, что изучать дальше, или продолжите с <a href='/moretypes/1'>дополнительными типами</a>.</p>"
		}
		'moretypes/1':     PageText{
			title: 'Structs'
			body:  '<h2>Structs</h2>'
		}
		'moretypes/2':     PageText{
			title: 'Arrays'
			body:  '<h2>Arrays</h2>'
		}
		'moretypes/3':     PageText{
			title: 'Slices'
			body:  '<h2>Slices</h2>'
		}
		'moretypes/4':     PageText{
			title: 'Maps'
			body:  '<h2>Maps</h2>'
		}
		'moretypes/5':     PageText{
			title: 'Strings'
			body:  '<h2>Strings</h2>'
		}
		'moretypes/6':     PageText{
			title: 'Методы'
			body:  '<h2>Методы</h2>'
		}
		'moretypes/7':     PageText{
			title: 'Упражнение: Подсчёт слов'
			body:  '<h2>Упражнение: Подсчёт слов</h2>'
		}
		'moretypes/8':     PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили этот урок!</p>
<p>Вы можете вернуться к <a href='/list'>списку модулей</a>, чтобы узнать, что изучать дальше, или продолжите с <a href='/optionresult/1'>обработкой отсутствия и ошибок</a>.</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result и ошибки'
			body:  '<h2>Result и ошибки</h2>'
		}
		'optionresult/3':  PageText{
			title: 'Упражнение: Options'
			body:  '<h2>Упражнение: Options</h2>'
		}
		'optionresult/4':  PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили этот урок!</p>
<p>Вы можете вернуться к <a href='/list'>списку модулей</a>, чтобы узнать, что изучать дальше, или продолжите с <a href='/methods/1'>методами и интерфейсами</a>.</p>"
		}
		'methods/1':       PageText{
			title: 'Интерфейсы'
			body:  '<h2>Интерфейсы</h2>'
		}
		'methods/2':       PageText{
			title: 'Встраивание'
			body:  '<h2>Встраивание</h2>'
		}
		'methods/3':       PageText{
			title: 'Печатаемые типы'
			body:  '<h2>Печатаемые типы</h2>'
		}
		'methods/4':       PageText{
			title: 'Упражнение: Фигуры'
			body:  '<h2>Упражнение: Фигуры</h2>'
		}
		'methods/5':       PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили этот урок!</p>
<p>Вы можете вернуться к <a href='/list'>списку модулей</a>, чтобы узнать, что изучать дальше, или продолжите с <a href='/generics/1'>дженериками</a>.</p>"
		}
		'generics/1':      PageText{
			title: 'Дженерик-функции'
			body:  '<h2>Дженерик-функции</h2>'
		}
		'generics/2':      PageText{
			title: 'Дженерик-структуры'
			body:  '<h2>Дженерик-структуры</h2>'
		}
		'generics/3':      PageText{
			title: 'Карты дженерик-типов'
			body:  '<h2>Карты дженерик-типов</h2>'
		}
		'generics/4':      PageText{
			title: 'Несколько параметров типа'
			body:  '<h2>Несколько параметров типа</h2>'
		}
		'generics/5':      PageText{
			title: 'Упражнение: Дженерики'
			body:  '<h2>Упражнение: Дженерики</h2>'
		}
		'generics/6':      PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили этот урок!</p>
<p>Вы можете вернуться к <a href='/list'>списку модулей</a>, чтобы узнать, что изучать дальше, или продолжите с <a href='/concurrency/1'>конкурентностью</a>.</p>"
		}
		'concurrency/1':   PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':   PageText{
			title: 'Channels'
			body:  '<h2>Channels</h2>'
		}
		'concurrency/3':   PageText{
			title: 'Буферизованные каналы'
			body:  '<h2>Буферизованные каналы</h2>'
		}
		'concurrency/4':   PageText{
			title: 'Получение до закрытия'
			body:  '<h2>Получение до закрытия</h2>'
		}
		'concurrency/5':   PageText{
			title: 'Закрытие'
			body:  '<h2>Закрытие</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: 'Общее состояние'
			body:  '<h2>Общее состояние</h2>'
		}
		'concurrency/8':   PageText{
			title: 'Группы ожидания'
			body:  '<h2>Группы ожидания</h2>'
		}
		'concurrency/9':   PageText{
			title: 'Упражнение: Пул воркеров'
			body:  '<h2>Упражнение: Пул воркеров</h2>'
		}
		'concurrency/10':  PageText{
			title: 'Поздравляем!'
			body:  "<p>Вы завершили этот урок, а с ним и весь тур!</p>
<p>Вернитесь к <a href='/list'>списку модулей</a>, чтобы перечитать что-либо, или начните заново с <a href='/welcome/1'>первых шагов</a>.</p>"
		}
	}
	ui:      {
		'site_title':       'Тур по V'
		'toc':              'Оглавление'
		'toggle_theme':     'Сменить тему'
		'language':         'Язык'
		'run':              'Выполнить'
		'format':           'Форматировать'
		'reset':            'Сбросить'
		'solution':         'Решение'
		'output':           'Вывод'
		'help':             'Горячие клавиши'
		'help_close':       'Закрыть'
		'run_program':      'Выполнить программу'
		'next_page':        'Следующая страница'
		'prev_page':        'Предыдущая страница'
		'toggle_help':      'Открыть или закрыть справку'
		'move_panes':       'Перемещение между панелями'
		'previous':         'Назад'
		'next':             'Вперёд'
		'resize_panes':     'Изменить размер панелей'
		'page_of':          '\${number} / \${total}'
		'no_program':       'В песочнице не было тестовой программы.'
		'compile_failed':   'Программа не скомпилирована.'
		'could_not_reach':  'Не удалось связаться с сервером: '
		'could_not_format': 'Не удалось отформатировать программу.'
		'sandbox_busy':     'Песочница занята. Попробуйте снова.'
		'too_large':        'Запрос слишком велик.'
		'no_compiler':      'В песочнице нет компилятора.'
		'link_counterpart': 'Читать эту страницу на \${language}'
		'lang_other':       'Другие языки'
	}
}
