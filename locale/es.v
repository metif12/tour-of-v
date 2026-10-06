module locale

// Español (Spanish) translation.

pub const es = Text{
	modules: {
		'mechanics':    'Usar el tour'
		'basics':       'Tipos básicos'
		'controlflow':  'Flujo de control'
		'moretypes':    'Más tipos'
		'optionresult': 'Option y Result'
		'methods':      'Métodos e interfaces'
		'generics':     'Genéricos'
		'concurrency':  'Concurrencia'
	}
	lessons: {
		'welcome':      'Primeros pasos'
		'basics':       'Tipos básicos'
		'controlflow':  'Flujo de control'
		'moretypes':    'Más tipos'
		'optionresult': 'Option y Result'
		'methods':      'Métodos e interfaces'
		'generics':     'Genéricos'
		'concurrency':  'Concurrencia'
	}
	pages:   {
		'welcome/1':       PageText{
			title: 'Hola, Mundo'
			body:  "<p>Bienvenido a un tour por el <a href='https://vlang.io'>lenguaje de programación V</a>.</p>
<p>El tour está dividido en módulos. Puedes acceder a ellos desde la <a href='/list'>tabla de contenidos</a> o con el botón de menú en la esquina superior derecha.</p>
<p>A lo largo del tour encontrarás diapositivas y ejercicios. Navega con los enlaces <b>anterior</b> y <b>siguiente</b> debajo del texto, o con las teclas <code>PageUp</code> y <code>PageDown</code>.</p>
<p>El tour es interactivo. Pulsa <b>Ejecutar</b> (o <code>Shift</code>+<code>Enter</code>) para compilar y ejecutar el programa. El resultado aparece debajo del código.</p>
<p>Estos programas son puntos de partida para tus propios experimentos. Edita el programa y ejecútalo de nuevo.</p>"
		}
		'welcome/2':       PageText{
			title: 'Usar este tour'
			body:  '<p>Cada página tiene una columna de texto a la izquierda y una columna de código a la derecha. Entre ellas hay un asa de redimensionamiento: arrástrala para dar más espacio al código.</p>'
		}
		'welcome/3':       PageText{
			title: 'V sin conexión (opcional)'
			body:  "<p>No necesitas una instalación local de V para usar este tour, pero es recomendable.</p>"
		}
		'welcome/4':       PageText{
			title: 'El sandbox'
			body:  '<p>Tus programas se ejecutan en un sandbox en el servidor.</p>'
		}
		'welcome/5':       PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado el primer módulo del tour!</p>
<p>Vuelve a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa directamente con <a href='/basics/1'>los fundamentos del lenguaje</a>.</p>"
		}
		'basics/1':        PageText{
			title: 'Módulos'
			body:  '<h2>Módulos</h2>'
		}
		'basics/2':        PageText{
			title: 'Imports'
			body:  '<h2>Imports</h2>'
		}
		'basics/3':        PageText{
			title: 'Variables'
			body:  '<h2>Variables</h2>'
		}
		'basics/4':        PageText{
			title: 'Variables mutables'
			body:  '<h2>Variables mutables</h2>'
		}
		'basics/5':        PageText{
			title: 'Declaraciones cortas'
			body:  '<h2>Declaraciones cortas</h2>'
		}
		'basics/6':        PageText{
			title: 'Funciones'
			body:  '<h2>Funciones</h2>'
		}
		'basics/7':        PageText{
			title: 'Múltiples resultados'
			body:  '<h2>Múltiples resultados</h2>'
		}
		'basics/8':        PageText{
			title: 'Tipos básicos'
			body:  '<h2>Tipos básicos</h2>'
		}
		'basics/9':        PageText{
			title: 'Valores cero'
			body:  '<h2>Valores cero</h2>'
		}
		'basics/10':       PageText{
			title: 'Constantes'
			body:  '<h2>Constantes</h2>'
		}
		'basics/11':       PageText{
			title: 'Conversiones de tipo'
			body:  '<h2>Conversiones de tipo</h2>'
		}
		'basics/12':       PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continuar con <a href='/controlflow/1'>flujo de control</a>.</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For es el "while" de V'
			body:  '<h2>For es el "while" de V</h2>'
		}
		'controlflow/3':   PageText{
			title: 'For continuado'
			body:  '<h2>For continuado</h2>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>'
		}
		'controlflow/5':   PageText{
			title: 'If con valor desempaquetado'
			body:  '<h2>If con valor desempaquetado</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match y tipos suma'
			body:  '<h2>Match y tipos suma</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: 'Ejercicio: Bucles y Funciones'
			body:  '<h2>Ejercicio: Bucles y Funciones</h2>'
		}
		'controlflow/10':  PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Vuelve a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/moretypes/1'>más tipos</a>.</p>"
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
			title: 'Métodos'
			body:  '<h2>Métodos</h2>'
		}
		'moretypes/7':     PageText{
			title: 'Ejercicio: Conteo de Palabras'
			body:  '<h2>Ejercicio: Conteo de Palabras</h2>'
		}
		'moretypes/8':     PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/optionresult/1'>manejo de ausencia y fallos</a>.</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result y errores'
			body:  '<h2>Result y errores</h2>'
		}
		'optionresult/3':  PageText{
			title: 'Ejercicio: Options'
			body:  '<h2>Ejercicio: Options</h2>'
		}
		'optionresult/4':  PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/methods/1'>métodos e interfaces</a>.</p>"
		}
		'methods/1':       PageText{
			title: 'Interfaces'
			body:  '<h2>Interfaces</h2>'
		}
		'methods/2':       PageText{
			title: 'Incrustación'
			body:  '<h2>Incrustación</h2>'
		}
		'methods/3':       PageText{
			title: 'Tipos imprimibles'
			body:  '<h2>Tipos imprimibles</h2>'
		}
		'methods/4':       PageText{
			title: 'Ejercicio: Formas'
			body:  '<h2>Ejercicio: Formas</h2>'
		}
		'methods/5':       PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/generics/1'>genéricos</a>.</p>"
		}
		'generics/1':      PageText{
			title: 'Funciones genéricas'
			body:  '<h2>Funciones genéricas</h2>'
		}
		'generics/2':      PageText{
			title: 'Structs genéricos'
			body:  '<h2>Structs genéricos</h2>'
		}
		'generics/3':      PageText{
			title: 'Maps de tipos genéricos'
			body:  '<h2>Maps de tipos genéricos</h2>'
		}
		'generics/4':      PageText{
			title: 'Varios parámetros de tipo'
			body:  '<h2>Varios parámetros de tipo</h2>'
		}
		'generics/5':      PageText{
			title: 'Ejercicio: Genéricos'
			body:  '<h2>Ejercicio: Genéricos</h2>'
		}
		'generics/6':      PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/concurrency/1'>concurrencia</a>.</p>"
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
			title: 'Channels con buffer'
			body:  '<h2>Channels con buffer</h2>'
		}
		'concurrency/4':   PageText{
			title: 'Recibir hasta el cierre'
			body:  '<h2>Recibir hasta el cierre</h2>'
		}
		'concurrency/5':   PageText{
			title: 'Cierre'
			body:  '<h2>Cierre</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: 'Estado compartido'
			body:  '<h2>Estado compartido</h2>'
		}
		'concurrency/8':   PageText{
			title: 'Grupos de espera'
			body:  '<h2>Grupos de espera</h2>'
		}
		'concurrency/9':   PageText{
			title: 'Ejercicio: Un pool de workers'
			body:  '<h2>Ejercicio: Un pool de workers</h2>'
		}
		'concurrency/10':  PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección, y con ella todo el tour!</p>
