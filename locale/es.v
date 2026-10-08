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
		'welcome/1':      PageText{
			title: 'Hola, Mundo'
			body:  "<p>Bienvenido a un tour por el <a href='https://vlang.io'>lenguaje de programación V</a>.</p>
<p>El tour está dividido en módulos. Puedes acceder a ellos desde la <a href='/list'>tabla de contenidos</a> o con el botón de menú en la esquina superior derecha.</p>
<p>A lo largo del tour encontrarás diapositivas y ejercicios. Navega con los enlaces <b>anterior</b> y <b>siguiente</b> debajo del texto, o con las teclas <code>PageUp</code> y <code>PageDown</code>.</p>
<p>El tour es interactivo. Pulsa <b>Ejecutar</b> (o <code>Shift</code>+<code>Enter</code>) para compilar y ejecutar el programa. El resultado aparece debajo del código.</p>
<p>Estos programas son puntos de partida para tus propios experimentos. Edita el programa y ejecútalo de nuevo.</p>"
		}
		'welcome/2':      PageText{
			title: 'Usar este tour'
			body:  '<p>Cada página tiene una columna de texto a la izquierda y una columna de código a la derecha. Entre ellas hay un asa de redimensionamiento: arrástrala para dar más espacio al código.</p>'
		}
		'welcome/3':      PageText{
			title: 'V sin conexión (opcional)'
			body:  '<p>No necesitas una instalación local de V para usar este tour, pero es recomendable.</p>'
		}
		'welcome/4':      PageText{
			title: 'El sandbox'
			body:  '<p>Tus programas se ejecutan en un sandbox en el servidor.</p>'
		}
		'welcome/5':      PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado el primer módulo del tour!</p>
<p>Vuelve a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa directamente con <a href='/basics/1'>los fundamentos del lenguaje</a>.</p>"
		}
		'basics/1':       PageText{
			title: 'Módulos'
			body:  "<h2>Módulos</h2>
<p>Cada archivo V declara el <em>módulo</em> al que pertenece. La declaración es lo primero del archivo.</p>
<p>Un programa empieza en el módulo llamado <code>main</code>, en una función llamada <code>main</code>.</p>
<p>Este programa usa los módulos de la biblioteca estándar <code>math</code> y <code>strings</code>.</p>
<p>En V hay un módulo por directorio, y el nombre del módulo coincide con su directorio. Un símbolo solo es visible fuera de su módulo si está marcado con <code>pub</code>.</p>"
		}
		'basics/2':       PageText{
			title: 'Imports'
			body:  "<h2>Imports</h2>
<p>Un módulo importado trae sus nombres exportados al archivo actual.</p>
<p>La biblioteca estándar se importa por nombre de módulo: <code>import math</code>, <code>import strings</code>. Las bibliotecas de terceros se importan igual.</p>
<p>No toda operación de un módulo se escribe como llamada a función. Algunas son _métodos_ sobre el valor, así <code>s.to_upper()</code> funciona sobre un string sin ningún import.</p>
<p>Ambos estilos aparecen en la biblioteca estándar, así que vale la pena leer la firma en vez de adivinar.</p>"
		}
		'basics/3':       PageText{
			title: 'Variables'
			body:  "<h2>Variables</h2>
<p>Ejecuta el código. Fíjate en el mensaje de error.</p>
<p>Las variables de V se declaran con <code>:=</code>. A diferencia de la mayoría de lenguajes, una variable en V es <em>inmutable por defecto</em>, y hay que pedir la mutabilidad explícitamente.</p>
<p>El compilador lo dice. La línea 6 intenta asignar a <code>sum</code> sin haber pedido permiso.</p>
<p>Para arreglar el error, añade <code>mut</code> a la declaración de la línea 4 e inténtalo de nuevo.</p>"
		}
		'basics/4':       PageText{
			title: 'Variables mutables'
			body:  "<h2>Variables mutables</h2>
<p>Para declarar una variable mutable, añade la palabra clave <code>mut</code> antes del nombre.</p>
<p>V lo exige porque la mutación es algo que hay que querer. Una variable que nunca se reasigna es más fácil de razonar para el compilador, y más fácil para ti cuando vuelves al código más tarde.</p>
<p>Quita el <code>mut</code> y ejecútalo de nuevo. Ese es el error de la página anterior.</p>
<p>Verás <code>mut</code> por todas partes en V, incluyendo parámetros de función y campos de struct.</p>"
		}
		'basics/5':       PageText{
			title: 'Declaraciones cortas'
			body:  "<h2>Declaraciones cortas</h2>
<p><code>:=</code> declara una variable y deduce su tipo del valor.</p>
<p>Cuando el tipo no es obvio, o cuando quieres ser específico, nómbralo directamente con una _conversión_ como <code>i64(42)</code> o <code>f64(1.5)</code>.</p>
<p>No hay una forma separada de «declara ahora, asigna después». Una variable V siempre tiene valor en el punto donde entra en scope, por eso los valores cero que verás en una página posterior los produce el compilador y no tú.</p>"
		}
		'basics/6':       PageText{
			title: 'Funciones'
			body:  "<h2>Funciones</h2>
<p>Las funciones se declaran con <code>fn</code>.</p>
<p>Una función puede tomar cero o más parámetros. Los parámetros se escriben con nombre y tipo, y parámetros consecutivos del mismo tipo se escriben como <code>x, y int</code>.</p>
<p>El resultado de la función se nombra tras la lista de parámetros. Las funciones V devuelven exactamente un valor, salvo que el tipo de retorno sea una tupla.</p>
<p>Una función cuyo cuerpo es una sola expresión puede escribirse en una línea: <code>fn double(x int) int { return x * 2 }</code></p>"
		}
		'basics/7':       PageText{
			title: 'Múltiples resultados'
			body:  "<h2>Múltiples resultados</h2>
<p>Una función puede devolver más de un valor. Escribe el tipo de retorno como una tupla:</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>
<p>Quien llama desestructura el resultado en variables:</p>
<pre><code>lo, hi := min_max(nums)</code></pre>
<p>El tipo de retorno simplemente lista cada valor, y quien llama los desestructura en variables. Un valor que no se necesite se ignora con <code>_</code>.</p>
<p>Esta es la forma que verás para todo lo que puede fallar, lo que se cubre en un módulo posterior.</p>"
		}
		'basics/8':       PageText{
			title: 'Tipos básicos'
			body:  "<h2>Tipos básicos</h2>
<p>Los booleanos son <code>true</code> y <code>false</code>.</p>
<p>Los enteros vienen en tamaños fijos, <code>i8</code>, <code>i16</code>, <code>i32</code> y <code>i64</code>, y los tamaños sin signo de <code>u8</code> a <code>u64</code>. El propio <code>int</code> es de 32 bits, e <code>isize</code> es el ancho de la plataforma, así que nombra <code>i32</code> o <code>i64</code> cuando el ancho importe.</p>
<p>Los tipos de coma flotante son <code>f32</code> y <code>f64</code>.</p>
<p>Un <code>rune</code> guarda un punto de código Unicode.</p>
<p>Los strings son inmutables y se escriben entre comillas simples.</p>"
		}
		'basics/9':       PageText{
			title: 'Valores cero'
			body:  "<h2>Valores cero</h2>
<p>Cada tipo tiene un <em>valor cero</em>, que es lo que contiene una variable antes de que se le asigne nada.</p>
<p>El valor cero es <code>0</code> para números, <code>false</code> para booleanos, el string vacío para strings, y la colección vacía para arrays, slices y maps.</p>
<p>Para un struct, el valor cero es el struct con todos sus campos en sus valores cero.</p>
<p>Como V exige un valor en el punto de declaración, rara vez los escribes tú. El compilador los produce por ti, por eso el ejemplo compila aunque la parte derecha parezca redundante.</p>"
		}
		'basics/10':      PageText{
			title: 'Constantes'
			body:  "<h2>Constantes</h2>
<p>Una <code>const</code> es un valor que el compilador conoce mientras construye tu programa, así que debe ser una expresión constante.</p>
<p>Las constantes se escriben con <code>const</code>, una a una o en grupo entre paréntesis.</p>
<p>A diferencia de <code>final</code> en otros lenguajes, reutilizar el nombre de una <code>const</code> para una variable solo produce una advertencia del compilador. Trata esa advertencia como un error: si un nombre es constante, debe seguir siéndolo en todas partes.</p>"
		}
		'basics/11':      PageText{
			title: 'Conversiones de tipo'
			body:  "<h2>Conversiones de tipo</h2>
<p>V nunca convierte un tipo implícitamente. Pasar de uno a otro siempre se escribe:</p>
<pre><code>fl := f64(i)</code></pre>
<p>Algunas conversiones pierden información y otras se rechazan directamente, así que el compilador te dirá cuando una conversión no tenga sentido.</p>
<p>Los strings no son números. Para leer uno como número, conviértelo, y recuerda que el resultado puede ser un valor cero si el texto no se pudo interpretar.</p>
<p>También puedes preguntar al compilador el nombre de un tipo con <code>typeof(x).name</code>.</p>"
		}
		'basics/12':      PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continuar con <a href='/controlflow/1'>flujo de control</a>.</p>"
		}
		'basics/13':      PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continuar con <a href='/controlflow/1'>flujo de control</a>.</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  "<h2>For</h2>
