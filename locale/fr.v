module locale

// Français (French) translation.

pub const fr = Text{
	modules: {
		'mechanics':    'Utiliser le tour'
		'basics':       'Types de base'
		'controlflow':  'Flux de contrôle'
		'moretypes':    'Plus de types'
		'optionresult': 'Option et Result'
		'methods':      'Méthodes et interfaces'
		'generics':     'Génériques'
		'concurrency':  'Concurrence'
	}
	lessons: {
		'welcome':      'Premiers pas'
		'basics':       'Types de base'
		'controlflow':  'Flux de contrôle'
		'moretypes':    'Plus de types'
		'optionresult': 'Option et Result'
		'methods':      'Méthodes et interfaces'
		'generics':     'Génériques'
		'concurrency':  'Concurrence'
	}
	pages:   {
		'welcome/1':      PageText{
			title: 'Bonjour, le monde'
			body:  "<p>Bienvenue dans un tour du <a href='https://vlang.io'>langage de programmation V</a>.</p>
<p>Le tour est divisé en modules. Vous pouvez les atteindre depuis la <a href='/list'>table des matières</a> ou avec le bouton de menu dans le coin supérieur droit.</p>
<p>Tout au long du tour, vous trouverez des diapositives et des exercices. Naviguez avec les liens <b>précédent</b> et <b>suivant</b> sous le texte, ou avec les touches <code>PageUp</code> et <code>PageDown</code>.</p>
<p>Le tour est interactif. Appuyez sur <b>Exécuter</b> (ou <code>Shift</code>+<code>Enter</code>) pour compiler et exécuter le programme. Le résultat apparaît sous le code.</p>
<p>Ces programmes sont des points de départ pour vos propres expérimentations. Modifiez le programme et exécutez-le à nouveau.</p>"
		}
		'welcome/2':      PageText{
			title: 'Utiliser ce tour'
			body:  '<p>Chaque page a une colonne de texte à gauche et une colonne de code à droite. Entre elles se trouve une poignée de redimensionnement : faites-la glisser pour donner plus de place au code.</p>
<p>L&rsquo;éditeur conserve vos modifications. Si vous modifiez un programme, passez à une autre diapositive et revenez, votre version est toujours là. <b>Réinitialiser</b> remet l&rsquo;original.</p>'
		}
		'welcome/3':      PageText{
			title: 'V hors ligne (optionnel)'
			body:  "<p>Vous n'avez pas besoin d'une installation locale de V pour utiliser ce tour, mais c'est recommandé.</p>
<p>Pour installer V, suivez les instructions sur <a href='https://vlang.io/install.html'>vlang.io/install</a>. Sur Windows, macOS et Linux, l'installateur est une seule commande.</p>
<p>Avec V installé, n'importe quelle page de ce tour peut être téléchargée et exécutée localement. Copiez le programme dans un fichier nommé <code>main.v</code> et exécutez :</p>
<pre><code>v run main.v</code></pre>"
		}
		'welcome/4':      PageText{
			title: 'Le sandbox'
			body:  '<p>Vos programmes s&rsquo;exécutent dans un sandbox sur le serveur. Chaque exécution obtient un répertoire frais et vide, et est coupée du reste de la machine.</p>
<p>Le programme est d&rsquo;abord compilé. S&rsquo;il ne compile pas, rien n&rsquo;est exécuté et le message du compilateur est affiché, avec la ligne concernée marquée dans l&rsquo;éditeur. Corrigez-la et réexécutez.</p>'
		}
		'welcome/5':      PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé le premier module du tour !</p>
<p>Revenez à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuez directement avec <a href='/basics/1'>les bases du langage</a>.</p>"
		}
		'basics/1':       PageText{
			title: 'Modules'
			body:  '<h2>Modules</h2>
<p>Chaque fichier V déclare le <em>module</em> auquel il appartient. La déclaration est la première chose du fichier.</p>
<p>Un programme démarre dans le module appelé <code>main</code>, dans une fonction appelée <code>main</code>.</p>'
		}
		'basics/2':       PageText{
			title: 'Imports'
			body:  '<h2>Imports</h2>
<p>Un module importé apporte ses noms exportés dans le fichier courant.</p>
<p>La bibliothèque standard est importée par nom de module : <code>import math</code>, <code>import strings</code>. Les bibliothèques tierces sont importées de la même manière.</p>'
		}
		'basics/3':       PageText{
			title: 'Variables'
			body:  '<h2>Variables</h2>
<p>Exécutez le code. Remarquez le message d&rsquo;erreur.</p>
<p>Les variables V sont déclarées avec <code>:=</code>. Contrairement à la plupart des langages, une variable en V est <em>immutable par défaut</em>, et vous devez demander la mutabilité explicitement.</p>'
		}
		'basics/4':       PageText{
			title: 'Variables mutables'
			body:  '<h2>Variables mutables</h2>
<p>Pour déclarer une variable mutable, ajoutez le mot-clé <code>mut</code> avant le nom.</p>'
		}
		'basics/5':       PageText{
			title: 'Déclarations courtes'
			body:  '<h2>Déclarations courtes</h2>
<p><code>:=</code> déclare une variable et détermine son type à partir de la valeur.</p>'
		}
		'basics/6':       PageText{
			title: 'Fonctions'
			body:  '<h2>Fonctions</h2>
<p>Les fonctions sont déclarées avec <code>fn</code>.</p>'
		}
		'basics/7':       PageText{
			title: 'Résultats multiples'
			body:  '<h2>Résultats multiples</h2>
<p>Une fonction peut retourner plus d&rsquo;une valeur. Écrivez le type de retour comme un tuple :</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>'
		}
		'basics/8':       PageText{
			title: 'Types de base'
			body:  '<h2>Types de base</h2>
<p>Les valeurs booléennes sont <code>true</code> et <code>false</code>.</p>'
		}
		'basics/9':       PageText{
			title: 'Valeurs zéro'
			body:  '<h2>Valeurs zéro</h2>
<p>Chaque type a une <em>valeur zéro</em>, qui est ce qu&rsquo;une variable contient avant que quoi que ce soit ne lui soit assigné.</p>'
		}
		'basics/10':      PageText{
			title: 'Constantes'
			body:  '<h2>Constantes</h2>
<p>Une <code>const</code> est une valeur que le compilateur connaît pendant qu&rsquo;il construit votre programme, donc elle doit être une expression constante.</p>'
		}
		'basics/11':      PageText{
			title: 'Conversions de type'
			body:  '<h2>Conversions de type</h2>
<p>V ne convertit jamais un type implicitement. Le passage de l&rsquo;un à l&rsquo;autre est toujours écrit :</p>
<pre><code>fl := f64(i)</code></pre>'
		}
		'basics/12':      PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/controlflow/1'>le flux de contrôle</a>.</p>"
		}
		'basics/13':      PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/controlflow/1'>le flux de contrôle</a>.</p>"
		}
		'controlflow/1':  PageText{
			title: 'For'
			body:  '<h2>For</h2>
<p>V a un seul mot-clé de boucle, et il existe sous trois formes.</p>'
		}
		'controlflow/2':  PageText{
			title: 'For est le "while" de V'
			body:  '<h2>For est le "while" de V</h2>
<p>Un <code>for</code> avec une seule condition continue jusqu&rsquo;à ce que cette condition soit fausse.</p>'
		}
		'controlflow/3':  PageText{
			title: 'For suite'
			body:  '<h2>For suite</h2>
<p>Itérer sur une collection utilise <code>in</code> plutôt qu&rsquo;un index.</p>'
		}
		'controlflow/4':  PageText{
			title: 'If'
			body:  '<h2>If</h2>
<p>Un <code>if</code> s&rsquo;écrit comme ceci :</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>'
		}
		'controlflow/5':  PageText{
			title: 'If avec valeur déballée'
			body:  "<h2>If avec valeur déballée</h2>
<p>Une fonction V peut renvoyer une valeur <em>ou</em> une erreur. Le type de retour s’écrit avec un <code>!</code> devant :</p>
<pre><code>fn parse(s string) !int</code></pre>
<p>Dans le corps, <code>return</code> une valeur simple et V l’enveloppe pour vous. Pour échouer, renvoyez <code>error(...)</code> à la place.</p>
<p>À l’appel, un <code>if</code> peut déballer le résultat. La valeur reçue est liée à <code>v</code>, et en cas d’erreur la branche <code>else</code> s’exécute avec l’erreur liée à <code>err</code> :</p>
<pre><code>if v := parse(s) { } else { }</code></pre>
<p>Exécutez deux fois. Le premier appel réussit et pas le second, et chacun prend la branche attendue.</p>
<p>C’est ainsi que la plupart du code V gère ce qui peut mal tourner. Le <a href='/optionresult/1'>module suivant</a> le couvre proprement.</p>"
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  '<h2>Match</h2>
<p>V n&rsquo;a pas de mot-clé <code>switch</code>. Il a <code>match</code>, qui couvre plus de cas qu&rsquo;un switch habituellement.</p>'
		}
		'controlflow/7':  PageText{
			title: 'Match et types sommes'
			body:  "<h2>Match et types sommes</h2>
<p>Un <em>type somme</em> se déclare avec <code>=</code> et une liste d’alternatives :</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>
<p>Une valeur de ce type est exactement l’une des alternatives, jamais plus d’une.</p>
<p>La filtrer dit laquelle. Dans une branche, la variable d’origine est <em>transtypée intelligemment</em> vers cette variante, donc ses champs sont directement disponibles sans aucun transtypage.</p>
<p>Chaque alternative a besoin d’une branche, ou le match a besoin d’un <code>else</code>. Le compilateur l’impose, donc une nouvelle alternative ne peut pas être silencieusement ignorée.</p>
<p>Ajoutez une quatrième forme au type somme et exécutez. Le compilateur vous dira exactement quels <code>match</code> vous avez manqués.</p>"
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>
<p><code>defer</code> planifie une instruction pour s&rsquo;exécuter quand le bloc environnant se termine.</p>'
		}
		'controlflow/9':  PageText{
			title: 'Exercice : Boucles et fonctions'
			body:  "<h2>Exercice : Boucles et fonctions</h2>
<p>Écrivez <code>sum_to</code> pour qu’elle renvoie la somme des nombres de <code>0</code> à <code>n</code>, et <code>sum_squares</code> pour la somme de leurs carrés.</p>
<p>Faites-le deux fois : une fois au plus direct, et une fois avec une boucle <code>for</code> explicite.</p>
<p>Puis réécrivez les deux pour tourner en temps <em>O(1)</em>.</p>
<p>Appuyez sur <b>Solution</b> quand vous avez essayé, ou quand vous êtes bloqué.</p>"
		}
		'controlflow/10': PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Revenez à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuez avec <a href='/moretypes/1'>plus de types</a>.</p>"
		}
		'moretypes/1':    PageText{
			title: 'Structs'
			body:  "<h2>Structs</h2>
<p>Un <em>struct</em> regroupe des valeurs sous un nom. C'est la façon de V de dire : &ldquo;ceux-ci vont ensemble&rdquo;.</p>"
		}
		'moretypes/2':    PageText{
			title: 'Arrays'
			body:  "<h2>Arrays</h2>
<p>Un array a une longueur fixe, et son type d’élément vient de son premier élément :</p>
<pre><code>numbers := [3, 4, 5]</code></pre>
<p>Un array peut aussi être fabriqué avec une longueur et une valeur initiale :</p>
<pre><code>zeros := []int{len: 4, init: 0}</code></pre>
<p>Les arrays s’indexent avec <code>[]</code> et portent leur longueur :</p>
<pre><code>println(numbers.len)</code></pre>
<p>Quand deux valeurs ne doivent pas partager leur contenu, demandez explicitement une copie avec <code>clone</code> :</p>
<pre><code>mut copy := numbers.clone()</code></pre>
<p>À utiliser chaque fois que vous passez une collection à quelque chose qui ne doit pas pouvoir la modifier, parce que cela se dit au point d’usage plutôt qu’en s’appuyant sur une règle à retenir.</p>
<p>Les transformations usuelles sont des méthodes plutôt que des fonctions libres :</p>
<pre><code>numbers.map(it * 2)
numbers.filter(it &gt; 1)</code></pre>
<p><code>it</code> désigne l’élément courant.</p>"
		}
		'moretypes/3':    PageText{
			title: 'Slices'
			body:  "<h2>Slices</h2>
<p>Une slice est une vue sur une plage d’un array ou d’une autre slice, écrite avec la même syntaxe <code>[]</code> :</p>
<pre><code>part := arr[1..3]</code></pre>
<p>Les slices peuvent aussi être construites à partir de rien et grandir. Grandir peut déplacer les données, donc la variable doit être <code>mut</code> :</p>
<pre><code>mut words := []string{}
words &lt;&lt; 'hello'</code></pre>
<p><code>&lt;&lt;</code> ajoute. Cela marche sur n’importe quelle slice, et sur un array de taille fixe c’est une erreur de compilation plutôt qu’une surprise à l’exécution.</p>
<p>Trancher une autre slice en donne une slice. Comme avec les arrays, <code>clone</code> quand vous avez besoin d’une copie indépendante :</p>
<pre><code>mut first := words[..1].clone()</code></pre>
<p>Notez que les plages sont <em>exclusives</em> : <code>0 .. n</code> tourne <code>n</code> fois, et une boucle <code>for</code> n’accepte que cette forme. Les plages dans <code>match</code> s’écrivent <code>...</code> et sont inclusives des deux côtés.</p>"
		}
		'moretypes/4':    PageText{
			title: 'Maps'
			body:  "<h2>Maps</h2>
<p>Une map tient des paires de clés et de valeurs, et s’écrit comme un littéral :</p>
<pre><code>ages := {
	'Ada': 36
	'Alan': 41
}</code></pre>
<p>Le type de valeur est inféré. Ajouter une clé, et demander si elle est présente :</p>
<pre><code>ages['Edsger'] = 39
if 'Edsger' in ages { }</code></pre>
<p>Chercher une clé absente donne la <em>valeur zéro</em>, donc une recherche où absence et zéro doivent se distinguer utilise <code>or</code> :</p>
<pre><code>existing := ages['Alan'] or { -1 }</code></pre>
<p>Itérer donne la clé et la valeur :</p>
<pre><code>for name, age in ages {
	println('&dollar;{name} is &dollar;{age}')
}</code></pre>
<p>Les maps sont des types par référence, donc une affectation simple laisserait deux noms pour une map. <code>clone</code> est la façon d’en obtenir une indépendante :</p>
<pre><code>mut backup := ages.clone()</code></pre>
<p>Sans <code>clone</code> le compilateur vous dira qu’une map ne peut pas être copiée, et vous demandera de choisir entre <code>move</code>, <code>clone</code> ou une référence. Cette question est le point : partager une map par accident est facile, donc V vous fait dire ce que vous vouliez.</p>"
		}
		'moretypes/5':    PageText{
			title: 'Strings'
			body:  "<h2>Strings</h2>
<p>Une string V est une séquence d’octets, ce qui a une conséquence immédiate : l’indexation donne un octet, et <code>.len</code> compte les octets.</p>
<pre><code>println(s[0])</code></pre>
<p>C’est tout à fait juste pour l’ASCII et faux pour tout le reste, c’est pourquoi <code>.runes()</code> existe. Elle parcourt les caractères à la place :</p>
<pre><code>for r in s.runes() { }</code></pre>
<p>Les strings sont immuables, donc chaque méthode sur l’une renvoie une nouvelle string :</p>
<pre><code>s.to_lower()
s.replace('World', 'V')
s.split(', ')
s.contains('World')</code></pre>
<p>Ce sont des méthodes plutôt que des fonctions dans un module, donc rien à importer pour elles. Certaines opérations vivent dans <code>strings</code>, notamment le builder :</p>
<pre><code>import strings

mut sb := strings.new_builder(64)
sb.write_string('hello')
println(sb.str())</code></pre>
<p>Utilisez un builder plutôt que des <code>+</code> répétés quand vous construisez une longue string dans une boucle.</p>"
		}
		'moretypes/6':    PageText{
			title: 'Méthodes'
			body:  "<h2>Méthodes</h2>
<p>Une méthode est une fonction avec un <em>receveur</em> : la valeur sur laquelle elle est appelée.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>
<p>Le type du receveur vient avant le nom de la méthode, et la méthode est ensuite appelée comme <code>p.sum()</code>.</p>
<p>Un receveur sans <code>&amp;</code> est une <em>copie</em>, donc la méthode ne peut pas changer l’original. Pour écrire à travers, déclarez le receveur comme une référence et rendez-le <code>mut</code> :</p>
<pre><code>fn (mut p Point) shift(dx int, dy int) {
	p.x += dx
}</code></pre>
<p>Cette distinction est toute l’histoire des méthodes en V, et c’est la même distinction que pour les valeurs ordinaires : l’affectation donne une valeur, et une référence est quelque chose que l’on demande par son nom.</p>
<p>Préférez un receveur par valeur sauf si la méthode doit vraiment modifier le receveur. Une méthode qui ne fait que lire ne devrait pas le pouvoir.</p>"
		}
		'moretypes/7':    PageText{
			title: 'Exercice : Comptage de mots'
			body:  "<h2>Exercice : Comptage de mots</h2>
<p>Implémentez <code>word_count</code> pour qu’il compte combien de fois chaque mot apparaît dans une string.</p>
<p>Les mots sont séparés par tout ce qui n’est pas une lettre, et le compte ne doit pas dépendre de la casse. Utilisez une <code>map[string]int</code>.</p>
<p>Une fois que cela marche, rendez la sortie ordonnée plutôt que l’ordre dans lequel la map se trouve marcher.</p>
<p>Appuyez sur <b>Solution</b> quand vous avez essayé, ou quand vous êtes bloqué.</p>"
		}
		'moretypes/8':    PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/optionresult/1'>la gestion de l'absence et des erreurs</a>.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  "<h2>Option</h2>
