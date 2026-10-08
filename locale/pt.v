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
		'welcome/1':      PageText{
			title: 'Olá, Mundo'
			body:  "<p>Bem-vindo a um tour pela <a href='https://vlang.io'>linguagem de programação V</a>.</p>
<p>O tour está dividido em módulos. Você pode acessá-los a partir da <a href='/list'>tabela de conteúdos</a> ou com o botão de menu no canto superior direito.</p>
<p>Ao longo do tour você encontrará slides e exercícios. Navegue com os links <b>anterior</b> e <b>próximo</b> abaixo do texto, ou com as teclas <code>PageUp</code> e <code>PageDown</code>.</p>
<p>O tour é interativo. Pressione <b>Executar</b> (ou <code>Shift</code>+<code>Enter</code>) para compilar e executar o programa. O resultado aparece abaixo do código.</p>
<p>Estes programas são pontos de partida para seus próprios experimentos. Edite o programa e execute-o novamente.</p>"
		}
		'welcome/2':      PageText{
			title: 'Usar este tour'
			body:  '<p>Cada página tem uma coluna de texto à esquerda e uma coluna de código à direita. Entre elas está uma alça de redimensionamento: arraste-a para dar mais espaço ao código.</p>'
		}
		'welcome/3':      PageText{
			title: 'V offline (opcional)'
			body:  '<p>Você não precisa de uma instalação local de V para usar este tour, mas é recomendável.</p>'
		}
		'welcome/4':      PageText{
			title: 'O sandbox'
			body:  '<p>Seus programas rodam em um sandbox no servidor.</p>'
		}
		'welcome/5':      PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou o primeiro módulo do tour!</p>
<p>Volte para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue diretamente com <a href='/basics/1'>os fundamentos da linguagem</a>.</p>"
		}
		'basics/1':       PageText{
			title: 'Módulos'
			body:  "<h2>Módulos</h2>
<p>Cada arquivo V declara o <em>módulo</em> a que pertence. A declaração é a primeira coisa do arquivo.</p>
<p>Um programa começa no módulo chamado <code>main</code>, numa função chamada <code>main</code>.</p>
<p>Este programa usa os módulos da biblioteca padrão <code>math</code> e <code>strings</code>.</p>
<p>Em V há um módulo por diretório, e o nome do módulo coincide com seu diretório. Um símbolo só é visível fora de seu módulo se estiver marcado com <code>pub</code>.</p>"
		}
		'basics/2':       PageText{
			title: 'Imports'
			body:  "<h2>Imports</h2>
<p>Um módulo importado traz seus nomes exportados para o arquivo atual.</p>
<p>A biblioteca padrão se importa pelo nome do módulo: <code>import math</code>, <code>import strings</code>. Bibliotecas de terceiros se importam igual.</p>
<p>Nem toda operação de um módulo se escreve como chamada de função. Algumas são _métodos_ sobre o valor, assim <code>s.to_upper()</code> funciona sobre uma string sem nenhum import.</p>
<p>Ambos os estilos aparecem na biblioteca padrão, então vale ler a assinatura em vez de adivinhar.</p>"
		}
		'basics/3':       PageText{
			title: 'Variáveis'
			body:  "<h2>Variáveis</h2>
<p>Execute o código. Repare na mensagem de erro.</p>
<p>Variáveis em V se declaram com <code>:=</code>. Ao contrário da maioria das linguagens, uma variável em V é <em>imutável por padrão</em>, e é preciso pedir a mutabilidade explicitamente.</p>
<p>O compilador diz isso. A linha 6 tenta atribuir a <code>sum</code> sem pedir permissão.</p>
<p>Para corrigir o erro, adicione <code>mut</code> à declaração da linha 4 e tente de novo.</p>"
		}
		'basics/4':       PageText{
			title: 'Variáveis mutáveis'
			body:  "<h2>Variáveis mutáveis</h2>
<p>Para declarar uma variável mutável, adicione a palavra-chave <code>mut</code> antes do nome.</p>
<p>V exige isso porque mutação é algo que se tem de querer. Uma variável que nunca é reatribuída é mais fácil de analisar para o compilador, e mais fácil para você quando volta ao código depois.</p>
<p>Remova o <code>mut</code> e execute de novo. Esse é o erro da página anterior.</p>
<p>Você verá <code>mut</code> por toda parte em V, incluindo parâmetros de função e campos de struct.</p>"
		}
		'basics/5':       PageText{
			title: 'Declarações curtas'
			body:  "<h2>Declarações curtas</h2>
<p><code>:=</code> declara uma variável e deduz seu tipo do valor.</p>
<p>Quando o tipo não é óbvio, ou quando você quer ser específico, nomeie-o diretamente com uma _conversão_ como <code>i64(42)</code> ou <code>f64(1.5)</code>.</p>
<p>Não há forma separada de «declare agora, atribua depois». Uma variável V sempre tem valor no ponto em que entra em escopo, por isso os valores zero que você verá numa página posterior são produzidos pelo compilador e não por você.</p>"
		}
		'basics/6':       PageText{
			title: 'Funções'
			body:  "<h2>Funções</h2>
<p>Funções se declaram com <code>fn</code>.</p>
<p>Uma função pode tomar zero ou mais parâmetros. Parâmetros se escrevem com nome e tipo, e parâmetros consecutivos do mesmo tipo se escrevem como <code>x, y int</code>.</p>
<p>O resultado da função é nomeado após a lista de parâmetros. Funções V retornam exatamente um valor, a menos que o tipo de retorno seja uma tupla.</p>
<p>Uma função cujo corpo é uma única expressão pode ser escrita numa linha: <code>fn double(x int) int { return x * 2 }</code></p>"
		}
		'basics/7':       PageText{
			title: 'Múltiplos resultados'
			body:  "<h2>Múltiplos resultados</h2>
<p>Uma função pode retornar mais de um valor. Escreva o tipo de retorno como uma tupla:</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>Quem chama desestrutura o resultado em variáveis:</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>O tipo de retorno simplesmente lista cada valor, e quem chama os desestrutura em variáveis. Um valor de que não se precise se ignora com <code>_</code>.</p>
<p>Esta é a forma que você verá para tudo que pode falhar, o que se cobre num módulo posterior.</p>"
		}
		'basics/8':       PageText{
			title: 'Tipos básicos'
			body:  "<h2>Tipos básicos</h2>
<p>Booleanos são <code>true</code> e <code>false</code>.</p>
<p>Inteiros vêm em tamanhos fixos, <code>i8</code>, <code>i16</code>, <code>i32</code> e <code>i64</code>, e os tamanhos sem sinal de <code>u8</code> a <code>u64</code>. O próprio <code>int</code> tem 32 bits, e <code>isize</code> é a largura da plataforma, então nomeie <code>i32</code> ou <code>i64</code> quando a largura importar.</p>
<p>Tipos de ponto flutuante são <code>f32</code> e <code>f64</code>.</p>
<p>Um <code>rune</code> guarda um ponto de código Unicode.</p>
<p>Strings são imutáveis e se escrevem entre aspas simples.</p>"
		}
		'basics/9':       PageText{
			title: 'Valores zero'
			body:  "<h2>Valores zero</h2>
<p>Cada tipo tem um <em>valor zero</em>, que é o que uma variável contém antes de qualquer atribuição.</p>
<p>O valor zero é <code>0</code> para números, <code>false</code> para booleanos, a string vazia para strings, e a coleção vazia para arrays, slices e maps.</p>
<p>Para um struct, o valor zero é o struct com todos os seus campos em seus valores zero.</p>
<p>Como V exige um valor no ponto de declaração, você raramente os escreve. O compilador os produz para você, por isso o exemplo compila mesmo que o lado direito pareça redundante.</p>"
		}
		'basics/10':      PageText{
			title: 'Constantes'
			body:  "<h2>Constantes</h2>
<p>Uma <code>const</code> é um valor que o compilador conhece enquanto constrói seu programa, então deve ser uma expressão constante.</p>
<p>Constantes se escrevem com <code>const</code>, uma a uma ou em grupo entre parênteses.</p>
<p>Ao contrário de <code>final</code> em outras linguagens, reutilizar o nome de uma <code>const</code> para uma variável só gera um aviso do compilador. Trate esse aviso como erro: se um nome é constante, deve continuar constante em toda parte.</p>"
		}
		'basics/11':      PageText{
			title: 'Conversões de tipo'
			body:  "<h2>Conversões de tipo</h2>
<p>V nunca converte um tipo implicitamente. Passar de um a outro sempre se escreve:</p>
<pre><code>fl := f64(i)</code></pre>
<p>Algumas conversões perdem informação e outras são recusadas de plano, então o compilador dirá quando uma conversão não fizer sentido.</p>
<p>Strings não são números. Para ler uma como número, converta-a, e lembre que o resultado pode ser um valor zero se o texto não for interpretável.</p>
<p>Também se pode perguntar ao compilador o nome de um tipo com <code>typeof(x).name</code>.</p>"
		}
		'basics/12':      PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continuar com <a href='/controlflow/1'>fluxo de controle</a>.</p>"
		}
		'basics/13':      PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continuar com <a href='/controlflow/1'>fluxo de controle</a>.</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  "<h2>For</h2>