<p>V tiene una palabra clave de bucle, y viene en tres formas.</p>
<p>La forma contada se parece a C:</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>
<p>Una condición sola es un bucle while, y sin condición repite para siempre.</p>
<p><code>break</code> sale del bucle y <code>continue</code> salta a la siguiente iteración.</p>
<p>Cambia el bucle para que cuente hacia atrás desde 5 en vez de hasta 3, y ejecútalo de nuevo.</p>"
		}
		'controlflow/2':  PageText{
			title: 'For es el "while" de V'
			body:  "<h2>For es el «while» de V</h2>
<p>Un <code>for</code> con una sola condición sigue hasta que esa condición sea falsa.</p>
<pre><code>for sum &lt; 1000 {</code></pre>
<p>Un <code>for</code> sin ninguna condición es un <em>bucle infinito</em>:</p>
<pre><code>for {</code></pre>
<p>El ejemplo sale del segundo bucle tras tres iteraciones. Si borras el <code>if</code> y el <code>break</code>, el sandbox detendrá el programa cuando agote su tiempo de CPU.</p>"
		}
		'controlflow/3':  PageText{
			title: 'For continuado'
			body:  "<h2>For continuado</h2>
<p>Iterar una colección usa <code>in</code> en vez de un índice. Esta es la forma a la que recurrir por defecto, porque no puede salirse de rango.</p>
<pre><code>for i, v in items {</code></pre>
<p>Usa <code>_</code> para ignorar el índice:</p>
<pre><code>for _, v in items {</code></pre>
<p>Para iterar un número conocido de veces, usa un rango: <code>for i in 0 .. n</code>. Nota que <code>..</code> es exclusivo: corre <code>n</code> veces, de <code>0</code> a <code>n-1</code>.</p>
<p>Los maps dan la clave y el valor.</p>"
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  "<h2>If</h2>
<p>Un <code>if</code> se escribe así:</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>
<p>No hay condición entre paréntesis ni palabra clave <code>then</code>.</p>
<p>Como un <code>if</code> es una expresión que puede devolver un valor, el patrón de arriba es idiomático: maneja el caso interesante y retorna pronto, luego sigue con lo ordinario.</p>
<p>Usa <code>else if</code> para una cadena de pruebas. V toma cada rama tal cual, así que revisa la cadena tú: una rama cuya prueba nunca pueda ser cierta simplemente nunca corre, y el compilador no la señalará.</p>"
		}
		'controlflow/5':  PageText{
			title: 'If con valor desempaquetado'
			body:  "<h2>If con valor desempaquetado</h2>
<p>Una función V puede devolver un valor <em>o</em> un error. El tipo de retorno se escribe con un <code>!</code> delante:</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>Dentro del cuerpo, haz <code>return</code> de un valor simple y V lo envuelve por ti. Para fallar, devuelve <code>error(...)</code> en su lugar.</p>
<p>En el punto de llamada, un <code>if</code> puede desenvolver el resultado. El valor exitoso se liga a <code>v</code>, y si hubo error, la rama <code>else</code> corre con el error ligado a <code>err</code>:</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>Ejecútalo dos veces. La primera llamada tiene éxito y la segunda no, y ambas toman la rama esperada.</p>
<p>Así maneja la mayoría del código V lo que puede salir mal. El <a href='/optionresult/1'>siguiente módulo</a> lo cubre en serio.</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  "<h2>Match</h2>
<p>V no tiene palabra clave <code>switch</code>. Tiene <code>match</code>, que cubre más casos que un switch común.</p>
<p>Compara un valor:</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>
<p>Compara un rango. Los rangos en <code>match</code> son <em>inclusivos</em> por ambos extremos, lo opuesto al <code>..</code> que usas en <code>for</code>:</p>
<pre><code>1 ... 3 { }</code></pre>
<p>Compara un enum. Cada valor necesita una rama, o el <code>match</code> necesita un <code>else</code>, así no se puede añadir un valor sin que el compilador apunte cada <code>match</code> a actualizar.</p>"
		}
		'controlflow/7':  PageText{
			title: 'Match y tipos suma'
			body:  "<h2>Match y tipos suma</h2>
<p>Un <em>tipo suma</em> se declara con <code>=</code> y una lista de alternativas:</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>Un valor de ese tipo es exactamente una de las alternativas, nunca más de una.</p>
<p>Compararlo dice cuál. Dentro de una rama, la variable original queda <em>convertida</em> a esa variante, así sus campos están disponibles directamente sin casts.</p>
<p>Cada alternativa necesita una rama, o el match necesita un <code>else</code>. El compilador lo exige, así una alternativa nueva no puede ignorarse en silencio.</p>
<p>Añade una cuarta forma al tipo suma y ejecútalo. El compilador te dirá exactamente qué <code>match</code> te faltaron.</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  "<h2>Defer</h2>
<p><code>defer</code> programa una sentencia para correr cuando el bloque que lo contiene termina.</p>
<p>Corre como termine el bloque: llegando al final, con un <code>return</code> temprano, o al desenrollar desde un panic. Por eso sirve para limpieza.</p>
<pre><code>defer {
	println('this runs last')
}</code></pre>
<p>En el ejemplo, <code>with_defer</code> corre su cuerpo, luego la sentencia diferida. <code>early_return</code> retorna en medio, y la sentencia diferida igual corre.</p>"
		}
		'controlflow/9':  PageText{
			title: 'Ejercicio: Bucles y Funciones'
			body:  "<h2>Ejercicio: Bucles y Funciones</h2>
<p>Escribe <code>sum_to</code> para que devuelva la suma de los números de <code>0</code> a <code>n</code>, y <code>sum_squares</code> para la suma de sus cuadrados.</p>
<p>Hazlo dos veces: una de la forma más directa, y una con un bucle <code>for</code> explícito.</p>
<p>Luego reescribe ambas para correr en tiempo <em>O(1)</em>.</p>
<p>Pulsa <b>Solution</b> cuando lo hayas intentado, o cuando estés atascado.</p>"
		}
		'controlflow/10': PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Vuelve a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/moretypes/1'>más tipos</a>.</p>"
		}
		'moretypes/1':    PageText{
			title: 'Structs'
			body:  "<h2>Structs</h2>
<p>Un <em>struct</em> agrupa valores bajo un nombre. Es la forma de V de decir «van juntos».</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>
<p>Un valor se crea con <code>Point{ x: 3, y: 4 }</code>, y los campos se leen con <code>p.x</code>.</p>
<p>Dos cosas a notar.</p>
<p>Primero, un struct puede imprimirse solo, así <code>println(p)</code> muestra cada campo sin trabajo extra.</p>
<p>Segundo, la mutabilidad funciona igual que con variables ordinarias. La variable necesita <code>mut</code>:</p>
<pre><code>mut r := p
r.x = 100</code></pre>
<p>y el propio campo tiene que estar declarado bajo <code>mut</code> en el struct:</p>
<pre><code>struct Point {
mut:
	x int
	y int
}</code></pre>
<p>Un campo que no está bajo <code>mut</code> no puede asignarse. Aún puede leerse, pasarse y copiarse.</p>
<p>Quita <code>mut:</code> del struct y ejecuta el ejemplo. El compilador apuntará la línea que asigna a <code>x</code>.</p>"
		}
		'moretypes/2':    PageText{
			title: 'Arrays'
			body:  "<h2>Arrays</h2>
<p>Un array tiene longitud fija, y su tipo de elemento viene de su primer elemento:</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>Un array también puede crearse con longitud y valor inicial:</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>Los arrays se indexan con <code>[]</code>, y llevan su longitud:</p>
<pre><code>println(numbers.len)</code></pre>
<p>Cuando dos valores no deben compartir contenido, pide una copia explícita con <code>clone</code>:</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>Úsalo cuando pases una colección a algo que no quieres que pueda cambiarla, porque lo dice en el punto de uso en vez de apoyarse en una regla a recordar.</p>
<p>Las transformaciones usuales son métodos en vez de funciones libres:</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> es el elemento actual.</p>"
		}
		'moretypes/3':    PageText{
			title: 'Slices'
			body:  "<h2>Slices</h2>
<p>Una slice es una vista sobre un rango de un array u otra slice, escrita con la misma sintaxis <code>[]</code>:</p>
<pre><code>part := arr[1..3]</code></pre>
<p>Las slices también pueden construirse de la nada y crecer. Crecer puede mover los datos, así la variable tiene que ser <code>mut</code>:</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> añade. Funciona en cualquier slice, y en un array de tamaño fijo es un error de compilación en vez de una sorpresa en ejecución.</p>
<p>Trocear otra slice da una slice de ella. Como con arrays, <code>clone</code> cuando necesites una copia independiente:</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>Nota que los rangos son <em>exclusivos</em>: <code>0 .. n</code> corre <code>n</code> veces, y un bucle <code>for</code> solo acepta esta forma. Los rangos dentro de <code>match</code> se escriben <code>...</code> y son inclusivos por ambos extremos.</p>"
		}
		'moretypes/4':    PageText{
			title: 'Maps'
			body:  "<h2>Maps</h2>
<p>Un map guarda pares de clave y valor, y se escribe como literal:</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>El tipo de valor se infiere. Añadir una clave, y preguntar si existe:</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>Buscar una clave ausente da el <em>valor cero</em>, así una búsqueda donde ausencia y cero deban distinguirse usa <code>or</code>:</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>Iterar da la clave y el valor:</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>Los maps son tipos por referencia, así una asignación simple dejaría dos nombres para un map. <code>clone</code> es como se consigue uno independiente:</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p>Sin <code>clone</code> el compilador te dirá que un map no puede copiarse, y pedirá elegir entre <code>move</code>, <code>clone</code> o una referencia. Esa pregunta es el punto: compartir un map por accidente es fácil, así V te hace decir cuál querías.</p>"
		}
		'moretypes/5':    PageText{
			title: 'Strings'
			body:  "<h2>Strings</h2>
<p>Un string V es una secuencia de bytes, lo que tiene una consecuencia inmediata: indexar da un byte, y <code>.len</code> cuenta bytes.</p>
<pre><code>println(s[0])</code></pre>
<p>Exacto para ASCII y erróneo para todo lo demás, por eso existe <code>.runes()</code>. Recorre los caracteres en su lugar:</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>Los strings son inmutables, así cada método sobre uno devuelve un string nuevo:</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>Son métodos y no funciones en un módulo, así no hay nada que importar para ellos. Algunas operaciones viven en <code>strings</code>, notablemente el builder:</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>Usa un builder en vez de <code>+</code> repetidos cuando construyas un string largo en un bucle.</p>"
		}
		'moretypes/6':    PageText{
			title: 'Métodos'
			body:  "<h2>Métodos</h2>
<p>Un método es una función con <em>receptor</em>: el valor sobre el que se llama.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>El tipo del receptor va antes del nombre del método, y el método se llama como <code>p.sum()</code>.</p>
<p>Un receptor sin <code>&amp;</code> es una <em>copia</em>, así el método no puede cambiar el original. Para escribir a través de él, declara el receptor como referencia y hazlo <code>mut</code>:</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>Esa distinción es toda la historia de los métodos en V, y es la misma que con valores ordinarios: la asignación da un valor, y una referencia es algo que se pide por nombre.</p>
<p>Prefiere un receptor por valor salvo que el método deba modificarlo de verdad. Un método que solo lee no debería poder.</p>"
		}
		'moretypes/7':    PageText{
			title: 'Ejercicio: Conteo de Palabras'
			body:  "<h2>Ejercicio: Conteo de Palabras</h2>
<p>Implementa <code>word_count</code> para que cuente cuántas veces aparece cada palabra en un string.</p>
<p>Las palabras se separan por todo lo que no sea letra, y el conteo no debe depender de mayúsculas. Usa un <code>map[string]int</code>.</p>
<p>Cuando funcione, ordena la salida en vez del orden en que el map pasee.</p>
<p>Pulsa <b>Solution</b> cuando lo hayas intentado, o cuando estés atascado.</p>"
		}
		'moretypes/8':    PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/optionresult/1'>manejo de ausencia y fallos</a>.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>V distingue dos situaciones que muchos lenguajes mezclan, y da a cada una su tipo.</p>
<p>Un <code>?T</code> es un valor o <em>none</em>. Es para cuando no hay nada que devolver y nada salió mal: una búsqueda que no encontró nada, una exploración sin candidatos.</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>Una opción se desenvuelve con <code>or</code>, que da un valor para el caso none:</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>O con un <code>if</code>, que corre otra rama en su lugar:</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>La variable solo se liga en la rama donde hay valor. En la rama <code>else</code> la opción era <code>none</code>.</p>
<p>Las opciones se componen sin ceremonia. Una función que devuelve <code>?int</code> puede devolver directamente la opción de otra función:</p>
<pre><code>n := name?.len</code></pre>
<p>Ese <code>?</code> significa «si es none, devuelve none de esta función también». Es la diferencia entre propagar un valor e inventar un defecto, y por eso el cuerpo no necesita desenvolver nada.</p>
<p>Imprimir una opción muestra qué mitad tienes, así <code>Option(3)</code> y <code>Option(none)</code> se describen solos mientras averiguas qué salió mal.</p>"
		}
		'optionresult/2': PageText{
			title: 'Result y errores'
			body:  "<h2>Result y errores</h2>
<p>Una opción dice que no hay nada. Un <code>!T</code> dice que algo <em>falló</em>, y trae un mensaje de cómo.</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>Devolver un valor simple no necesita desenvolver; V lo envuelve. Devolver <code>error(...)</code> fabrica el fallo. Ese es todo el contrato.</p>
<p>El punto de llamada tiene la misma forma que una opción, y liga <code>err</code> en la rama <code>else</code>:</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code> da el mensaje solo, sin nada de lo que el tipo de error haya añadido alrededor. Ambas formas se usan en el ejemplo.</p>
<p>La propagación funciona igual que con opciones. Nota el <code>!</code> en cada llamada de <code>parse_pair</code>: cualquier mitad que falle hace fallar todo, y el mensaje viaja con él.</p>
<p>La biblioteca estándar sigue esta convención en todas partes, por eso <code>json2.decode</code> puede decir dónde falló tu JSON:</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>La regla para elegir entre ellos es corta. Si no se encontró nada, una opción. Si algo se intentó y no funcionó, un resultado. Y cuando una función deba pasar un fallo que no causó, propágalo con <code>?</code> o <code>!</code> en vez de aplanarlo en un defecto.</p>"
		}
		'optionresult/3': PageText{
			title: 'Ejercicio: Options'
			body:  "<h2>Ejercicio: Options</h2>
<p>Escribe cuatro funciones, cada una devolviendo una opción.</p>
<p><code>second_largest</code> devuelve el segundo mayor valor <em>distinto</em> en un slice, o none cuando no lo hay. Un mayor repetido no cuenta, así <code>[5, 5]</code> no tiene segundo mayor.</p>
<p><code>first_word</code> devuelve la primera palabra de un string, o none para uno vacío.</p>
<p><code>sum_all</code> toma un slice de opciones y devuelve un int, saltando las que son none.</p>
<p>Luego <code>describe_all</code>, que resume la entrada. Escríbela con propagación <code>?</code> para que no contenga ningún desenvuelto.</p>
<p>Pulsa <b>Solution</b> cuando lo hayas intentado, o cuando estés atascado.</p>"
		}
		'optionresult/4': PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/methods/1'>métodos e interfaces</a>.</p>"
		}
		'methods/1':      PageText{
			title: 'Interfaces'
			body:  "<h2>Interfaces</h2>
<p>V no tiene clases. Un struct con métodos lo es todo, y para la mayoría de programas basta.</p>
<p>Una <em>interfaz</em> es una lista de métodos. Un tipo la implementa simplemente teniéndolos: no hay palabra clave que escribir ni nada que declarar.</p>
<pre><code>interface Speaker {
	speak() string
}</code></pre>
<p>Una vez que <code>Dog</code> y <code>Cat</code> tienen un método <code>speak</code>, cualquiera puede pasarse donde se quiera un <code>Speaker</code>:</p>
<pre><code>fn announce(who Speaker) string {
	return who.speak()
}</code></pre>
<p>Como la implementación es implícita, una interfaz sigue funcionando cuando se añade un tipo después. Un tercer hablante no necesita cambios en <code>announce</code> ni en la interfaz.</p>
<p>Un slice de la interfaz suele ser lo que quieres en vez de un slice de un tipo concreto:</p>
<pre><code>mut crowd := []Speaker{}
crowd &lt;&lt; d
crowd &lt;&lt; c</code></pre>
<p>Dos reglas a guardar. Mantén las interfaces pequeñas: uno o dos métodos es señal de que la abstracción es real, donde cinco suele significar que copiaste un tipo concreto. Y declara la interfaz donde se <em>usa</em>, no junto a la implementación. V no exige ninguna, pero un lector buscará la interfaz en la función que la consume.</p>"
		}
		'methods/2':      PageText{
			title: 'Incrustación'
			body:  "<h2>Incrustación</h2>
<p>Un struct puede incrustar otro struct, escrito como un simple nombre de tipo:</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>Los campos del struct incrustado se vuelven campos del exterior, y sus métodos vienen con él. <code>u.id</code> y <code>u.name</code> son ambos simples campos de <code>User</code>, y <code>u.describe()</code> es el método venido de <code>Base</code>.</p>
<p>Así un campo común y un método común se escriben una vez. Incrustar una <em>interfaz</em> también funciona, y es como un tipo sustituye comportamiento por un campo.</p>
<p>Hay una regla que sorprende, y vale la pena aprenderla a las malas. Un struct incrustado hereda los miembros del tipo exterior, pero <em>no</em> gana acceso a los propios métodos del tipo exterior. Así un método en <code>Base</code> no puede llamar <code>area()</code> cuando <code>area()</code> pertenece al struct que lo incrusta.</p>
<p>Cuando necesites que una función trabaje sobre varios tipos, toma mejor la interfaz como parámetro:</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>Incrustar sirve para compartir estado y comportamiento entre un tipo y sus partes. Las interfaces sirven para escribir una vez sobre varios tipos sin relación. Responden preguntas distintas y vale mantenerlas aparte.</p>"
		}
		'methods/3':      PageText{
			title: 'Tipos imprimibles'
			body:  "<h2>Tipos imprimibles</h2>
<p>V imprime un valor con su método <code>str</code> en vez de reflejar sus campos, así un tipo controla cómo aparece definiendo uno:</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>Desde entonces <code>println(t)</code>, la interpolación y la concatenación lo usan:</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>Este es el método que más escribirás, y vale escribirlo pronto: un tipo que se imprime con sentido hace cada sesión de depuración posterior más fácil.</p>
<p>Eso solo afecta la impresión. Donde se espere un <code>string</code>, pasa uno explícito llamando <code>.str()</code>: un tipo con método <code>str</code> sigue siendo su propio tipo, y el compilador no lo convertirá por ti.</p>"
		}
		'methods/4':      PageText{
			title: 'Ejercicio: Formas'
			body:  "<h2>Ejercicio: Formas</h2>
<p>Cuatro cosas que escribir.</p>
<p>Dale a <code>Square</code> y <code>Triangle</code> un método <code>area</code>, y haz que <code>total_area</code> sume un slice de formas a través de la interfaz.</p>
<p>Luego escribe <code>describe(s Shape)</code>, que reporte el nombre y área de una forma sin saber cuál es.</p>
<p>La última parte trae una trampa, y encontrarla es casi todo el ejercicio. Te tentará poner <code>describe</code> en <code>Base</code> para que cada forma lo herede. Eso no funciona, y el compilador te dirá por qué.</p>
<p>Pulsa <b>Solution</b> cuando lo hayas intentado, o cuando estés atascado.</p>"
		}
		'methods/5':      PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/generics/1'>genéricos</a>.</p>"
		}
		'generics/1':     PageText{
			title: 'Funciones genéricas'
			body:  "<h2>Funciones genéricas</h2>
<p>Un parámetro de tipo sustituye un tipo, así una declaración puede servir a toda una familia. V lo escribe entre corchetes, y es la única pieza de sintaxis que vale memorizar:</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>Los ángulos <em>no</em> son la sintaxis aquí. Escrito como <code>fn max_of&lt;T&gt;(...)</code> es un error de parseo en vez de otra ortografía, y es lo primero a acertar.</p>
<p>Rara vez nombras el argumento de tipo. El compilador lo deduce de los argumentos, y lee una variable igual que un literal:</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>Un parámetro de tipo solo se necesita donde el compilador no puede deducirlo solo. En posición de retorno suele ser el punto:</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>Ese <code>?T</code> significa lo mismo que en la lección anterior: un valor o none, del tipo que sea esta instanciación.</p>
<p>Un callback se escribe como tipo de función, o sea <code>fn (T) R</code>. Eso independiza los tipos de entrada y salida, que es lo que deja a una función ser un pipeline:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>Una declaración, y una instanciación separada por cada tipo de argumento recibido. Sin boxing ni borrado: <code>apply</code> llamado con un callback <code>int</code> y con uno <code>string</code> son dos funciones distintas, por eso el tipo del callback debe escribirse en vez de adivinarse.</p>"
		}
		'generics/2':     PageText{
			title: 'Structs genéricos'
			body:  "<h2>Structs genéricos</h2>
<p>Un struct toma un parámetro de tipo igual que una función, y cada campo que lo menciona pertenece a la instanciación:</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>Así <code>Stack[int]</code> guarda un <code>[]int</code> y <code>Stack[string]</code> guarda un <code>[]string</code>, y son dos tipos distintos. Vale detenerse aquí, porque significa que no puedes poner una pila <code>int</code> y una <code>string</code> en un slice sin borrar el tipo en algún lado.</p>
<p>Los métodos también llevan el parámetro. <code>mut</code> en el receptor es lo que deja a un método cambiar el struct, y <code>&amp;</code> dice que solo lo lee:</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p>El <code>?T</code> es el tipo opción parametrizado igual, así sacar de una pila vacía da <code>none</code> en vez de un panic.</p>
<p>Dos parámetros es la misma idea dos veces, independientes entre sí:</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>Aquí está el límite que atrapa, y vale ser preciso, porque el mensaje de error no apunta al método que miras. <code>A</code> y <code>B</code> no tienen relación, así no hay conversión que ofrecer entre ellos, y un método no puede mover un valor de un campo al otro:</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>La razón es una propiedad de los métodos genéricos más que de los pares, y vale entenderla más que memorizarla. Un cuerpo de método genérico se verifica contra <em>cada</em> instanciación usada, así tiene que valer para todas a la vez. Por eso el método vale en <code>Pair[int, int]</code>, donde ambos campos guardan un tipo, y sigue rechazado en cuanto <code>Pair[string, int]</code> lo usa. El error nombra la instanciación culpable en vez de la declaración:</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>La regla a guardar es que un método genérico solo puede prometer algo cierto para cada tipo con que se instancie. Leer ambos campos siempre califica, por eso <code>describe</code> funciona para cada instanciación:</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: 'Maps de tipos genéricos'
			body:  "<h2>Maps de tipos genéricos</h2>
<p>Un tipo genérico puede ser el tipo de valor de un map, y el argumento de tipo se escribe en el punto de uso. El map es entonces un map ordinario de un tipo concreto:</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p><code>Stack</code> solo no basta aquí. El map debe saber de qué son pilas sus valores, y omitir el argumento es un error en vez de algo que el compilador infiera después.</p>
<p>Una consecuencia a saber: <code>map[string]Stack[int]</code> y <code>map[string]Stack[string]</code> son tipos distintos, así un programa que necesite ambos debe decirlo en vez de dejar que uno suplante al otro.</p>
<p>Los métodos genéricos están disponibles en los valores que el map entrega, que es lo que hace al map útil y no solo legal:</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>Nota el <code>_,</code> en el bucle de map. Nombrar la clave sería <code>for team, stack in teams</code>; el guion solo dice que la clave no se necesita. Debe ir solo: un guion seguido de nombre se rechaza, así <code>_k</code> no vale.</p>
<p>Los maps son tipos por referencia, que es lo que hace funcionar la escritura en dos pasos: <code>teams['red'].push(10)</code> encuentra la pila en el map y muta el mismo struct, en vez de copiarlo y perder el cambio.</p>"
		}
		'generics/4':     PageText{
			title: 'Varios parámetros de tipo'
			body:  "<h2>Varios parámetros de tipo</h2>
<p>Los parámetros de tipo se apilan. Dos en una función suelen ser el tipo de entrada y el de salida, que es lo que hace a una función genérica un mapeo:</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>Un parámetro de tipo no tiene que aparecer en el cuerpo. Suena a forma de escribir una función inútil, y suele ser exactamente correcto: el parámetro restringe la firma sin costar nada en el punto de llamada.</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>Nada en el cuerpo menciona <code>K</code>, así es la misma función para un map con claves strings y para uno con ints. El <code>?V</code> es deliberado: un map vacío no tiene primer valor, así la función devuelve none en vez de inventar uno.</p>
<p>La forma más común es una función genérica sobre un map, con un callback decidiendo qué hacer con cada valor:</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p><code>K</code> y <code>V</code> se infieren del map, y <code>R</code> queda fijo en <code>int</code> porque eso devuelve el callback. Donde la inferencia no tiene de qué trabajar, nombra los argumentos explícitamente: <code>first_map[string, int](m)</code>.</p>
<p>Algo que la inferencia no hará es salvar un argumento incompatible. Si pasas un <code>Counter[V]</code> donde se quiere un <code>map[K]Counter[V]</code>, el error nombra un <code>K</code> no inferible en vez del problema real, un primer encuentro confuso. Revisa el tipo del argumento antes de buscar un bug de genéricos.</p>"
		}
		'generics/5':     PageText{
			title: 'Ejercicio: Genéricos'
			body:  "<h2>Ejercicio: Genéricos</h2>
<p>Cuatro cosas que escribir, y entre ellas usan cada forma de esta lección.</p>
<p><code>index_of[T]</code> devuelve la posición de un valor en un slice, o -1. Funciona en cualquier tipo que soporte <code>==</code>.</p>
<p><code>count_matching[T]</code> cuenta cuántos items satisfacen un predicado. El predicado es un callback, así su tipo se escribe <code>fn (T) bool</code>.</p>
<p>Luego <code>Counter[K]</code>, un struct genérico guardando un conteo por clave. Dale <code>add</code> y <code>get</code>, y nota que <code>K</code> se usa dentro de otro tipo genérico aquí: un map cuya clave es el parámetro de tipo.</p>
<p>Por último <code>grand_total[K, V]</code>, que suma un map de contadores ponderado por un callback de la clave. Dos parámetros de tipo, y un struct genérico como tipo de valor del map.</p>
<p>Pulsa <b>Solution</b> cuando lo hayas intentado, o cuando estés atascado.</p>"
		}
		'generics/6':     PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección!</p>