<p>V distingue deux situations que beaucoup de langages confondent, et donne à chacune son type.</p>
<p>Un <code>?T</code> est une valeur ou <em>none</em>. C’est pour le cas où il n’y a rien à renvoyer et rien ne s’est mal passé : une recherche qui n’a rien trouvé, une exploration à court de candidats.</p>
<pre><code>fn find_user(id int) ?string {
	if id == 1 { return 'Ada' }
	return none
}</code></pre>
<p>Une option se déballe avec <code>or</code>, qui fournit une valeur pour le cas none :</p>
<pre><code>name := find_user(9) or { 'nobody' }</code></pre>
<p>Ou avec un <code>if</code>, qui exécute une autre branche à la place :</p>
<pre><code>if name := find_user(2) {
	println('found &dollar;{name}')
} else {
	println('not found')
}</code></pre>
<p>La variable n’est liée que dans la branche où il y a une valeur. Dans la branche <code>else</code> l’option était <code>none</code>.</p>
<p>Les options se composent sans cérémonie. Une fonction renvoyant <code>?int</code> peut renvoyer directement l’option d’une autre fonction :</p>
<pre><code>n := name?.len</code></pre>
<p>Ce <code>?</code> signifie « si c’est none, renvoyez none de cette fonction aussi ». C’est la différence entre propager une valeur et inventer un défaut, et c’est pourquoi le corps ci-dessus n’a besoin d’aucun déballage.</p>
<p>Afficher une option montre quelle moitié vous avez, donc <code>Option(3)</code> et <code>Option(none)</code> se décrivent seuls pendant que vous comprenez ce qui n’allait pas.</p>"
		}
		'optionresult/2': PageText{
			title: 'Result et erreurs'
			body:  "<h2>Result et erreurs</h2>
<p>Une option dit qu’il n’y a rien. Un <code>!T</code> dit que quelque chose a <em>échoué</em>, et porte un message sur comment.</p>
<pre><code>fn parse_int(s string) !int {
	n := s.int()
	if n == 0 &amp;&amp; s != '0' {
		return error('&quot;&dollar;{s}&quot; is not a number')
	}
	return n
}</code></pre>
<p>Renvoyer une valeur simple n’a besoin d’aucun déballage ; V l’enveloppe. Renvoyer <code>error(...)</code> fabrique l’échec. C’est tout le contrat.</p>
<p>Le site d’appel a la même forme qu’une option, et lie <code>err</code> dans la branche <code>else</code> :</p>
<pre><code>if n := parse_int(s) {
	return 'ok'
} else {
	return 'failed: &dollar;{err}'
}</code></pre>
<p><code>err.msg()</code> donne le message seul, sans rien de ce que le type d’erreur a pu ajouter autour. Les deux formes sont utilisées dans l’exemple.</p>
<p>La propagation marche comme pour les options. Notez le <code>!</code> sur chaque appel dans <code>parse_pair</code> : chaque moitié qui échoue fait échouer le tout, et le message voyage avec.</p>
<p>La bibliothèque standard suit cette convention partout, c’est pourquoi <code>json2.decode</code> peut dire où votre JSON s’est trompé :</p>
<pre><code>if doc := json2.decode[Doc](text, json2.DecoderOptions{}) {
	println(doc.name)
} else {
	println('bad json: &dollar;{err.msg()}')
}</code></pre>
<p>Donc la règle pour choisir entre eux est courte. Si rien n’a été trouvé, une option. Si quelque chose a été tenté et n’a pas marché, un résultat. Et quand une fonction doit transmettre un échec qu’elle n’a pas causé, propagez-le avec <code>?</code> ou <code>!</code> plutôt que de l’aplatir en défaut.</p>"
		}
		'optionresult/3': PageText{
			title: 'Exercice : Options'
			body:  "<h2>Exercice : Options</h2>
<p>Écrivez quatre fonctions, chacune renvoyant une option.</p>
<p><code>second_largest</code> renvoie la deuxième plus grande valeur <em>distincte</em> d’une slice, ou none quand il n’y en a pas. Un plus grand répété ne compte pas, donc <code>[5, 5]</code> n’a pas de deuxième plus grand.</p>
<p><code>first_word</code> renvoie le premier mot d’une string, ou none pour une vide.</p>
<p><code>sum_all</code> prend une slice d’options et renvoie un int, en sautant celles qui sont none.</p>
<p>Puis <code>describe_all</code>, qui résume l’entrée. Écrivez-la avec propagation <code>?</code> pour qu’elle ne contienne aucun déballage.</p>
<p>Appuyez sur <b>Solution</b> quand vous avez essayé, ou quand vous êtes bloqué.</p>"
		}
		'optionresult/4': PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/methods/1'>les méthodes et interfaces</a>.</p>"
		}
		'methods/1':      PageText{
			title: 'Interfaces'
			body:  '<h2>Interfaces</h2>
<p>V n&rsquo;a pas de classes. Un struct avec des méthodes est tout, et pour la plupart des programmes c&rsquo;est tout ce dont vous avez besoin.</p>'
		}
		'methods/2':      PageText{
			title: 'Embarquement'
			body:  "<h2>Embarquement</h2>
<p>Une struct peut embarquer une autre struct, écrit comme un simple nom de type :</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>
<p>Les champs de la struct embarquée deviennent des champs de l’extérieure, et ses méthodes viennent avec. <code>u.id</code> et <code>u.name</code> sont tous deux simplement des champs de <code>User</code>, et <code>u.describe()</code> est la méthode venue de <code>Base</code>.</p>
<p>C’est ainsi qu’un champ commun et une méthode commune s’écrivent une fois. Embarquer une <em>interface</em> marche aussi, et c’est ainsi qu’un type substitue un comportement à un champ.</p>
<p>Il y a une règle qui surprend, et elle vaut la peine d’être apprise à la dure. Une struct embarquée hérite des membres du type extérieur, mais elle ne gagne <em>pas</em> l’accès aux propres méthodes du type extérieur. Donc une méthode sur <code>Base</code> ne peut pas appeler <code>area()</code> quand <code>area()</code> appartient à la struct qui l’embarque.</p>
<p>Quand vous avez besoin qu’une fonction marche sur plusieurs types, prenez plutôt l’interface en paramètre :</p>
<pre><code>fn describe(s Shape) string {
	return s.name()
}</code></pre>
<p>L’embarquement sert à partager état et comportement entre un type et ses parties. Les interfaces servent à écrire une fois pour plusieurs types sans rapport. Elles répondent à des questions différentes et valent la peine d’être gardées à part.</p>"
		}
		'methods/3':      PageText{
			title: 'Types affichables'
			body:  "<h2>Types affichables</h2>
<p>V affiche une valeur avec sa méthode <code>str</code> plutôt qu’en reflétant ses champs, donc un type contrôle comment il apparaît en en définissant une :</p>
<pre><code>fn (t Temperature) str() string {
	return '&#36;{t.celsius:.1f}C'
}</code></pre>
<p>Dès lors <code>println(t)</code>, l’interpolation de string et la concaténation l’utilisent :</p>
<pre><code>println(Temperature{ celsius: 21.456 })   // 21.5C
println('it is &#36;{t}')</code></pre>
<p>C’est la méthode que vous écrirez le plus souvent, et elle vaut la peine d’être écrite tôt : un type qui s’affiche sensiblement rend chaque session de débogage ultérieure plus facile.</p>
<p>Cela ne concerne que l’affichage. Partout ailleurs où une <code>string</code> est attendue, passez-en une explicitement en appelant <code>.str()</code> : un type avec une méthode <code>str</code> reste son propre type, et le compilateur ne le convertira pas pour vous.</p>"
		}
		'methods/4':      PageText{
			title: 'Exercice : Formes'
			body:  "<h2>Exercice : Formes</h2>
<p>Quatre choses à écrire.</p>
<p>Donnez à <code>Square</code> et <code>Triangle</code> une méthode <code>area</code>, et faites que <code>total_area</code> additionne une slice de formes à travers l’interface.</p>
<p>Puis écrivez <code>describe(s Shape)</code>, qui rapporte le nom et l’aire d’une forme sans savoir ce qu’elle est.</p>
<p>La dernière partie contient un piège, et le trouver est l’essentiel de l’exercice. Vous serez tenté de mettre <code>describe</code> sur <code>Base</code> pour que chaque forme en hérite. Cela ne marche pas, et le compilateur vous dira pourquoi.</p>
<p>Appuyez sur <b>Solution</b> quand vous avez essayé, ou quand vous êtes bloqué.</p>"
		}
		'methods/5':      PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/generics/1'>les génériques</a>.</p>"
		}
		'generics/1':     PageText{
			title: 'Fonctions génériques'
			body:  "<h2>Fonctions génériques</h2>
<p>Un paramètre de type remplace un type, donc une déclaration peut servir toute une famille d’entre eux. V l’écrit entre crochets, et c’est le seul morceau de syntaxe qui vaut la peine d’être mémorisé :</p>
<pre><code>fn max_of[T](a T, b T) T {
	return if a &gt; b { a } else { b }
}</code></pre>
<p>Les chevrons ne sont <em>pas</em> la syntaxe ici. Écrit comme <code>fn max_of&lt;T&gt;(...)</code> c’est une erreur d’analyse plutôt qu’une orthographe différente, et c’est la première chose à bien faire.</p>
<p>Vous nommez rarement l’argument de type. Le compilateur le déduit des arguments, et il lit une variable aussi bien qu’un littéral :</p>
<pre><code>println(max_of(3, 7))            // T is int
println(max_of('apple', 'pear')) // T is string

n := 42
println(max_of(n, 7))</code></pre>
<p>Un paramètre de type n’est nécessaire que là où le compilateur ne peut pas le déduire seul. En position de retour c’est souvent le point :</p>
<pre><code>fn first_item[T](items []T) ?T {
	if items.len == 0 {
		return none
	}
	return items[0]
}</code></pre>
<p>Ce <code>?T</code> signifie exactement ce qu’il faisait dans la leçon précédente : une valeur ou none, de quelque type que soit cette instanciation.</p>
<p>Un callback s’écrit comme un type de fonction, donc <code>fn (T) R</code>. Cela rend les types d’entrée et de sortie indépendants, ce qui permet à une fonction d’être un pipeline :</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R {
	mut out := []R{cap: items.len}
	for item in items {
		out &lt;&lt; f(item)
	}
	return out
}

println(apply([1, 2, 3, 4], fn (n int) int { return n * n }))
println(apply(nums, fn (n int) string { return 'n is &dollar;{n}' }))</code></pre>
<p>Une déclaration, et une instanciation séparée pour chaque type d’argument reçu. Pas de boxing ni d’effacement : <code>apply</code> appelé avec un callback <code>int</code> et avec un callback <code>string</code> sont deux fonctions différentes, c’est pourquoi le type du callback doit être écrit plutôt que deviné.</p>"
		}
		'generics/2':     PageText{
			title: 'Structs génériques'
			body:  "<h2>Structs génériques</h2>
<p>Une struct prend un paramètre de type comme une fonction, et chaque champ qui le mentionne appartient à l’instanciation :</p>
<pre><code>struct Stack[T] {
mut:
	items []T
}</code></pre>
<p>Donc <code>Stack[int]</code> tient un <code>[]int</code> et <code>Stack[string]</code> tient un <code>[]string</code>, et ce sont deux types différents. Cela vaut la peine de s’y arrêter, parce que cela veut dire que vous ne pouvez pas mettre une pile <code>int</code> et une pile <code>string</code> dans une slice sans effacer le type quelque part.</p>
<p>Les méthodes portent aussi le paramètre. <code>mut</code> sur le receveur est ce qui permet à une méthode de changer la struct, et <code>&amp;</code> dit qu’elle ne fait que la lire :</p>
<pre><code>fn (mut s Stack[T]) push(item T) {
	s.items &lt;&lt; item
}

fn (s &amp;Stack[T]) peek() ?T {
	return s.items.last()
}</code></pre>
<p>Le <code>?T</code> est le type option paramétré de la même façon, donc dépiler une pile vide donne <code>none</code> plutôt qu’un panic.</p>
<p>Deux paramètres c’est deux fois la même idée, et ils sont indépendants l’un de l’autre :</p>
<pre><code>struct Pair[A, B] {
mut:
	first  A
	second B
}</code></pre>
<p>Voici la limite qui attrape les gens, et elle vaut la peine d’être précise, parce que le message d’erreur ne pointe pas la méthode que vous regardez. <code>A</code> et <code>B</code> n’ont aucune relation, donc il n’y a pas de conversion à offrir entre eux, et une méthode ne peut pas déplacer une valeur d’un champ à l’autre :</p>
<pre><code>fn (mut p Pair[A, B]) swap() {
	p.first = p.second
}</code></pre>
<p>La raison est une propriété des méthodes génériques plutôt que des paires, et elle vaut la peine d’être comprise plutôt que mémorisée. Un corps de méthode générique est vérifié contre <em>chaque</em> instanciation utilisée, donc il doit être valide pour toutes à la fois. C’est pourquoi la méthode va bien sur <code>Pair[int, int]</code>, où les deux champs tiennent un type, et reste refusée dès que <code>Pair[string, int]</code> l’utilise. L’erreur nomme l’instanciation fautive plutôt que la déclaration :</p>
<pre><code>cannot assign to `p.first`: expected `string`, not `int`</code></pre>
<p>Donc la règle à garder est qu’une méthode générique ne peut promettre que quelque chose de vrai pour chaque type avec lequel elle sera instanciée. Lire les deux champs qualifie toujours, c’est pourquoi <code>describe</code> marche pour chaque instanciation :</p>
<pre><code>fn (p &amp;Pair[A, B]) describe() string {
	return &quot;(&dollar;{p.first}, &dollar;{p.second})&quot;
}</code></pre>"
		}
		'generics/3':     PageText{
			title: 'Maps de types génériques'
			body:  "<h2>Maps de types génériques</h2>
<p>Un type générique peut être le type de valeur d’une map, et l’argument de type s’épelle au point d’usage. La map est alors une map ordinaire d’un type concret :</p>
<pre><code>mut teams := map[string]Stack[int]{}
teams['red'] = Stack[int]{}
teams['red'].push(10)

println(teams['red'].items())</code></pre>
<p><code>Stack</code> nu ne suffit pas ici. La map doit savoir de quoi ses valeurs sont des piles, et omettre l’argument est une erreur plutôt que quelque chose que le compilateur infère plus tard.</p>
<p>Une conséquence à connaître : <code>map[string]Stack[int]</code> et <code>map[string]Stack[string]</code> sont des types différents, donc un programme qui a besoin des deux doit le dire plutôt que laisser l’un remplacer l’autre.</p>
<p>Les méthodes génériques sont disponibles sur les valeurs que la map distribue, ce qui rend la map utile plutôt que simplement légale :</p>
<pre><code>for _, stack in teams {
	for score in stack.items() {
		total += score
	}
}</code></pre>
<p>Notez le <code>_,</code> dans la boucle de map. Nommer la clé serait <code>for team, stack in teams</code> ; le tiret bas seul dit que la clé n’est pas nécessaire. Il doit être seul : un tiret suivi d’un nom est refusé, donc <code>_k</code> ne marchera pas.</p>
<p>Les maps sont des types par référence, ce qui fait marcher l’écriture en deux temps : <code>teams['red'].push(10)</code> trouve la pile dans la map et mute la même struct, plutôt que la copier et perdre le changement.</p>"
		}
		'generics/4':     PageText{
			title: 'Plusieurs paramètres de type'
			body:  "<h2>Plusieurs paramètres de type</h2>
<p>Les paramètres de type s’empilent. Deux sur une fonction sont d’habitude le type d’entrée et le type de sortie, ce qui fait d’une fonction générique une projection :</p>
<pre><code>fn apply[T, R](items []T, f fn (T) R) []R { ... }</code></pre>
<p>Un paramètre de type n’a pas à apparaître dans le corps. Cela ressemble à une façon d’écrire une fonction inutile, et c’est souvent exactement juste : le paramètre contraint la signature sans rien coûter au site d’appel.</p>
<pre><code>fn first_map[K, V](m map[K]V) ?V {
	for _k, v in m {
		return v
	}
	return none
}</code></pre>
<p>Rien dans le corps ne mentionne <code>K</code>, donc c’est la même fonction pour une map à clés strings et pour une à clés ints. Le <code>?V</code> est délibéré : une map vide n’a pas de première valeur, donc la fonction renvoie none plutôt que d’en inventer une.</p>
<p>La forme qui revient le plus est une fonction générique sur une map, avec un callback qui décide quoi faire de chaque valeur :</p>
<pre><code>fn total_of[K, V](m map[K]V, value_of fn (V) int) int {
	mut sum := 0
	for _k, v in m {
		sum += value_of(v)
	}
	return sum
}

println(total_of({ 'ada': 36, 'alan': 41 }, fn (n int) int { return n }))</code></pre>
<p><code>K</code> et <code>V</code> sont tous deux inférés de la map, et <code>R</code> est fixé à <code>int</code> parce que c’est ce que le callback renvoie. Là où l’inférence n’a rien pour travailler, nommez explicitement les arguments : <code>first_map[string, int](m)</code>.</p>
<p>Une chose que l’inférence ne fera pas, c’est sauver un argument incompatible. Si vous passez un <code>Counter[V]</code> où une <code>map[K]Counter[V]</code> est voulue, l’erreur nomme un <code>K</code> non inférable plutôt que le vrai problème, ce qui est une première rencontre déroutante. Vérifiez le type de l’argument avant d’aller chercher un bug de génériques.</p>"
		}
		'generics/5':     PageText{
			title: 'Exercice : Génériques'
			body:  "<h2>Exercice : Génériques</h2>
<p>Quatre choses à écrire, et entre elles elles utilisent chaque forme de cette leçon.</p>
<p><code>index_of[T]</code> renvoie la position d’une valeur dans une slice, ou -1. Cela marche sur tout type qui supporte <code>==</code>.</p>
<p><code>count_matching[T]</code> compte combien d’items satisfont un prédicat. Le prédicat est un callback, donc son type s’écrit <code>fn (T) bool</code>.</p>
<p>Puis <code>Counter[K]</code>, une struct générique tenant un compte par clé. Donnez-lui <code>add</code> et <code>get</code>, et remarquez que <code>K</code> est utilisé dans un autre type générique ici : une map dont la clé est le paramètre de type.</p>
<p>Enfin <code>grand_total[K, V]</code>, qui additionne une map de compteurs pondérés par un callback de la clé. Deux paramètres de type, et une struct générique comme type de valeur de la map.</p>
<p>Appuyez sur <b>Solution</b> quand vous avez essayé, ou quand vous êtes bloqué.</p>"
		}
		'generics/6':     PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/concurrency/1'>la concurrence</a>.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  "<h2>Spawn</h2>