<p>V tem uma palavra-chave de loop, e vem em três formas.</p>
<p>A forma contada parece C:</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>Uma condição sozinha é um loop while, e sem condição repete para sempre.</p>
<p><code>break</code> sai do loop e <code>continue</code> pula para a próxima iteração.</p>
<p>Mude o loop para contar de 5 para baixo em vez de até 3, e execute de novo.</p>"
		}
		'controlflow/2':  PageText{
			title: 'For é o "while" de V'
			body:  "<h2>For é o «while» de V</h2>
<p>Um <code>for</code> com uma única condição continua até ela ser falsa.</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p>Um <code>for</code> sem condição alguma é um <em>loop infinito</em>:</p>
<pre><code>for {</code></pre>
<p>O exemplo sai do segundo loop após três iterações. Se apagar o <code>if</code> e o <code>break</code>, o sandbox vai parar o programa quando esgotar seu tempo de CPU.</p>"
		}
		'controlflow/3':  PageText{
			title: 'For continuado'
			body:  "<h2>For continuado</h2>
<p>Iterar uma coleção usa <code>in</code> em vez de índice. Esta é a forma padrão, porque não pode sair dos limites.</p>
<pre><code>for i, v in items {</code></pre>
<p>Use <code>_</code> para ignorar o índice:</p>
<pre><code>for _, v in items {</code></pre>
<p>Para iterar um número conhecido de vezes, use um intervalo: <code>for i in 0 .. n</code>. Note que <code>..</code> é exclusivo: roda <code>n</code> vezes, de <code>0</code> a <code>n-1</code>.</p>
<p>Maps dão a chave e o valor.</p>"
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  "<h2>If</h2>
<p>Um <code>if</code> se escreve assim:</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>Sem parênteses na condição e sem palavra-chave <code>then</code>.</p>
<p>Como um <code>if</code> é uma expressão que pode retornar valor, o padrão acima é idiomático: trate o caso interessante e retorne cedo, depois siga para o comum.</p>
<p>Use <code>else if</code> para uma cadeia de testes. V toma cada ramo como está, então revise a cadeia você: um ramo cujo teste nunca possa ser verdade simplesmente nunca roda, e o compilador não o apontará.</p>"
		}
		'controlflow/5':  PageText{
			title: 'If com valor desempacotado'
			body:  "<h2>If com valor desempacotado</h2>
<p>Uma função V pode retornar um valor <em>ou</em> um erro. O tipo de retorno se escreve com um <code>!</code> antes:</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>Dentro do corpo, faça <code>return</code> de um valor simples e V o embrulha para você. Para falhar, retorne <code>error(...)</code>.</p>
<p>No ponto de chamada, um <code>if</code> pode desembrulhar o resultado. O valor de sucesso se liga a <code>v</code>, e se houve erro, o ramo <code>else</code> corre com o erro ligado a <code>err</code>:</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>Execute duas vezes. A primeira chamada sucede e a segunda não, e ambas tomam o ramo esperado.</p>
<p>É assim que a maioria do código V lida com o que pode dar errado. O <a href='/optionresult/1'>próximo módulo</a> cobre isso a sério.</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  "<h2>Match</h2>
<p>V não tem palavra-chave <code>switch</code>. Tem <code>match</code>, que cobre mais casos que um switch comum.</p>
<p>Compare um valor:</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>Compare um intervalo. Intervalos em <code>match</code> são <em>inclusivos</em> nas duas pontas, o oposto do <code>..</code> que você usa em <code>for</code>:</p>
<pre><code>1 ... 3 { }</code></pre>
<p>Compare um enum. Cada valor precisa de um ramo, ou o <code>match</code> precisa de um <code>else</code>, assim não se adiciona valor sem o compilador apontar cada <code>match</code> a atualizar.</p>"
		}
		'controlflow/7':  PageText{
			title: 'Match e tipos soma'
			body:  "<h2>Match e tipos soma</h2>
<p>Um <em>tipo soma</em> se declara com <code>=</code> e uma lista de alternativas:</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>Um valor desse tipo é exatamente uma das alternativas, nunca mais de uma.</p>
<p>Compará-lo diz qual. Dentro de um ramo, a variável original é <em>convertida</em> para essa variante, assim seus campos ficam disponíveis direto sem casts.</p>
<p>Cada alternativa precisa de um ramo, ou o match precisa de um <code>else</code>. O compilador exige, assim uma alternativa nova não pode ser ignorada em silêncio.</p>
<p>Adicione uma quarta forma ao tipo soma e execute. O compilador dirá exatamente quais <code>match</code> você perdeu.</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  "<h2>Defer</h2>
<p><code>defer</code> agenda uma instrução para rodar quando o bloco que o contém termina.</p>
<p>Roda como termine o bloco: chegando ao fim, com um <code>return</code> cedo, ou ao desenrolar de um panic. Por isso serve para limpeza.</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>No exemplo, <code>with_defer</code> roda seu corpo, depois a instrução adiada. <code>early_return</code> retorna no meio, e a instrução adiada igual roda.</p>"
		}
		'controlflow/9':  PageText{
			title: 'Exercício: Laços e Funções'
			body:  "<h2>Exercício: Laços e Funções</h2>
<p>Escreva <code>sum_to</code> para retornar a soma dos números de <code>0</code> a <code>n</code>, e <code>sum_squares</code> para a soma de seus quadrados.</p>
<p>Faça duas vezes: uma da forma mais direta, e uma com um loop <code>for</code> explícito.</p>
<p>Depois reescreva ambas para rodar em tempo <em>O(1)</em>.</p>
<p>Aperte <b>Solution</b> quando tiver tentado, ou quando estiver travado.</p>"
		}
		'controlflow/10': PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Volte para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/moretypes/1'>mais tipos</a>.</p>"
		}
		'moretypes/1':    PageText{
			title: 'Structs'
			body:  "<h2>Structs</h2>
<p>Um <em>struct</em> agrupa valores sob um nome. É o jeito de V dizer «vão juntos».</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>Um valor se faz com <code>Point{ x: 3, y: 4 }</code>, e campos se leem com <code>p.x</code>.</p>
<p>Duas coisas a notar.</p>
<p>Primeiro, um struct pode se imprimir sozinho, assim <code>println(p)</code> mostra cada campo sem trabalho extra.</p>
<p>Segundo, mutabilidade funciona igual que com variáveis comuns. A variável precisa de <code>mut</code>:</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>e o próprio campo tem de estar declarado sob <code>mut</code> no struct:</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p>Um campo fora de <code>mut</code> não pode receber atribuição. Ainda pode ser lido, passado e copiado.</p>
<p>Remova <code>mut:</code> do struct e execute o exemplo. O compilador apontará a linha que atribui a <code>x</code>.</p>"
		}
		'moretypes/2':    PageText{
			title: 'Arrays'
			body:  "<h2>Arrays</h2>
<p>Um array tem comprimento fixo, e seu tipo de elemento vem do primeiro elemento:</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>Um array também pode ser feito com comprimento e valor inicial:</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>Arrays se indexam com <code>[]</code>, e carregam seu comprimento:</p>
<pre><code>println(numbers.len)</code></pre>
<p>Quando dois valores não devem partilhar conteúdo, peça uma cópia explícita com <code>clone</code>:</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>Use sempre que passar uma coleção a algo que você não quer que possa mudá-la, porque o diz no ponto de uso em vez de depender de regra a lembrar.</p>
<p>As transformações usuais são métodos em vez de funções livres:</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> é o elemento atual.</p>"
		}
		'moretypes/3':    PageText{
			title: 'Slices'
			body:  "<h2>Slices</h2>
<p>Uma slice é uma vista sobre um intervalo de um array ou outra slice, escrita com a mesma sintaxe <code>[]</code>:</p>
<pre><code>part := arr[1..3]</code></pre>
<p>Slices também podem ser construídas do nada e crescer. Crescer pode mover os dados, assim a variável tem de ser <code>mut</code>:</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> adiciona. Funciona em qualquer slice, e num array de tamanho fixo é erro de compilação em vez de surpresa em execução.</p>
<p>Fatiar outra slice dá uma slice dela. Como com arrays, <code>clone</code> quando precisar de cópia independente:</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>Note que intervalos são <em>exclusivos</em>: <code>0 .. n</code> roda <code>n</code> vezes, e um laço <code>for</code> só aceita esta forma. Intervalos dentro de <code>match</code> se escrevem <code>...</code> e são inclusivos nas duas pontas.</p>"
		}
		'moretypes/4':    PageText{
			title: 'Maps'
			body:  "<h2>Maps</h2>
<p>Um map guarda pares de chave e valor, e se escreve como literal:</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>O tipo de valor é inferido. Adicionar uma chave, e perguntar se existe:</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>Buscar uma chave ausente dá o <em>valor zero</em>, assim uma busca onde ausência e zero devam se distinguir usa <code>or</code>:</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>Iterar dá a chave e o valor:</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>Maps são tipos por referência, assim uma atribuição simples deixaria dois nomes para um map. <code>clone</code> é como se consegue um independente:</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p>Sem <code>clone</code> o compilador dirá que um map não pode ser copiado, e pedirá escolher entre <code>move</code>, <code>clone</code> ou uma referência. Essa pergunta é o ponto: partilhar um map por acidente é fácil, assim V faz você dizer qual queria.</p>"
		}
		'moretypes/5':    PageText{
			title: 'Strings'
			body:  "<h2>Strings</h2>
<p>Uma string V é uma sequência de bytes, o que tem uma consequência imediata: indexar dá um byte, e <code>.len</code> conta bytes.</p>
<pre><code>println(s[0])</code></pre>
<p>Exato para ASCII e errado para todo o resto, por isso existe <code>.runes()</code>. Percorre os caracteres em seu lugar:</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>Strings são imutáveis, assim cada método sobre uma devolve uma string nova:</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>São métodos e não funções num módulo, assim não há nada a importar para eles. Algumas operações vivem em <code>strings</code>, notavelmente o builder:</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>Use um builder em vez de <code>+</code> repetidos quando construir uma string longa num loop.</p>"
		}
		'moretypes/6':    PageText{
			title: 'Métodos'
			body:  "<h2>Métodos</h2>
<p>Um método é uma função com <em>receptor</em>: o valor sobre o qual é chamado.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>O tipo do receptor vem antes do nome do método, e o método é então chamado como <code>p.sum()</code>.</p>
<p>Um receptor sem <code>&amp;</code> é uma <em>cópia</em>, assim o método não pode mudar o original. Para escrever através dele, declare o receptor como referência e faça-o <code>mut</code>:</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>Essa distinção é toda a história dos métodos em V, e é a mesma que com valores comuns: a atribuição dá um valor, e uma referência é algo que se pede pelo nome.</p>
<p>Prefira um receptor por valor salvo que o método deva mesmo modificar o receptor. Um método que só lê não deveria poder.</p>"
		}
		'moretypes/7':    PageText{
			title: 'Exercício: Contagem de Palavras'
			body:  "<h2>Exercício: Contagem de Palavras</h2>
<p>Implemente <code>word_count</code> para contar quantas vezes cada palavra aparece numa string.</p>
<p>Palavras se separam por tudo que não for letra, e a contagem não deve depender de maiúsculas. Use um <code>map[string]int</code>.</p>
<p>Quando funcionar, ordene a saída em vez da ordem em que o map passear.</p>
<p>Aperte <b>Solution</b> quando tiver tentado, ou quando estiver travado.</p>"
		}
		'moretypes/8':    PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/optionresult/1'>tratamento de ausência e falhas</a>.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>V distingue duas situações que muitas linguagens misturam, e dá a cada uma seu tipo.</p>
<p>Um <code>?T</code> é um valor ou <em>none</em>. É para quando não há nada a retornar e nada deu errado: uma busca que nada achou, uma exploração sem candidatos.</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>Uma opção se desembrulha com <code>or</code>, que dá um valor para o caso none:</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>Ou com um <code>if</code>, que corre outro ramo em seu lugar:</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>A variável só se liga no ramo onde há valor. No ramo <code>else</code> a opção era <code>none</code>.</p>
<p>Opções se compõem sem cerimônia. Uma função que retorna <code>?int</code> pode retornar direto a opção de outra função:</p>
<pre><code>n := name?.len</code></pre>
<p>Esse <code>?</code> significa «se for none, retorne none desta função também». É a diferença entre propagar um valor e inventar um padrão, e por isso o corpo não precisa desembrulhar nada.</p>
<p>Imprimir uma opção mostra qual metade você tem, assim <code>Option(3)</code> e <code>Option(none)</code> se descrevem sozinhos enquanto descobre o que deu errado.</p>"
		}
		'optionresult/2': PageText{
			title: 'Result e erros'
			body:  "<h2>Result e erros</h2>
<p>Uma opção diz que não há nada. Um <code>!T</code> diz que algo <em>falhou</em>, e traz uma mensagem de como.</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>Retornar um valor simples não precisa desembrulhar; V o embrulha. Retornar <code>error(...)</code> fabrica a falha. Esse é todo o contrato.</p>
<p>O ponto de chamada tem a mesma forma que uma opção, e liga <code>err</code> no ramo <code>else</code>:</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code> dá a mensagem sozinha, sem nada que o tipo de erro tenha posto em volta. Ambas as formas se usam no exemplo.</p>
<p>A propagação funciona igual que com opções. Note o <code>!</code> em cada chamada de <code>parse_pair</code>: qualquer metade que falhe faz falhar tudo, e a mensagem viaja junto.</p>
<p>A biblioteca padrão segue esta convenção em toda parte, por isso <code>json2.decode</code> pode dizer onde seu JSON falhou:</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>A regra para escolher entre eles é curta. Se nada foi achado, uma opção. Se algo se tentou e não funcionou, um resultado. E quando uma função deva passar uma falha que não causou, propague-a com <code>?</code> ou <code>!</code> em vez de achatá-la num padrão.</p>"
		}
		'optionresult/3': PageText{
			title: 'Exercício: Options'
			body:  "<h2>Exercício: Options</h2>
<p>Escreva quatro funções, cada uma retornando uma opção.</p>
<p><code>second_largest</code> retorna o segundo maior valor <em>distinto</em> num slice, ou none quando não houver. Um maior repetido não conta, assim <code>[5, 5]</code> não tem segundo maior.</p>
<p><code>first_word</code> retorna a primeira palavra de uma string, ou none para uma vazia.</p>
<p><code>sum_all</code> toma um slice de opções e retorna um int, pulando as que forem none.</p>
<p>Depois <code>describe_all</code>, que resume a entrada. Escreva-a com propagação <code>?</code> para não conter nenhum desembrulho.</p>
<p>Aperte <b>Solution</b> quando tiver tentado, ou quando estiver travado.</p>"
		}
		'optionresult/4': PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/methods/1'>métodos e interfaces</a>.</p>"
		}
		'methods/1':      PageText{
			title: 'Interfaces'
			body:  "<h2>Interfaces</h2>
<p>V não tem classes. Um struct com métodos é tudo, e para a maioria dos programas basta.</p>
<p>Uma <em>interface</em> é uma lista de métodos. Um tipo a implementa simplesmente tendo-os: sem palavra-chave a escrever nem nada a declarar.</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p>Uma vez que <code>Dog</code> e <code>Cat</code> têm um método <code>speak</code>, qualquer um pode ser passado onde se quiser um <code>Speaker</code>:</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>Como a implementação é implícita, uma interface continua funcionando quando se adiciona um tipo depois. Um terceiro falante não precisa de mudanças em <code>announce</code> nem na interface.</p>
<p>Um slice da interface costuma ser o que se quer em vez de um slice de um tipo concreto:</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>Duas regras a guardar. Mantenha interfaces pequenas: um ou dois métodos é sinal de que a abstração é real, onde cinco costuma significar que você copiou um tipo concreto. E declare a interface onde ela é <em>usada</em>, não junto à implementação. V não exige nenhuma, mas um leitor procurará a interface na função que a consome.</p>"
		}
		'methods/2':      PageText{
			title: 'Incorporação'
			body:  "<h2>Incorporação</h2>
<p>Um struct pode incorporar outro struct, escrito como um simples nome de tipo:</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>Os campos do struct incorporado viram campos do exterior, e seus métodos vêm junto. <code>u.id</code> e <code>u.name</code> são ambos simples campos de <code>User</code>, e <code>u.describe()</code> é o método vindo de <code>Base</code>.</p>
<p>Assim um campo comum e um método comum se escrevem uma vez. Incorporar uma <em>interface</em> também funciona, e é como um tipo substitui comportamento por um campo.</p>
<p>Há uma regra que surpreende, e vale aprendê-la do jeito difícil. Um struct incorporado herda os membros do tipo exterior, mas <em>não</em> ganha acesso aos próprios métodos do tipo exterior. Assim um método em <code>Base</code> não pode chamar <code>area()</code> quando <code>area()</code> pertence ao struct que o incorpora.</p>
<p>Quando precisar que uma função trabalhe sobre vários tipos, tome melhor a interface como parâmetro:</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>Incorporar serve para partilhar estado e comportamento entre um tipo e suas partes. Interfaces servem para escrever uma vez sobre vários tipos sem relação. Respondem perguntas distintas e vale mantê-las à parte.</p>"
		}
		'methods/3':      PageText{
			title: 'Tipos imprimíveis'
			body:  "<h2>Tipos imprimíveis</h2>
<p>V imprime um valor com seu método <code>str</code> em vez de refletir seus campos, assim um tipo controla como aparece definindo um:</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>Daí em diante <code>println(t)</code>, a interpolação e a concatenação o usam:</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>Este é o método que você mais vai escrever, e vale escrevê-lo cedo: um tipo que se imprime com sentido torna cada sessão de depuração seguinte mais fácil.</p>
<p>Isso só afeta a impressão. Onde se espera uma <code>string</code>, passe uma explícita chamando <code>.str()</code>: um tipo com método <code>str</code> continua sendo seu próprio tipo, e o compilador não o converterá por você.</p>"
		}
		'methods/4':      PageText{
			title: 'Exercício: Formas'
			body:  "<h2>Exercício: Formas</h2>
<p>Quatro coisas a escrever.</p>
<p>Dê a <code>Square</code> e <code>Triangle</code> um método <code>area</code>, e faça <code>total_area</code> somar um slice de formas através da interface.</p>
<p>Depois escreva <code>describe(s Shape)</code>, que reporte o nome e a área de uma forma sem saber qual é.</p>
<p>A última parte traz uma armadilha, e achá-la é quase todo o exercício. Vai dar vontade de pôr <code>describe</code> em <code>Base</code> para cada forma herdar. Isso não funciona, e o compilador dirá por quê.</p>
<p>Aperte <b>Solution</b> quando tiver tentado, ou quando estiver travado.</p>"
		}
		'methods/5':      PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/generics/1'>genéricos</a>.</p>"
		}
		'generics/1':     PageText{
			title: 'Funções genéricas'
			body:  "<h2>Funções genéricas</h2>
<p>Um parâmetro de tipo substitui um tipo, assim uma declaração pode servir a toda uma família deles. V o escreve entre colchetes, e é a única peça de sintaxe que vale memorizar:</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>Ângulos <em>não</em> são a sintaxe aqui. Escrito como <code>fn max_of&lt;T&gt;(...)</code> é um erro de parse em vez de outra ortografia, e é a primeira coisa a acertar.</p>
<p>Você raramente nomeia o argumento de tipo. O compilador o deduz dos argumentos, e lê uma variável tão bem quanto um literal:</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>Um parâmetro de tipo só é necessário onde o compilador não pode deduzi-lo sozinho. Em posição de retorno costuma ser o ponto:</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>Esse <code>?T</code> significa o mesmo que na lição anterior: um valor ou none, do tipo que for esta instanciação.</p>
<p>Um callback se escreve como tipo de função, ou seja <code>fn (T) R</code>. Isso independiza os tipos de entrada e saída, que é o que deixa uma função ser um pipeline:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>Uma declaração, e uma instanciação separada por cada tipo de argumento recebido. Sem boxing nem apagamento: <code>apply</code> chamado com um callback <code>int</code> e com um <code>string</code> são duas funções distintas, por isso o tipo do callback deve ser escrito em vez de adivinhado.</p>"
		}
		'generics/2':     PageText{
			title: 'Structs genéricos'
			body:  "<h2>Structs genéricos</h2>
<p>Um struct toma um parâmetro de tipo igual que uma função, e cada campo que o menciona pertence à instanciação:</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>Assim <code>Stack[int]</code> guarda um <code>[]int</code> e <code>Stack[string]</code> guarda um <code>[]string</code>, e são dois tipos distintos. Vale parar aqui, porque significa que não se pode pôr uma pilha <code>int</code> e uma <code>string</code> num slice sem apagar o tipo em algum lado.</p>
<p>Métodos também levam o parâmetro. <code>mut</code> no receptor é o que deixa um método mudar o struct, e <code>&amp;</code> diz que só o lê:</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p>O <code>?T</code> é o tipo opção parametrizado igual, assim tirar de uma pilha vazia dá <code>none</code> em vez de um panic.</p>
<p>Dois parâmetros é a mesma ideia duas vezes, independentes entre si:</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>Aqui está o limite que pega, e vale ser preciso, porque a mensagem de erro não aponta o método que você olha. <code>A</code> e <code>B</code> não têm relação, assim não há conversão a oferecer entre eles, e um método não pode mover um valor de um campo ao outro:</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>A razão é uma propriedade dos métodos genéricos mais que dos pares, e vale entendê-la mais que memorizá-la. Um corpo de método genérico se verifica contra <em>cada</em> instanciação usada, assim tem de valer para todas de uma vez. Por isso o método vale em <code>Pair[int, int]</code>, onde ambos os campos guardam um tipo, e segue recusado assim que <code>Pair[string, int]</code> o usa. O erro nomeia a instanciação culpada em vez da declaração:</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>A regra a guardar é que um método genérico só pode prometer algo certo para cada tipo com que for instanciado. Ler ambos os campos sempre qualifica, por isso <code>describe</code> funciona para cada instanciação:</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: 'Maps de tipos genéricos'
			body:  "<h2>Maps de tipos genéricos</h2>
<p>Um tipo genérico pode ser o tipo de valor de um map, e o argumento de tipo se escreve no ponto de uso. O map é então um map comum de um tipo concreto:</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p><code>Stack</code> sozinho não basta aqui. O map precisa saber de quê seus valores são pilhas, e omitir o argumento é um erro em vez de algo que o compilador infira depois.</p>
<p>Uma consequência a saber: <code>map[string]Stack[int]</code> e <code>map[string]Stack[string]</code> são tipos distintos, assim um programa que precise de ambos deve dizê-lo em vez de deixar um suplantar o outro.</p>
<p>Métodos genéricos estão disponíveis nos valores que o map entrega, que é o que faz o map útil e não só legal:</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>Note o <code>_,</code> no loop de map. Nomear a chave seria <code>for team, stack in teams</code>; o traço só diz que a chave não é necessária. Deve ir só: um traço seguido de nome se recusa, assim <code>_k</code> não vale.</p>
<p>Maps são tipos por referência, que é o que faz funcionar a escrita em dois passos: <code>teams['red'].push(10)</code> acha a pilha no map e muta o mesmo struct, em vez de copiá-lo e perder a mudança.</p>"
		}
		'generics/4':     PageText{
			title: 'Vários parâmetros de tipo'
			body:  "<h2>Vários parâmetros de tipo</h2>
<p>Parâmetros de tipo se empilham. Dois numa função costumam ser o tipo de entrada e o de saída, que é o que faz uma função genérica um mapeamento:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>Um parâmetro de tipo não tem de aparecer no corpo. Soa a forma de escrever uma função inútil, e costuma ser exatamente certo: o parâmetro restringe a assinatura sem custar nada no ponto de chamada.</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>Nada no corpo menciona <code>K</code>, assim é a mesma função para um map com chaves strings e para um com ints. O <code>?V</code> é deliberado: um map vazio não tem primeiro valor, assim a função retorna none em vez de inventar um.</p>
<p>A forma mais comum é uma função genérica sobre um map, com um callback decidindo o que fazer com cada valor:</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p><code>K</code> e <code>V</code> se inferem do map, e <code>R</code> fica fixo em <code>int</code> porque isso retorna o callback. Onde a inferência não tem de quê trabalhar, nomeie os argumentos explicitamente: <code>first_map[string, int](m)</code>.</p>
<p>Algo que a inferência não fará é salvar um argumento incompatível. Se passar um <code>Counter[V]</code> onde se quer um <code>map[K]Counter[V]</code>, o erro nomeia um <code>K</code> não inferível em vez do problema real, um primeiro encontro confuso. Revise o tipo do argumento antes de caçar um bug de genéricos.</p>"
		}
		'generics/5':     PageText{
			title: 'Exercício: Genéricos'
			body:  "<h2>Exercício: Genéricos</h2>
<p>Quatro coisas a escrever, e entre elas usam cada forma desta lição.</p>
<p><code>index_of[T]</code> retorna a posição de um valor num slice, ou -1. Funciona em qualquer tipo que suporte <code>==</code>.</p>
<p><code>count_matching[T]</code> conta quantos itens satisfazem um predicado. O predicado é um callback, assim seu tipo se escreve <code>fn (T) bool</code>.</p>
<p>Depois <code>Counter[K]</code>, um struct genérico guardando uma contagem por chave. Dê-lhe <code>add</code> e <code>get</code>, e note que <code>K</code> se usa dentro de outro tipo genérico aqui: um map cuja chave é o parâmetro de tipo.</p>
<p>Por fim <code>grand_total[K, V]</code>, que soma um map de contadores ponderado por um callback da chave. Dois parâmetros de tipo, e um struct genérico como tipo de valor do map.</p>
<p>Aperte <b>Solution</b> quando tiver tentado, ou quando estiver travado.</p>"
		}
		'generics/6':     PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição!</p>
