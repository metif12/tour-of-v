module locale

// Português (Portuguese) translation.

pub const pt = Text{
	modules: {
		'mechanics':    'Usar o tour'
		'basics':       'Tipos básicos'
		'controlflow':  'Fluxo de controle'
		'moretypes':    'Mais tipos'
		'optionresult': 'Option e Result'
		'methods':      'Métodos e interfaces'
		'generics':     'Genéricos'
		'concurrency':  'Concorrência'
	}
	lessons: {
		'welcome':      'Primeiros passos'
		'basics':       'Tipos básicos'
		'controlflow':  'Fluxo de controle'
		'moretypes':    'Mais tipos'
		'optionresult': 'Option e Result'
		'methods':      'Métodos e interfaces'
		'generics':     'Genéricos'
		'concurrency':  'Concorrência'
	}
	pages:   {
		'welcome/1':       PageText{
			title: 'Olá, Mundo'
			body:  "<p>Bem-vindo a um tour pela <a href='https://vlang.io'>linguagem de programação V</a>.</p>
<p>O tour está dividido em módulos. Você pode acessá-los a partir da <a href='/list'>tabela de conteúdos</a> ou com o botão de menu no canto superior direito.</p>
<p>Ao longo do tour você encontrará slides e exercícios. Navegue com os links <b>anterior</b> e <b>próximo</b> abaixo do texto, ou com as teclas <code>PageUp</code> e <code>PageDown</code>.</p>
<p>O tour é interativo. Pressione <b>Executar</b> (ou <code>Shift</code>+<code>Enter</code>) para compilar e executar o programa. O resultado aparece abaixo do código.</p>
<p>Estes programas são pontos de partida para seus próprios experimentos. Edite o programa e execute-o novamente.</p>"
		}
		'welcome/2':       PageText{
			title: 'Usar este tour'
			body:  '<p>Cada página tem uma coluna de texto à esquerda e uma coluna de código à direita. Entre elas está uma alça de redimensionamento: arraste-a para dar mais espaço ao código.</p>'
		}
		'welcome/3':       PageText{
			title: 'V offline (opcional)'
			body:  "<p>Você não precisa de uma instalação local de V para usar este tour, mas é recomendável.</p>"
		}
		'welcome/4':       PageText{
			title: 'O sandbox'
			body:  '<p>Seus programas rodam em um sandbox no servidor.</p>'
		}
		'welcome/5':       PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou o primeiro módulo do tour!</p>
<p>Volte para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue diretamente com <a href='/basics/1'>os fundamentos da linguagem</a>.</p>"
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
			title: 'Variáveis'
			body:  '<h2>Variáveis</h2>'
		}
		'basics/4':        PageText{
			title: 'Variáveis mutáveis'
			body:  '<h2>Variáveis mutáveis</h2>'
		}
		'basics/5':        PageText{
			title: 'Declarações curtas'
			body:  '<h2>Declarações curtas</h2>'
		}
		'basics/6':        PageText{
			title: 'Funções'
			body:  '<h2>Funções</h2>'
		}
		'basics/7':        PageText{
			title: 'Múltiplos resultados'
			body:  '<h2>Múltiplos resultados</h2>'
		}
		'basics/8':        PageText{
			title: 'Tipos básicos'
			body:  '<h2>Tipos básicos</h2>'
		}
		'basics/9':        PageText{
			title: 'Valores zero'
			body:  '<h2>Valores zero</h2>'
		}
		'basics/10':       PageText{
			title: 'Constantes'
			body:  '<h2>Constantes</h2>'
		}
		'basics/11':       PageText{
			title: 'Conversões de tipo'
			body:  '<h2>Conversões de tipo</h2>'
		}
		'basics/12':       PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continuar com <a href='/controlflow/1'>fluxo de controle</a>.</p>"
		}
		'basics/13':       PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continuar com <a href='/controlflow/1'>fluxo de controle</a>.</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>'
		}
		'controlflow/2':   PageText{
			title: 'For é o "while" de V'
			body:  '<h2>For é o "while" de V</h2>'
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
			title: 'If com valor desempacotado'
			body:  '<h2>If com valor desempacotado</h2>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>'
		}
		'controlflow/7':   PageText{
			title: 'Match e tipos soma'
			body:  '<h2>Match e tipos soma</h2>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>'
		}
		'controlflow/9':   PageText{
			title: 'Exercício: Laços e Funções'
			body:  '<h2>Exercício: Laços e Funções</h2>'
		}
		'controlflow/10':  PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Volte para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/moretypes/1'>mais tipos</a>.</p>"
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
			title: 'Exercício: Contagem de Palavras'
			body:  '<h2>Exercício: Contagem de Palavras</h2>'
		}
		'moretypes/8':     PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/optionresult/1'>tratamento de ausência e falhas</a>.</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2':  PageText{
			title: 'Result e erros'
			body:  '<h2>Result e erros</h2>'
		}
		'optionresult/3':  PageText{
			title: 'Exercício: Options'
			body:  '<h2>Exercício: Options</h2>'
		}
		'optionresult/4':  PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/methods/1'>métodos e interfaces</a>.</p>"
		}
		'methods/1':       PageText{
			title: 'Interfaces'
			body:  '<h2>Interfaces</h2>'
		}
		'methods/2':       PageText{
			title: 'Incorporação'
			body:  '<h2>Incorporação</h2>'
		}
		'methods/3':       PageText{
			title: 'Tipos imprimíveis'
			body:  '<h2>Tipos imprimíveis</h2>'
		}
		'methods/4':       PageText{
			title: 'Exercício: Formas'
			body:  '<h2>Exercício: Formas</h2>'
		}
		'methods/5':       PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/generics/1'>genéricos</a>.</p>"
		}
		'generics/1':      PageText{
			title: 'Funções genéricas'
			body:  '<h2>Funções genéricas</h2>'
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
			title: 'Vários parâmetros de tipo'
			body:  '<h2>Vários parâmetros de tipo</h2>'
		}
		'generics/5':      PageText{
			title: 'Exercício: Genéricos'
			body:  '<h2>Exercício: Genéricos</h2>'
		}
		'generics/6':      PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/concurrency/1'>concorrência</a>.</p>"
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
			title: 'Channels com buffer'
			body:  '<h2>Channels com buffer</h2>'
		}
		'concurrency/4':   PageText{
			title: 'Receber até o fechamento'
			body:  '<h2>Receber até o fechamento</h2>'
		}
		'concurrency/5':   PageText{
			title: 'Fechamento'
			body:  '<h2>Fechamento</h2>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':   PageText{
			title: 'Estado compartilhado'
			body:  '<h2>Estado compartilhado</h2>'
		}
		'concurrency/8':   PageText{
			title: 'Grupos de espera'
			body:  '<h2>Grupos de espera</h2>'
		}
		'concurrency/9':   PageText{
			title: 'Exercício: Um pool de workers'
			body:  '<h2>Exercício: Um pool de workers</h2>'
		}
		'concurrency/10':  PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição, e com ela todo o tour!</p>
<p>Volte para a <a href='/list'>lista de módulos</a> para reler o que quiser, ou comece novamente em <a href='/welcome/1'>primeiros passos</a>.</p>"
		}
	}
	ui:      {
		'site_title':       'Um tour por V'
		'toc':              'Tabela de conteúdos'
		'toggle_theme':     'Mudar tema'
		'language':         'Idioma'
		'run':              'Executar'
		'format':           'Formatar'
		'reset':            'Reiniciar'
		'solution':         'Solução'
		'output':           'Saída'
		'help':             'Atalhos de teclado'
		'help_close':       'Fechar'
		'run_program':      'Executar o programa'
		'next_page':        'Próxima página'
		'prev_page':        'Página anterior'
		'toggle_help':      'Abrir ou fechar esta ajuda'
		'move_panes':       'Mover entre painéis'
		'previous':         'Anterior'
		'next':             'Próximo'
		'resize_panes':     'Redimensionar painéis'
		'page_of':          '\${number} / \${total}'
		'no_program':       'O sandbox não continha um programa de teste.'
		'compile_failed':   'O programa não compilou.'
		'could_not_reach':  'Não foi possível contactar o servidor: '
		'could_not_format': 'Não foi possível formatar este programa.'
		'sandbox_busy':     'O sandbox está ocupado. Tente novamente.'
		'too_large':        'Este pedido é demasiado grande.'
		'no_compiler':      'O sandbox não tem compilador disponível.'
		'link_counterpart': 'Ler esta página em \${language}'
		'lang_other':       'Outros idiomas'
	}
}
