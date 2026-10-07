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
			body:  '<h2>If avec valeur déballée</h2>'
		}
		'controlflow/6':  PageText{
			title: 'Match'
			body:  '<h2>Match</h2>
<p>V n&rsquo;a pas de mot-clé <code>switch</code>. Il a <code>match</code>, qui couvre plus de cas qu&rsquo;un switch habituellement.</p>'
		}
		'controlflow/7':  PageText{
			title: 'Match et types sommes'
			body:  '<h2>Match et types sommes</h2>'
		}
		'controlflow/8':  PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>
<p><code>defer</code> planifie une instruction pour s&rsquo;exécuter quand le bloc environnant se termine.</p>'
		}
		'controlflow/9':  PageText{
			title: 'Exercice : Boucles et fonctions'
			body:  '<h2>Exercice : Boucles et fonctions</h2>'
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
			body:  '<h2>Arrays</h2>'
		}
		'moretypes/3':    PageText{
			title: 'Slices'
			body:  '<h2>Slices</h2>'
		}
		'moretypes/4':    PageText{
			title: 'Maps'
			body:  '<h2>Maps</h2>'
		}
		'moretypes/5':    PageText{
			title: 'Strings'
			body:  '<h2>Strings</h2>'
		}
		'moretypes/6':    PageText{
			title: 'Méthodes'
			body:  '<h2>Méthodes</h2>'
		}
		'moretypes/7':    PageText{
			title: 'Exercice : Comptage de mots'
			body:  '<h2>Exercice : Comptage de mots</h2>'
		}
		'moretypes/8':    PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/optionresult/1'>la gestion de l'absence et des erreurs</a>.</p>"
		}
		'optionresult/1': PageText{
			title: 'Option'
			body:  '<h2>Option</h2>'
		}
		'optionresult/2': PageText{
			title: 'Result et erreurs'
			body:  '<h2>Result et erreurs</h2>'
		}
		'optionresult/3': PageText{
			title: 'Exercice : Options'
			body:  '<h2>Exercice : Options</h2>'
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
			body:  '<h2>Embarquement</h2>'
		}
		'methods/3':      PageText{
			title: 'Types affichables'
			body:  '<h2>Types affichables</h2>'
		}
		'methods/4':      PageText{
			title: 'Exercice : Formes'
			body:  '<h2>Exercice : Formes</h2>'
		}
		'methods/5':      PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/generics/1'>les génériques</a>.</p>"
		}
		'generics/1':     PageText{
			title: 'Fonctions génériques'
			body:  '<h2>Fonctions génériques</h2>'
		}
		'generics/2':     PageText{
			title: 'Structs génériques'
			body:  '<h2>Structs génériques</h2>'
		}
		'generics/3':     PageText{
			title: 'Maps de types génériques'
			body:  '<h2>Maps de types génériques</h2>'
		}
		'generics/4':     PageText{
			title: 'Plusieurs paramètres de type'
			body:  '<h2>Plusieurs paramètres de type</h2>'
		}
		'generics/5':     PageText{
			title: 'Exercice : Génériques'
			body:  '<h2>Exercice : Génériques</h2>'
		}
		'generics/6':     PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon !</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour voir quoi apprendre ensuite, ou continuer avec <a href='/concurrency/1'>la concurrence</a>.</p>"
		}
		'concurrency/1':  PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>'
		}
		'concurrency/2':  PageText{
			title: 'Channels'
			body:  '<h2>Channels</h2>'
		}
		'concurrency/3':  PageText{
			title: 'Channels bufferisés'
			body:  '<h2>Channels bufferisés</h2>'
		}
		'concurrency/4':  PageText{
			title: 'Recevoir jusqu&rsquo;à la fermeture'
			body:  '<h2>Recevoir jusqu&rsquo;à la fermeture</h2>'
		}
		'concurrency/5':  PageText{
			title: 'Fermeture'
			body:  '<h2>Fermeture</h2>'
		}
		'concurrency/6':  PageText{
			title: 'Select'
			body:  '<h2>Select</h2>'
		}
		'concurrency/7':  PageText{
			title: 'État partagé'
			body:  '<h2>État partagé</h2>'
		}
		'concurrency/8':  PageText{
			title: 'Groupes d&rsquo;attente'
			body:  '<h2>Groupes d&rsquo;attente</h2>'
		}
		'concurrency/9':  PageText{
			title: 'Exercice : Un pool de workers'
			body:  '<h2>Exercice : Un pool de workers</h2>'
		}
		'concurrency/10': PageText{
			title: 'Félicitations !'
			body:  "<p>Vous avez terminé cette leçon, et avec elle tout le tour.</p>
<p>Tout ce qui précède vit dans le langage plutôt que dans une bibliothèque, ce qui vaut la peine d'être rappelé : un thread, un channel et un lock sont des déclarations V ordinaires que vous pouvez lire dans le même fichier que le code qu'elles servent.</p>
<p>Vous pouvez revenir à la <a href='/list'>liste des modules</a> pour relire quoi que ce soit, ou recommencer à <a href='/welcome/1'>premiers pas</a>.</p>"
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