<p>Você pode voltar para a <a href='/list'>lista de módulos</a> para ver o que aprender em seguida, ou continue com <a href='/concurrency/1'>concorrência</a>.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p><code>spawn</code> arranca uma thread e volta na hora. Devolve um handle, e o handle é como se espera pela thread depois:</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> em si não espera nada. Um programa que termina enquanto uma thread ainda trabalha deixa essa thread no meio, assim a regra é que cada spawn seja esperado no fim.</p>
<p>Para um conjunto fixo de tarefas, junte os handles num slice. O tipo de elemento é <code>thread</code>, e <code>wait()</code> no slice junta todos:</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>Quando os workers retornam algo, o slice é <code>[]thread int</code> e <code>wait()</code> entrega os resultados em ordem:</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>A ordem merece precisão. Os resultados voltam na ordem em que os handles foram adicionados, não na que as threads terminaram, assim é uma forma de juntar respostas e não de impor ordem ao trabalho. Que thread imprime primeiro não é algo de que um programa deva depender, e a saída intercalada do exemplo é a versão honesta.</p>"
		}
		'concurrency/2':  PageText{
			title: 'Channels'
			body:  "<h2>Channels</h2>
<p>Um channel move valores de um tipo de uma thread a outra. Crie-o com o tipo de elemento e uma capacidade, e envie e receba com a mesma seta:</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>Ambas as direções são <code>&lt;-</code>, porque ambas recebem do outro lado. Não há <code>ch.recv()</code> nem <code>ch.pop()</code>: o compilador os rejeita como funções desconhecidas. Se está acostumado a um método aqui, isso é o que há a desaprender.</p>
<p><code>chan int{}</code> sem capacidade é <em>sem buffer</em>, ou seja o channel não guarda nada. Um envio não pode terminar até um receptor estar lá, e uma recepção não pode terminar até um emissor ter produzido algo. Cada valor é um aperto de mãos entre duas threads:</p>
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
<p>Leia a saída do exemplo e o aperto é visível: envios e recepções se alternam, e não estão numa ordem fixa em que deva confiar. Esse é o ponto do channel sem buffer, não um defeito.</p>
<p>Um channel carrega exatamente um tipo, assim esperar duas classes de mensagem distintas quer dizer dois channels. <code>select</code>, adiante, é como se espera em mais de um por vez.</p>"
		}
		'concurrency/3':  PageText{
			title: 'Channels com buffer'
			body:  "<h2>Channels com buffer</h2>
<p>Uma capacidade dá espaço ao channel, assim um emissor pode se adiantar em vez de bloquear a cada valor:</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>A diferença é mensurável. Com buffer, todos os envios se completam e <code>len()</code> diz quantos valores esperam. Sem ele, <code>len()</code> fica em zero por muito que espere, porque não há onde pô-los:</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>Escolha o buffer quando um produtor não deva ficar retido por um consumidor lento. A capacidade se fixa ao criar o channel, e um channel com buffer e um sem buffer do mesmo tipo de elemento são tipos distintos.</p>
<p>Aqui há uma armadilha que vale o meio minuto de lembrá-la. O campo que fixa o tamanho é <code>cap:</code>, e escrever <code>len:</code> em seu lugar é recusado em vez de ignorado em silêncio:</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>A mensagem nomeia o campo querido, que é o melhor possível. A outra armadilha não é de ortografia. O buffer só ajuda até a capacidade: um emissor com mais a enviar que espaço bloqueia no primeiro valor que não cabe. Assim com quatro vagas e seis tarefas, e sem consumidor arrancado, o quinto envio espera um consumidor que não corre. Ou buferize toda a lista ou arranque antes os consumidores.</p>"
		}
		'concurrency/4':  PageText{
			title: 'Receber até o fechamento'
			body:  "<h2>Receber até o fechamento</h2>
<p><strong>Não há <code>for x in ch</code> em V.</strong> Um channel não é uma coleção, assim o loop for não tem nada a indexar, e o compilador diz:</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>Se vem de uma linguagem onde um channel pode ser percorrido, isso é o primeiro que fará errado. Receba com <code>&lt;-ch</code>, e para ler um channel até o fim, receba até parar de dar:</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p>O <code>or</code> fornece o valor que termina o loop, e esta é a parte fácil de errar na outra direção: <strong><code>or</code> só dispara quando o channel está fechado e vazio.</strong> Num channel aberto sem nada dentro, <code>&lt;-ch or { -1 }</code> segue bloqueando, esperando um emissor. Não é uma consulta não bloqueante, pareça ou não.</p>
<p>Um detalhe dos envios que custará uma tarde se ninguém mencionar. A expressão de envio para na seta, assim um valor calculado à direita precisa de parênteses:</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>Sem eles o compilador tenta multiplicar o void que <code>ch &lt;- i</code> produziu, e o diz de forma que não aponta a seta.</p>
<p>Quando o produtor disse a conta, o loop sobra:</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>Essa forma simples tem um fio. Um <code>&lt;-ch</code> simples num channel fechado e vazio não bloqueia nem entra em panic: entrega o <em>valor zero</em> do tipo de elemento, sempre. Peça um valor a mais e obtém um <code>0</code> silencioso, uma string vazia ou um struct zero em vez de um erro:</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>Prefira <code>or</code> quando a conta não for certa, e use <code>try_pop</code> quando quiser olhar sem esperar:</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: 'Fechamento'
			body:  "<h2>Fechamento</h2>
<p>Feche um channel quando seu produtor terminar com ele, e feche-o desde o produtor. O produtor possui o channel igual que possui a decisão de parar:</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>Um detalhe que pega: <code>close</code> sozinho não é como se fecha um channel. Escrito como chamada simples é o builtin que fecha um descritor de ficheiro, e falha num channel com mensagem confusa:</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>Fechar não joga fora o que ainda está em buffer. Os valores no channel se entregam primeiro ao leitor, em ordem, e só uma vez vazio uma recepção nada acha. Essa ordem é o que faz de close o sinal que deve ser.</p>
<p>O que close não faz é legalizar um envio. Enviar num channel fechado é um panic em execução, e fechar duas vezes também, assim a regra é um fecho por channel desde o único sítio que o possui.</p>
<p>E close não é uma espera. Receber de um channel aberto e vazio segue bloqueando, feche alguém algum dia ou não.</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  "<h2>Select</h2>
<p><code>select</code> espera em vários channels e corre o corpo do que estiver pronto. É como tomar a primeira resposta em vez de uma ordem fixa:</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>Um ramo é uma recepção ou um envio, assim ambas as direções podem competir:</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>Duas restrições a saber antes de escrever um, ambas medidas contra o compilador mais que documentadas.</p>
<p><strong>Mantenha as duas formas em selects separados.</strong> Um select com ramo de envio <em>e</em> de recepção trava o compilador em vez de reportar erro, assim emparelhe um envio com um timeout ou com outro envio.</p>
<p><strong>Um ramo deve nomear um channel que já exista.</strong> Escrever o channel em linha se recusa:</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>E os ramos atribuem em vez de devolver, assim a variável em que escrevem deve ser <code>mut</code>. Uma duração em posição de ramo é um timeout, e só um por select. Assim uma espera deixa de ser ilimitada:</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> é o ramo para quando nada está pronto, e não espera. É a forma não bloqueante:</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>Como expressão um select se avalia a <strong>bool</strong>: true quando correu um ramo de channel, false quando o fez <code>else</code>. Não se avalia ao valor do ramo, assim leia o valor no ramo e teste o bool à parte.</p>
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
<p>Uma assimetria a prever. Uma vez fechado um channel, receber dele está sempre pronto, assim um channel fechado ganha o select toda ronda. Num loop sobre vários channels, esvazie os que importam e verifique você o fecho em vez de confiar no select para passá-lo.</p>"
		}
		'concurrency/7':  PageText{
			title: 'Estado compartilhado'
			body:  "<h2>Estado compartilhado</h2>
<p>Channels movem valores. Quando várias threads devem mudar o <em>mesmo</em> valor, esse é trabalho de um lock.</p>
<p>O não óbvio é como o estado se partilha. Um struct passado a uma thread por valor é uma cópia, e cada thread teria a sua. A palavra-chave <code>shared</code> no parâmetro é o que o faz um só:</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>Note <code>shared t</code> na lista de parâmetros e <code>spawn add(shared total, i)</code> no ponto de chamada. Ambas necessárias. Passe sem a palavra e a thread obtém uma cópia, assim o contador nunca se move.</p>
<p><code>lock</code> é um bloco, não uma chamada, e a chave de fecho o libera. Não há instrução <code>unlock</code> a emparelhar, e escrever uma é um erro de sintaxe. Mantenha-o o mínimo possível: nem através de um spawn, nem de um envio, nem em volta do trabalho real. Um lock segurado sobre algo que pode bloquear é como um programa trava.</p>
<p><code>rlock</code> é a versão de leitura, e é para uma estrutura lida muito mais que escrita:</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p>Uma variável <code>shared</code> também deve ser travada no ponto de uso, assim o compilador não deixará esquecer o lock por acidente.</p>
<p>Há algo a vigiar, e é a razão pela que o exemplo lê um valor antes de esperar suas threads. Spawn não espera, assim ler estado partilhado logo após um spawn é uma corrida: o valor visto depende de quão avançadas vão as threads. Espere os escritores antes de ler, ou aceite que o número é provisório.</p>"
		}
		'concurrency/8':  PageText{
			title: 'Grupos de espera'
			body:  "<h2>Grupos de espera</h2>
<p>Um grupo de espera conta trabalho em curso. <code>add</code> antes do spawn, <code>done</code> dentro, e <code>wait</code> quando tiver arrancado tudo:</p>
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
<p>Tome o grupo como <code>&amp;sync.WaitGroup</code> e não <code>mut &amp;sync.WaitGroup</code>. A referência <code>mut</code> compila e depois cai dentro do contador atômico em execução, assim a referência simples é a forma a usar.</p>
<p><code>wg.go</code> empacota o add e o arranque da thread, o que tira o passo onde ambos se separam:</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>Toma um closure em vez de uma chamada, e um closure em V deve nomear o que lê. A lista <code>fn [ch, i] ()</code> é essa declaração, e omitir uma variável é um erro de compilação que nomeia a variável em vez de nada de concorrência.</p>
<p>Três regras, e são quase tudo que sai errado. Cada <code>add</code> precisa de seu <code>done</code>, e um <code>done</code> sem <code>add</code> entra em panic. Cada spawn deve passar antes do <code>wait</code>, porque isso é tudo que o wait vê. E uma thread que entra em panic leva todo o processo consigo, assim uma função spawneada precisa de seu próprio <code>defer</code> se puder falhar no meio.</p>"
		}
		'concurrency/9':  PageText{
			title: 'Exercício: Um pool de workers'
			body:  "<h2>Exercício: Um pool de workers</h2>
<p>Construa um pool de workers e alimente-o de tarefas.</p>
<p><code>worker</code> toma uma tarefa de um channel, dobra-a, e envia o resultado a outro channel. Recebe um grupo de espera para que o pool saiba quando terminou.</p>
<p><code>run_all</code> toma um slice de tarefas e um número de workers, e devolve os resultados na ordem em que chegaram.</p>
<p>A ordem de operações é todo o exercício, e quatro coisas devem ser certas por vez:</p>
<ul>
<li>O channel de tarefas se fecha <em>antes</em> de arrancarem os workers, ou um worker pode ficar esperando um fecho que nunca vinha.</li>
<li>Cada <code>add</code> passa antes do <code>wait</code>, e cada <code>done</code> dentro do worker.</li>
<li>Ambos os channels têm buffer, para que um worker nunca bloqueie devolvendo um valor.</li>
<li>Os resultados se colhem com <code>&lt;-results or { break }</code>, já que não há <code>for</code> sobre um channel.</li>
</ul>
<p>Dois deles são o deadlock que este exercício costuma destapar: um channel de tarefas com menos sítio que a lista de tarefas, ou resultados lidos antes do <code>wait</code>.</p>
<p>Aperte <b>Solution</b> quando tiver tentado, ou quando estiver travado.</p>"
		}
		'concurrency/10': PageText{
			title: 'Parabéns!'
			body:  "<p>Você terminou esta lição, e com ela todo o tour!</p>
<p>Volte para a <a href='/list'>lista de módulos</a> para reler o que quiser, ou comece novamente em <a href='/welcome/1'>primeiros passos</a>.</p>"
		}
		'cli/1':          PageText{
			title: 'Comandos do dia a dia'
			body:  "<h2>Comandos do dia a dia</h2>
<p>Três comandos correm com quase cada mudança. <code>v fmt -w .</code> formata o projeto, <code>v vet .</code> reporta construções suspeitas e <code>v test .</code> roda a suite de testes:</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>Formate antes de cada commit, para que a revisão nunca discuta formato.</p>
<p><code>v doc strings</code> mostra a documentação de um módulo, <code>v repl</code> abre um prompt interativo e <code>v watch run main.v</code> reconstrói e re-executa quando muda um fonte.</p>"
		}
		'vpm/1':          PageText{
			title: 'Pacotes'
			body:  "<h2>Pacotes</h2>
<p>Bibliotecas vivem no registro de pacotes. Busque-o, inspecione um resultado e instale-o:</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p><code>v list</code> mostra de que o projeto depende. <code>v outdated</code> reporta versões novas, <code>v update</code> as traz e <code>v remove</code> tira uma.</p>
<p>Esses comandos tocam a rede, assim correm na sua máquina e não no sandbox deste tour.</p>"
		}
		'mcp/1':          PageText{
			title: 'O protocolo de contexto do modelo'
			body:  "<h2>v mcp</h2>
<p><code>v mcp serve</code> expõe o compilador mesmo a um agente de código: declarações, referências e diagnósticos por entrada e saída padrão:</p>
<pre><code>v mcp serve</code></pre>
<p><code>v mcp tools</code> lista o exposto. Sirva por HTTP com <code>--http</code>, resolva rotas relativas contra um diretório com <code>--root</code>, e não registre ferramentas de escrita com <code>--read-only</code>.</p>
<p><code>v mcp install</code> conecta o servidor a um agente, e <code>v mcp uninstall</code> o tira. Esta superfície é nova, assim precisa de um V recente em vez do release que corre este sandbox.</p>"
		}
		'skills/1':       PageText{
			title: 'Habilidades'
			body:  "<h2>Habilidades</h2>
<p>Skills são instruções empacotadas que um agente carrega para uma tarefa: as regras da linguagem, o ciclo de testes, a superfície de ferramentas:</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>Skills se instalam em <code>.agents/skills/</code> no projeto, ou sob seu home com <code>--global</code>. <code>v skills path v-tools</code> mostra onde vive uma, e <code>--dry-run</code> reporta sem escrever nada.</p>
<p>Como <code>v mcp</code>, é superfície nova: precisa de um V recente.</p>"
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