<p>Puedes volver a la <a href='/list'>lista de módulos</a> para ver qué aprender después, o continúa con <a href='/concurrency/1'>concurrencia</a>.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p><code>spawn</code> arranca un thread y vuelve al instante. Devuelve un handle, y el handle es como se espera al thread después:</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> en sí no espera nada. Un programa que termina mientras un thread aún trabaja deja ese thread a medias, así la regla es que cada spawn se espera al final.</p>
<p>Para un conjunto fijo de tareas, junta los handles en un slice. El tipo de elemento es <code>thread</code>, y <code>wait()</code> en el slice los une a todos:</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>Cuando los workers devuelven algo, el slice es <code>[]thread int</code> y <code>wait()</code> entrega los resultados en orden:</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>El orden merece precisión. Los resultados vuelven en el orden en que se añadieron los handles, no en el que terminaron los threads, así es una forma de juntar respuestas y no de imponer orden al trabajo. Qué thread imprime primero no es algo de lo que un programa deba depender, y la salida intercalada del ejemplo es la versión honesta.</p>"
		}
		'concurrency/2':  PageText{
			title: 'Channels'
			body:  "<h2>Channels</h2>
<p>Un channel mueve valores de un tipo de un thread a otro. Créalo con el tipo de elemento y una capacidad, y envía y recibe con la misma flecha:</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>Ambas direcciones son <code>&lt;-</code>, porque ambas reciben del otro lado. No hay <code>ch.recv()</code> ni <code>ch.pop()</code>: el compilador los rechaza como funciones desconocidas. Si estás acostumbrado a un método aquí, eso es lo que hay que desaprender.</p>
<p><code>chan int{}</code> sin capacidad es <em>sin buffer</em>, o sea que el channel no guarda nada. Un envío no puede terminar hasta que un receptor esté ahí, y una recepción no puede terminar hasta que un emisor haya producido algo. Cada valor es un apretón de manos entre dos threads:</p>
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
<p>Lee la salida del ejemplo y el apretón se ve: envíos y recepciones se alternan, y no están en un orden fijo del que debas fiarte. Ese es el punto del channel sin buffer, no un defecto.</p>
<p>Un channel lleva exactamente un tipo, así esperar dos clases de mensaje distintas quiere decir dos channels. <code>select</code>, más adelante, es como se espera en más de uno a la vez.</p>"
		}
		'concurrency/3':  PageText{
			title: 'Channels con buffer'
			body:  "<h2>Channels con buffer</h2>
<p>Una capacidad da sitio al channel, así un emisor puede adelantarse en vez de bloquear en cada valor:</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>La diferencia es medible. Con buffer, todos los envíos se completan y <code>len()</code> dice cuántos valores esperan. Sin él, <code>len()</code> se queda en cero por mucho que esperes, porque no hay dónde ponerlos:</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>Elige el buffer cuando un productor no deba quedar retenido por un consumidor lento. La capacidad se fija al crear el channel, y un channel con buffer y uno sin buffer del mismo tipo de elemento son tipos distintos.</p>
<p>Aquí hay una trampa que vale el medio minuto de recordarla. El campo que fija el tamaño es <code>cap:</code>, y escribir <code>len:</code> en su lugar se rechaza en vez de ignorarse en silencio:</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>El mensaje nombra el campo querido, que es lo mejor posible. La otra trampa no es de ortografía. El buffer solo ayuda hasta la capacidad: un emisor con más que enviar que sitio bloquea en el primer valor que no cabe. Así con cuatro huecos y seis trabajos, y sin consumidor arrancado, el quinto envío espera un consumidor que no corre. O buferiza toda la lista o arranca antes los consumidores.</p>"
		}
		'concurrency/4':  PageText{
			title: 'Recibir hasta el cierre'
			body:  "<h2>Recibir hasta el cierre</h2>
<p><strong>No hay <code>for x in ch</code> en V.</strong> Un channel no es una colección, así el bucle for no tiene nada que indexar, y el compilador dice:</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>Si vienes de un lenguaje donde un channel puede recorrerse, esto es lo primero que harás mal. Recibe con <code>&lt;-ch</code>, y para leer un channel hasta el final, recibe hasta que deje de dar:</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p>El <code>or</code> aporta el valor que termina el bucle, y esta es la parte fácil de errar en la otra dirección: <strong><code>or</code> solo se dispara cuando el channel está cerrado y vacío.</strong> En un channel abierto sin nada dentro, <code>&lt;-ch or { -1 }</code> sigue bloqueando, esperando un emisor. No es una consulta no bloqueante, lo parezca o no.</p>
<p>Un detalle de los envíos que te costará una tarde si nadie lo menciona. La expresión de envío se detiene en la flecha, así un valor calculado a la derecha necesita paréntesis:</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>Sin ellos el compilador intenta multiplicar el void que <code>ch &lt;- i</code> produjo, y lo dice de forma que no apunta a la flecha.</p>
<p>Cuando el productor te dijo la cuenta, el bucle sobra:</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>Esa forma simple tiene un filo. Un <code>&lt;-ch</code> simple en un channel cerrado y vacío no bloquea ni entra en panic: entrega el <em>valor cero</em> del tipo de elemento, siempre. Pide un valor de más y obtienes un <code>0</code> silencioso, un string vacío o un struct cero en vez de un error:</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>Prefiere <code>or</code> cuando la cuenta no sea segura, y usa <code>try_pop</code> cuando quieras mirar sin esperar:</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: 'Cierre'
			body:  "<h2>Cierre</h2>
<p>Cierra un channel cuando su productor termine con él, y ciérralo desde el productor. El productor posee el channel igual que posee la decisión de parar:</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>Un detalle que atrapa: <code>close</code> solo no es como se cierra un channel. Escrito como llamada simple es el builtin que cierra un descriptor de fichero, y falla en un channel con un mensaje confuso:</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>Cerrar no tira lo que aún está en buffer. Los valores del channel se entregan primero al lector, en orden, y solo una vez vacío una recepción no encuentra nada. Ese orden es lo que hace de close la señal que debe ser.</p>
<p>Lo que close no hace es legalizar un envío. Enviar en un channel cerrado es un panic en ejecución, y cerrar dos veces también, así la regla es un cierre por channel desde el único sitio que lo posee.</p>
<p>Y close no es una espera. Recibir de un channel abierto y vacío sigue bloqueando, lo cierre alguien alguna vez o no.</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  "<h2>Select</h2>
<p><code>select</code> espera en varios channels y corre el cuerpo del que esté listo. Es como tomar la primera respuesta en vez de un orden fijo:</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>Una rama es una recepción o un envío, así ambas direcciones pueden competir:</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>Dos restricciones a saber antes de escribir uno, ambas medidas contra el compilador más que documentadas.</p>
<p><strong>Mantén las dos formas en selects separados.</strong> Un select con rama de envío <em>y</em> de recepción cuelga el compilador en vez de reportar un error, así empareja un envío con un timeout o con otro envío.</p>
<p><strong>Una rama debe nombrar un channel que ya exista.</strong> Escribir el channel en línea se rechaza:</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>Y las ramas asignan en vez de devolver, así la variable en que escriben debe ser <code>mut</code>. Una duración en posición de rama es un timeout, y solo uno por select. Así una espera deja de ser ilimitada:</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> es la rama para cuando nada está listo, y no espera. Es la forma no bloqueante:</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>Como expresión un select se evalúa a <strong>bool</strong>: true cuando corrió una rama de channel, false cuando lo hizo <code>else</code>. No se evalúa al valor de la rama, así lee el valor en la rama y prueba el bool aparte.</p>
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
<p>Una asimetría a prever. Una vez cerrado un channel, recibir de él está siempre listo, así un channel cerrado gana el select cada ronda. En un bucle sobre varios channels, vacía los que importen y verifica tú el cierre en vez de confiar en select para pasarlo.</p>"
		}
		'concurrency/7':  PageText{
			title: 'Estado compartido'
			body:  "<h2>Estado compartido</h2>
<p>Los channels mueven valores. Cuando varios threads deben cambiar el <em>mismo</em> valor, ese es trabajo de un lock.</p>
<p>Lo no obvio es cómo se comparte el estado. Un struct pasado a un thread por valor es una copia, y cada thread tendría la suya. La palabra clave <code>shared</code> en el parámetro es lo que lo hace uno solo:</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>Nota <code>shared t</code> en la lista de parámetros y <code>spawn add(shared total, i)</code> en el punto de llamada. Ambas necesarias. Pásalo sin la palabra y el thread obtiene una copia, así el contador nunca se mueve.</p>
<p><code>lock</code> es un bloque, no una llamada, y la llave de cierre lo libera. No hay sentencia <code>unlock</code> que emparejar, y escribir una es un error de sintaxis. Mantenlo lo mínimo posible: ni a través de un spawn, ni de un envío, ni alrededor del trabajo real. Un lock sostenido sobre algo que puede bloquear es como un programa se cuelga.</p>
<p><code>rlock</code> es la versión de lectura, y es para una estructura leída mucho más que escrita:</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p>Una variable <code>shared</code> también debe bloquearse en el punto de uso, así el compilador no dejará olvidar el lock por accidente.</p>
<p>Hay algo a vigilar, y es la razón por la que el ejemplo lee un valor antes de esperar sus threads. Spawn no espera, así leer estado compartido justo tras un spawn es una carrera: el valor visto depende de lo avanzados que vayan los threads. Espera los escritores antes de leer, o acepta que el número es provisional.</p>"
		}
		'concurrency/8':  PageText{
			title: 'Grupos de espera'
			body:  "<h2>Grupos de espera</h2>
<p>Un grupo de espera cuenta trabajo en curso. <code>add</code> antes del spawn, <code>done</code> dentro, y <code>wait</code> cuando hayas arrancado todo:</p>
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
<p>Toma el grupo como <code>&amp;sync.WaitGroup</code> y no <code>mut &amp;sync.WaitGroup</code>. La referencia <code>mut</code> compila y luego cae dentro del contador atómico en ejecución, así la referencia simple es la forma a usar.</p>
<p><code>wg.go</code> empaqueta el add y el arranque del thread, lo que quita el paso donde ambos se separan:</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>Toma un closure en vez de una llamada, y un closure en V debe nombrar lo que lee. La lista <code>fn [ch, i] ()</code> es esa declaración, y omitir una variable es un error de compilación que nombra la variable en vez de nada de concurrencia.</p>
<p>Tres reglas, y son casi todo lo que sale mal. Cada <code>add</code> necesita su <code>done</code>, y un <code>done</code> sin <code>add</code> entra en panic. Cada spawn debe pasar antes del <code>wait</code>, porque eso es todo lo que el wait ve. Y un thread que entra en panic se lleva todo el proceso consigo, así una función spawneada necesita su propio <code>defer</code> si puede fallar a medias.</p>"
		}
		'concurrency/9':  PageText{
			title: 'Ejercicio: Un pool de workers'
			body:  "<h2>Ejercicio: Un pool de workers</h2>
<p>Construye un pool de workers y aliméntalo de tareas.</p>
<p><code>worker</code> toma una tarea de un channel, la dobla, y envía el resultado a otro channel. Recibe un grupo de espera para que el pool sepa cuándo terminó.</p>
<p><code>run_all</code> toma un slice de tareas y un número de workers, y devuelve los resultados en el orden en que llegaron.</p>
<p>El orden de operaciones es todo el ejercicio, y cuatro cosas deben ser ciertas a la vez:</p>
<ul>
<li>El channel de tareas se cierra <em>antes</em> de que arranquen los workers, o un worker puede quedar esperando un cierre que nunca venía.</li>
<li>Cada <code>add</code> pasa antes del <code>wait</code>, y cada <code>done</code> dentro del worker.</li>
<li>Ambos channels tienen buffer, para que un worker nunca bloquee devolviendo un valor.</li>
<li>Los resultados se recogen con <code>&lt;-results or { break }</code>, ya que no hay <code>for</code> sobre un channel.</li>
</ul>
<p>Dos de ellos son el deadlock que este ejercicio suele destapar: un channel de tareas con menos sitio que la lista de tareas, o resultados leídos antes del <code>wait</code>.</p>
<p>Pulsa <b>Solution</b> cuando lo hayas intentado, o cuando estés atascado.</p>"
		}
		'concurrency/10': PageText{
			title: '¡Felicidades!'
			body:  "<p>¡Has terminado esta lección, y con ella todo el tour!</p>
<p>Vuelve a la <a href='/list'>lista de módulos</a> para releer lo que quieras, o empieza de nuevo en <a href='/welcome/1'>primeros pasos</a>.</p>"
		}
		'cli/1':          PageText{
			title: 'Comandos cotidianos'
			body:  "<h2>Comandos cotidianos</h2>
<p>Tres comandos corren con casi cada cambio. <code>v fmt -w .</code> formatea el proyecto, <code>v vet .</code> reporta construcciones sospechosas y <code>v test .</code> corre la suite de tests:</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>Formatea antes de cada commit, para que la revisión nunca discuta formato.</p>
<p><code>v doc strings</code> muestra la documentación de un módulo, <code>v repl</code> abre un prompt interactivo y <code>v watch run main.v</code> reconstruye y re-ejecuta cuando cambia un fuente.</p>"
		}
		'vpm/1':          PageText{
			title: 'Paquetes'
			body:  "<h2>Paquetes</h2>
<p>Las bibliotecas viven en el registro de paquetes. Búscalo, inspecciona un resultado e instálalo:</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p><code>v list</code> muestra de qué depende el proyecto. <code>v outdated</code> reporta versiones nuevas, <code>v update</code> las trae y <code>v remove</code> quita una.</p>
<p>Estos comandos tocan la red, así corren en tu máquina y no en el sandbox de este tour.</p>"
		}
		'mcp/1':          PageText{
			title: 'El protocolo de contexto del modelo'
			body:  "<h2>v mcp</h2>
<p><code>v mcp serve</code> expone el compilador mismo a un agente de código: declaraciones, referencias y diagnósticos por entrada y salida estándar:</p>
<pre><code>v mcp serve</code></pre>
<p><code>v mcp tools</code> lista lo expuesto. Sirve por HTTP con <code>--http</code>, resuelve rutas relativas contra un directorio con <code>--root</code>, y no registra herramientas de escritura con <code>--read-only</code>.</p>
<p><code>v mcp install</code> conecta el servidor a un agente, y <code>v mcp uninstall</code> lo quita. Esta superficie es nueva, así necesita un V reciente en vez del release que corre este sandbox.</p>"
		}
		'skills/1':       PageText{
			title: 'Habilidades'
			body:  "<h2>Habilidades</h2>
<p>Las skills son instrucciones empaquetadas que un agente carga para una tarea: las reglas del lenguaje, el ciclo de tests, la superficie de herramientas:</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>Las skills se instalan en <code>.agents/skills/</code> en el proyecto, o bajo tu home con <code>--global</code>. <code>v skills path v-tools</code> muestra dónde vive una, y <code>--dry-run</code> reporta sin escribir nada.</p>
<p>Como <code>v mcp</code>, es superficie nueva: necesita un V reciente.</p>"
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