<p>Vuelve a la <a href='/list'>lista de módulos</a> para releer lo que quieras, o empieza de nuevo en <a href='/welcome/1'>primeros pasos</a>.</p>"
		}
	}
	ui:      {
		'site_title':       'Un tour por V'
		'toc':              'Tabla de contenidos'
		'toggle_theme':     'Cambiar tema'
		'language':         'Idioma'
		'run':              'Ejecutar'
		'format':           'Formatear'
		'reset':            'Reiniciar'
		'solution':         'Solución'
		'output':           'Salida'
		'help':             'Atajos de teclado'
		'help_close':       'Cerrar'
		'run_program':      'Ejecutar el programa'
		'next_page':        'Página siguiente'
		'prev_page':        'Página anterior'
		'toggle_help':      'Abrir o cerrar esta ayuda'
		'move_panes':       'Moverse entre paneles'
		'previous':         'Anterior'
		'next':             'Siguiente'
		'resize_panes':     'Redimensionar paneles'
		'page_of':          '\${number} / \${total}'
		'no_program':       'El sandbox no contenía un programa de prueba.'
		'compile_failed':   'El programa no compiló.'
		'could_not_reach':  'No se pudo contactar con el servidor: '
		'could_not_format': 'No se pudo formatear este programa.'
		'sandbox_busy':     'El sandbox está ocupado. Inténtalo de nuevo.'
		'too_large':        'Esta solicitud es demasiado grande.'
		'no_compiler':      'El sandbox no tiene compilador disponible.'
		'link_counterpart': 'Leer esta página en \${language}'
		'lang_other':       'Otros idiomas'
	}
}