<p><code>spawn</code> démarre un thread et revient aussitôt. Il rend un handle, et le handle est la façon d’attendre le thread plus tard :</p>
<pre><code>fn slow_square(n int) int {
	time.sleep(100 * time.millisecond)
	return n * n
}

handle := spawn slow_square(7)
println(handle.wait())</code></pre>
<p><code>spawn</code> lui-même n’attend rien. Un programme qui se termine pendant qu’un thread travaille encore laisse ce thread en plein milieu, donc la règle est que chaque spawn est finalement attendu.</p>
<p>Pour un ensemble fixe de tâches, collectez les handles dans une slice. Le type d’élément est <code>thread</code>, et <code>wait()</code> sur la slice les joint tous :</p>
<pre><code>mut threads := []thread{}
for _ in 0 .. 3 {
	threads &lt;&lt; spawn noop()
}
for t in threads {
	t.wait()
}</code></pre>
<p>Quand les workers renvoient quelque chose, la slice est <code>[]thread int</code> et <code>wait()</code> rend les résultats dans l’ordre :</p>
<pre><code>mut threads := []thread int{}
for i in 1 .. 5 {
	threads &lt;&lt; spawn slow_square(i)
}
results := threads.wait()</code></pre>
<p>L’ordre vaut la peine d’être précis. Les résultats reviennent dans l’ordre où les handles ont été ajoutés, pas dans l’ordre où les threads ont fini, donc c’est une façon de collecter des réponses et pas une façon d’imposer un ordre au travail. Quel thread affiche en premier n’est pas quelque chose dont un programme devrait dépendre, et la sortie entrelacée dans l’exemple en est la version honnête.</p>"
		}
		'concurrency/2':  PageText{
			title: 'Channels'
			body:  "<h2>Channels</h2>
<p>Un channel déplace des valeurs d’un type d’un thread à un autre. Créez-le avec le type d’élément et une capacité, et envoyez et recevez avec la même flèche :</p>
<pre><code>ch := chan int{}

ch &lt;- 42       // send: blocks until a receiver takes it
v := &lt;-ch      // receive: blocks until there is a value</code></pre>
<p>Les deux directions sont <code>&lt;-</code>, parce que les deux reçoivent de l’autre côté. Il n’y a pas de <code>ch.recv()</code> ni de <code>ch.pop()</code> : le compilateur les rejette comme fonctions inconnues. Si vous avez l’habitude d’une méthode ici, c’est la chose à désapprendre.</p>
<p><code>chan int{}</code> sans capacité est <em>non bufferisé</em>, ce qui veut dire que le channel ne tient rien du tout. Un envoi ne peut pas finir tant qu’un receveur n’est pas là, et une réception ne peut pas finir tant qu’un envoyeur n’a rien produit. Chaque valeur est une poignée de main entre deux threads :</p>
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
<p>Lisez la sortie de l’exemple et la poignée de main est visible : les envois et les réceptions alternent, et ils ne sont pas dans un ordre fixe auquel vous devriez vous fier. C’est le point du channel non bufferisé, pas un défaut.</p>
<p>Un channel porte exactement un type, donc attendre deux sortes de messages différentes veut dire deux channels. <code>select</code>, plus loin, est la façon d’attendre sur plus d’un à la fois.</p>"
		}
		'concurrency/3':  PageText{
			title: 'Channels bufferisés'
			body:  "<h2>Channels bufferisés</h2>
<p>Une capacité donne de la place au channel, donc un envoyeur peut prendre de l’avance au lieu de bloquer à chaque valeur :</p>
<pre><code>buffered := chan int{cap: 4}</code></pre>
<p>Cette différence est mesurable. Avec un buffer, tous les envois se terminent et <code>len()</code> dit combien de valeurs attendent. Sans, <code>len()</code> reste à zéro aussi longtemps qu’on attend, parce qu’il n’y a nulle part où les mettre :</p>
<pre><code>unbuffered := chan int{}
spawn slow_sender(unbuffered)
println(unbuffered.len) // 0, and stays 0

buffered := chan int{cap: 4}
spawn slow_sender(buffered)
println(buffered.len)  // 3, once the sends have finished</code></pre>
<p>Choisissez le buffer quand un producteur ne devrait pas être retenu par un consommateur lent. La capacité est fixée quand le channel est créé, et un channel bufferisé et un non bufferisé du même type d’élément sont des types différents.</p>
<p>Voici un piège qui vaut la demi-minute qu’il faut pour s’en souvenir. Le champ qui règle la taille est <code>cap:</code>, et écrire <code>len:</code> à la place est refusé plutôt qu’ignoré silencieusement :</p>
<pre><code>chan int{len: 4}
// `len` cannot be initialized for `chan`. Did you mean `cap`?</code></pre>
<p>Le message nomme le champ voulu, ce qui est à peu près le mieux possible. L’autre piège n’est pas d’orthographe. Bufferiser n’aide que jusqu’à la capacité : un envoyeur avec plus à envoyer qu’il n’y a de place bloque sur la première valeur qui ne rentre pas. Donc avec quatre places et six tâches, et aucun consommateur démarré, le cinquième envoi attend un consommateur qui ne tourne pas. Soit bufferisez toute la liste, soit démarrez d’abord les consommateurs.</p>"
		}
		'concurrency/4':  PageText{
			title: 'Recevoir jusqu&rsquo;à la fermeture'
			body:  "<h2>Recevoir jusqu&rsquo;à la fermeture</h2>
<p><strong>Il n’y a pas de <code>for x in ch</code> en V.</strong> Un channel n’est pas une collection, donc la boucle for n’a rien à indexer, et le compilateur dit :</p>
<pre><code>for in: cannot index `chan int`</code></pre>
<p>Si vous arrivez d’un langage où un channel peut être parcouru, c’est la chose que vous ferez mal en premier. Recevez avec <code>&lt;-ch</code>, et pour lire un channel jusqu’au bout, recevez jusqu’à ce qu’il cesse de donner :</p>
<pre><code>mut squares := []int{}
for {
	v := &lt;-ch or { break }
	squares &lt;&lt; v
}</code></pre>
<p>Le <code>or</code> fournit la valeur qui termine la boucle, et c’est la partie facile à rater dans l’autre sens : <strong><code>or</code> ne se déclenche que quand le channel est fermé et vide.</strong> Sur un channel ouvert sans rien dedans, <code>&lt;-ch or { -1 }</code> bloque toujours, en attendant un envoyeur. Ce n’est pas un sondage non bloquant, quoi que cela ressemble.</p>
<p>Un détail sur les envois qui vous coûtera un après-midi si personne ne le mentionne. L’expression d’envoi s’arrête à la flèche, donc une valeur calculée à droite a besoin de parenthèses :</p>
<pre><code>ch &lt;- i * i     // error: mismatched types `void` and `int literal`
ch &lt;- (i * i)   // sends the product</code></pre>
<p>Sans elles le compilateur essaie de multiplier le void que <code>ch &lt;- i</code> a produit, et le dit d’une façon qui ne pointe pas évidemment la flèche.</p>
<p>Quand le producteur vous a dit le compte, la boucle est inutile :</p>
<pre><code>for _ in 0 .. 4 {
	total += &lt;-ch
}</code></pre>
<p>Cette forme plus simple a un bord tranchant. Un <code>&lt;-ch</code> simple sur un channel fermé et vide ne bloque pas et ne panique pas : il rend la <em>valeur zéro</em> pour le type d’élément, à chaque fois. Demandez une valeur de trop et vous obtenez un <code>0</code> silencieux, une string vide ou une struct zéro au lieu d’une erreur :</p>
<pre><code>ch := chan int{cap: 1}
ch.close()
println(&lt;-ch)          // 0
println(&lt;-ch or { -1 }) // -1, a value you chose</code></pre>
<p>Donc préférez <code>or</code> quand le compte n’est pas certain, et prenez <code>try_pop</code> quand vous voulez regarder sans attendre du tout :</p>
<pre><code>mut v := 0
println(ch.try_pop(mut v)) // .success, .not_ready or .closed</code></pre>"
		}
		'concurrency/5':  PageText{
			title: 'Fermeture'
			body:  "<h2>Fermeture</h2>
<p>Fermez un channel quand son producteur en a fini avec lui, et fermez-le depuis le producteur. Le producteur possède le channel comme il possède la décision d’arrêter :</p>
<pre><code>fn produce(ch chan string, n int) {
	for i in 0 .. n {
		ch &lt;- 'value &dollar;{i + 1}'
	}
	ch.close()
}</code></pre>
<p>Un détail qui attrape les gens : <code>close</code> seul n’est pas comme ça qu’on ferme un channel. Écrit comme un appel nu c’est le builtin qui ferme un descripteur de fichier, et il échoue sur un channel avec un message confus :</p>
<pre><code>close(ch)  // cannot use `chan int` as `i32` in argument 1 to `close`
ch.close()  // this is the one</code></pre>
<p>Fermer ne jette pas ce qui est encore bufferisé. Les valeurs dans le channel sont d’abord remises au lecteur, dans l’ordre, et ce n’est qu’une fois vide qu’une réception ne trouve rien. Cet ordre est ce qui fait de close le signal qu’il est censé être.</p>
<p>Ce que close ne fait pas, c’est rendre un envoi légal. Envoyer sur un channel fermé est un panic à l’exécution, et fermer deux fois aussi, donc la règle est une fermeture par channel depuis le seul endroit qui le possède.</p>
<p>Et close n’est pas une attente. Recevoir d’un channel ouvert et vide bloque toujours, que quelqu’un le ferme un jour ou non.</p>"
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  "<h2>Select</h2>
<p><code>select</code> attend sur plusieurs channels et exécute le corps de celui qui est prêt. C’est comment prendre la première réponse plutôt qu’un ordre fixe :</p>
<pre><code>select {
	v := &lt;-fast {
		winner = v
	}
	v := &lt;-slow {
		winner = v
	}
}</code></pre>
<p>Une branche est une réception ou un envoi, donc les deux directions peuvent concourir :</p>
<pre><code>select {
	out &lt;- 5 {
		// the channel had room
	}
	50 * time.millisecond {
		// it stayed full
	}
}</code></pre>
<p>Deux contraintes à connaître avant d’en écrire un, toutes deux mesurées contre le compilateur plutôt que documentées.</p>
<p><strong>Gardez les deux formes dans des selects séparés.</strong> Un select tenant une branche d’envoi <em>et</em> une branche de réception plante le compilateur net au lieu de rapporter une erreur, donc appariez un envoi avec un timeout ou avec un autre envoi.</p>
<p><strong>Une branche doit nommer un channel qui existe déjà.</strong> Écrire le channel en ligne est refusé :</p>
<pre><code>never := &lt;-chan int{} {}      // channel in `select` key must be predefined
never := chan int{}            // declare it first
select {
	v := &lt;-never {
		// ...
	}
}</code></pre>
<p>Et les branches assignent plutôt que renvoyer, donc la variable dans laquelle elles écrivent doit être <code>mut</code>. Une durée en position de branche est un timeout, et un seul par select. C’est ainsi qu’une attente cesse d’être sans borne :</p>
<pre><code>select {
	v := &lt;-quiet {
		println('got &dollar;{v}')
	}
	100 * time.millisecond {
		println('gave up')
	}
}</code></pre>
<p><code>else</code> est la branche pour quand rien n’est prêt, et elle n’attend pas. C’est la forme non bloquante :</p>
<pre><code>select {
	v := &lt;-empty {
		taken = 'got &dollar;{v}'
	}
	else {
		taken = 'nothing was ready'
	}
}</code></pre>
<p>Comme expression un select s’évalue en <strong>bool</strong> : true quand une branche channel a tourné, false quand <code>else</code> l’a fait. Il ne s’évalue pas en la valeur de la branche, donc lisez la valeur dans la branche et testez le bool séparément.</p>
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
<p>Une asymétrie à prévoir. Une fois qu’un channel est fermé, en recevoir est en permanence prêt, donc un channel fermé gagne le select à chaque tour. Dans une boucle sur plusieurs channels, videz ceux qui vous importent et vérifiez vous-même la fermeture plutôt que compter sur select pour la dépasser.</p>"
		}
		'concurrency/7':  PageText{
			title: 'État partagé'
			body:  "<h2>État partagé</h2>
<p>Les channels déplacent des valeurs. Quand des threads doivent changer la <em>même</em> valeur, c’est le travail d’un lock.</p>
<p>La partie qui n’est pas évidente est comment l’état devient partagé. Une struct passée à un thread par valeur est une copie, et chaque thread aurait la sienne. Le mot-clé <code>shared</code> sur le paramètre est ce qui en fait une seule :</p>
<pre><code>struct Total {
mut:
	n int
}

fn add(shared t Total, by int) {
	lock t {
		t.n += by
	}
}</code></pre>
<p>Notez <code>shared t</code> dans la liste de paramètres et <code>spawn add(shared total, i)</code> au site d’appel. Les deux sont nécessaires. Passez-le sans le mot-clé et le thread obtient une copie, donc le compteur ne bouge jamais.</p>
<p><code>lock</code> est un bloc, pas un appel, et l’accolade fermante le libère. Il n’y a pas d’instruction <code>unlock</code> à apparier avec, et en écrire une est une erreur de syntaxe. Tenez-le le moins possible : pas à travers un spawn, pas à travers un envoi de channel, et pas autour du vrai travail. Un lock tenu à travers quelque chose qui peut bloquer est comment un programme se dead lock.</p>
<p><code>rlock</code> est la version lecture, et c’est pour une structure lue bien plus souvent qu’écrite :</p>
<pre><code>fn read(shared t Total) int {
	rlock t {
		return t.n
	}
}</code></pre>
<p>Une variable <code>shared</code> doit aussi être verrouillée au point d’usage, donc le compilateur ne laissera pas le lock être oublié par accident.</p>
<p>Il y a une chose à surveiller, et c’est la raison pour laquelle l’exemple lit une valeur avant d’attendre ses threads. Spawn n’attend pas, donc lire un état partagé juste après un spawn est une course : la valeur vue dépend d’où en sont les threads. Attendez les écrivains avant de lire, ou acceptez que le nombre est provisoire.</p>"
		}
		'concurrency/8':  PageText{
			title: 'Groupes d&rsquo;attente'
			body:  "<h2>Groupes d&rsquo;attente</h2>
<p>Un groupe d’attente compte le travail en cours. <code>add</code> avant le spawn, <code>done</code> dedans, et <code>wait</code> quand vous avez tout démarré :</p>
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
<p>Prenez le groupe comme <code>&amp;sync.WaitGroup</code> et pas <code>mut &amp;sync.WaitGroup</code>. La référence <code>mut</code> compile puis plante dans le compteur atomique à l’exécution, donc la référence simple est la forme à utiliser.</p>
<p><code>wg.go</code> emballe l’add et le démarrage du thread, ce qui supprime l’étape où les deux dérivent :</p>
<pre><code>mut wg := sync.new_waitgroup()
for i in 1 .. 4 {
	wg.go(fn [ch, i] () {
		ch &lt;- i
	})
}
wg.wait()</code></pre>
<p>Cela prend une fermeture plutôt qu’un appel, et une fermeture en V doit nommer ce qu’elle lit. La liste <code>fn [ch, i] ()</code> est cette déclaration, et omettre une variable est une erreur de compilation nommant la variable plutôt que quoi que ce soit sur la concurrence.</p>
<p>Trois règles, et elles sont l’essentiel de ce qui va mal. Chaque <code>add</code> a besoin d’un <code>done</code> assorti, et un <code>done</code> sans <code>add</code> panique. Chaque spawn doit arriver avant le <code>wait</code>, parce que c’est tout ce que le wait voit. Et un thread qui panique emporte tout le processus avec lui, donc une fonction spawnée a besoin de son propre <code>defer</code> si elle peut échouer à mi-chemin.</p>"
		}
		'concurrency/9':  PageText{
			title: 'Exercice : Un pool de workers'
			body:  "<h2>Exercice : Un pool de workers</h2>
<p>Construisez un pool de workers et nourrissez-le de tâches.</p>
<p><code>worker</code> prend une tâche d’un channel, la double, et envoie le résultat à un autre channel. On lui passe un groupe d’attente pour que le pool sache quand il a fini.</p>
<p><code>run_all</code> prend une slice de tâches et un nombre de workers, et renvoie les résultats dans l’ordre où ils sont arrivés.</p>
<p>L’ordre des opérations est tout l’exercice, et quatre choses doivent être vraies à la fois :</p>
<ul>
<li>Le channel de tâches est fermé <em>avant</em> que les workers démarrent, ou un worker peut rester à attendre une fermeture qui ne venait pas.</li>
<li>Chaque <code>add</code> arrive avant le <code>wait</code>, et chaque <code>done</code> dans le worker.</li>
<li>Les deux channels sont bufferisés, pour qu’un worker ne bloque jamais en rendant une valeur.</li>
<li>Les résultats sont collectés avec <code>&lt;-results or { break }</code>, puisqu’il n’y a pas de <code>for</code> sur un channel.</li>
</ul>
<p>Deux d’entre eux sont le deadlock que cet exercice fait d’habitude apparaître : un channel de tâches avec moins de place que la liste de tâches, ou des résultats lus avant le <code>wait</code>.</p>
<p>Appuyez sur <b>Solution</b> quand vous avez essayé, ou quand vous êtes bloqué.</p>"
		}
		'concurrency/10': PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon, et avec elle tout le tour.</p>
<p>Tout ce qui précède vit dans le langage plutôt que dans une bibliothèque, ce qui vaut la peine d'être rappelé : un thread, un channel et un lock sont des déclarations V ordinaires que vous pouvez lire dans le même fichier que le code qu'elles servent.</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour relire quoi que ce soit, ou recommencer à <a href='/welcome/1'>premiers pas</a>.</p>"
		}
		'cli/1':          PageText{
			title: 'Commandes courantes'
			body:  "<h2>Commandes courantes</h2>
<p>Trois commandes tournent à presque chaque changement. <code>v fmt -w .</code> formate le projet sur place, <code>v vet .</code> signale les constructions suspectes et <code>v test .</code> lance la suite de tests :</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>Formatez avant chaque commit, pour que la review ne discute jamais de mise en page.</p>
<p><code>v doc strings</code> montre la documentation d’un module, <code>v repl</code> ouvre une invite interactive et <code>v watch run main.v</code> reconstruit et relance dès qu’un fichier source change.</p>"
		}
		'vpm/1':          PageText{
			title: 'Paquets'
			body:  "<h2>Paquets</h2>
<p>Les bibliothèques vivent dans le registre de paquets. Cherchez-y, inspectez un résultat et installez-le :</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p><code>v list</code> montre ce dont le projet dépend. <code>v outdated</code> signale les versions plus récentes, <code>v update</code> les récupère et <code>v remove</code> en enlève une.</p>
<p>Ces commandes touchent le réseau, donc elles tournent sur votre machine plutôt que dans le sandbox de ce tour.</p>"
		}
		'mcp/1':          PageText{
			title: 'Le protocole de contexte du modèle'
			body:  "<h2>v mcp</h2>
<p><code>v mcp serve</code> expose le compilateur lui-même à un agent de code : déclarations, références et diagnostics sur l’entrée et la sortie standard :</p>
<pre><code>v mcp serve</code></pre>
<p><code>v mcp tools</code> liste ce qui est exposé. Servez plutôt sur HTTP avec <code>--http</code>, résolvez les chemins relatifs contre un répertoire avec <code>--root</code>, et n’enregistrez aucun outil d’écriture de fichiers avec <code>--read-only</code>.</p>
<p><code>v mcp install</code> branche le serveur à un agent, et <code>v mcp uninstall</code> l’enlève. Cette surface est nouvelle, donc elle a besoin d’un V récent plutôt que de la release qu’exécute ce sandbox.</p>"
		}
		'skills/1':       PageText{
			title: 'Compétences'
			body:  "<h2>Compétences</h2>
<p>Les skills sont des instructions empaquetées qu’un agent charge pour une tâche : les règles du langage, la boucle de test, la surface des outils :</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>Les skills s’installent dans <code>.agents/skills/</code> dans le projet, ou sous votre home avec <code>--global</code>. <code>v skills path v-tools</code> montre où vit l’une, et <code>--dry-run</code> rapporte sans rien écrire.</p>
<p>Comme <code>v mcp</code>, c’est une surface nouvelle : elle a besoin d’un V récent.</p>"
		}
	}
	ui:      {
		'site_title':       'Un tour de V'
		'toc':              'Table des matières'
		'toggle_theme':     'Changer de thème'
		'language':         'Langue'
		'run':              'Exécuter'
		'format':           'Formater'
		'reset':            'Réinitialiser'
		'solution':         'Solution'
		'output':           'Sortie'
		'help':             'Raccourcis clavier'
		'help_close':       'Fermer'
		'run_program':      'Exécuter le programme'
		'next_page':        'Page suivante'
		'prev_page':        'Page précédente'
		'toggle_help':      'Ouvrir ou fermer cette aide'
		'move_panes':       'Se déplacer entre les panneaux'
		'previous':         'Précédent'
		'next':             'Suivant'
		'resize_panes':     'Redimensionner les panneaux'
		'page_of':          '\${number} / \${total}'
		'no_program':       'Le sandbox ne contenait pas de programme de test.'
		'compile_failed':   "Le programme n'a pas compilé."
		'could_not_reach':  'Impossible de joindre le serveur : '
		'could_not_format': 'Impossible de formater ce programme.'
		'sandbox_busy':     'Le sandbox est occupé. Veuillez réessayer.'
		'too_large':        'Cette requête est trop grande.'
		'no_compiler':      "Le sandbox n'a pas de compilateur disponible."
		'link_counterpart': 'Lire cette page en \${language}'
		'lang_other':       'Autres langues'
	}
}
