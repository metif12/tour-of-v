module locale

// Deutsch (German) translation.

pub const de = Text{
	modules: {
		'mechanics':    'Das Tour verwenden'
		'basics':       'Grundtypen'
		'controlflow':  'Kontrollfluss'
		'moretypes':    'Weitere Typen'
		'optionresult': 'Option und Result'
		'methods':      'Methoden und Schnittstellen'
		'generics':     'Generics'
		'concurrency':  'Nebenläufigkeit'
	}
	lessons: {
		'welcome':      'Erste Schritte'
		'basics':       'Grundtypen'
		'controlflow':  'Kontrollfluss'
		'moretypes':    'Weitere Typen'
		'optionresult': 'Option und Result'
		'methods':      'Methoden und Schnittstellen'
		'generics':     'Generics'
		'concurrency':  'Nebenläufigkeit'
	}
	pages:   {
		'welcome/1':       PageText{
			title: 'Hallo, Welt'
			body:  "<p>Willkommen bei einer Tour durch die <a href='https://vlang.io'>Programmiersprache V</a>.</p>
<p>Die Tour ist in Module unterteilt. Du kannst sie über das <a href='/list'>Inhaltsverzeichnis</a> oder über den Menübutton in der oberen rechten Ecke erreichen.</p>
<p>Auf dieser Tour findest du Folien und Übungen. Navigiere mit den <b>Zurück</b>- und <b>Weiter</b>-Links unterhalb des Textes oder mit den Tasten <code>PageUp</code> und <code>PageDown</code>.</p>
<p>Die Tour ist interaktiv. Drücke <b>Ausführen</b> (oder <code>Shift</code>+<code>Enter</code>), um das Programm zu kompilieren und auszuführen. Das Ergebnis erscheint unter dem Code.</p>
<p>Diese Programme sind Ausgangspunkte für eigene Experimente. Bearbeite das Programm und führe es erneut aus.</p>"
		}
		'welcome/2':       PageText{
			title: 'Diese Tour verwenden'
			body:  '<p>Jede Seite hat eine linke Spalte mit Text und eine rechte Spalte mit Code. Dazwischen befindet sich ein Ziehpunkt: Ziehe ihn, um dem Code mehr Raum zu geben.</p>
<p>Der Editor behält deine Änderungen. Wenn du ein Programm bearbeitest, zu einer anderen Folie wechselst und zurückkommst, ist deine Version noch da. <b>Zurücksetzen</b> stellt das Original wieder her.</p>
<p>Einige Seiten sind <em>Übungen</em>. Sie zeigen ein Programm mit einer zu ergänzenden Funktion. Wenn du fertig bist oder nicht weiterkommst, drücke <b>Lösung</b>, um einen möglichen Weg zu sehen.</p>'
		}
		'welcome/3':       PageText{
			title: 'V offline (optional)'
			body:  "<p>Du brauchst keine lokale Installation von V, um diese Tour zu verwenden, aber es ist empfehlenswert.</p>
<p>Um V zu installieren, folge den Anweisungen auf <a href='https://vlang.io/install.html'>vlang.io/install</a>. Unter Windows, macOS und Linux ist der Installer ein einziger Befehl.</p>
<p>Mit V installiert kann jede Seite dieser Tour lokal heruntergeladen und ausgeführt werden. Kopiere das Programm in eine Datei namens <code>main.v</code> und führe aus:</p>
<pre><code>v run main.v</code></pre>
<p>Die Programme hier verwenden nur die Standardbibliothek, also funktionieren sie genauso wie die Versionen, die diese Tour für dich ausführt.</p>"
		}
		'welcome/4':       PageText{
			title: 'Die Sandbox'
			body:  '<p>Deine Programme laufen in einer Sandbox auf dem Server. Jeder Lauf bekommt ein frisches, leeres Verzeichnis und ist vom Rest der Maschine abgeschnitten.</p>
<p>Das Programm wird zuerst kompiliert. Wenn es nicht kompiliert, wird nichts ausgeführt und die Compilermeldung wird angezeigt, mit der betroffenen Zeile im Editor markiert. Korrigiere sie und führe erneut aus.</p>
<p>Wenn es kompiliert, läuft die resultierende Binärdatei unter strengen Limits:</p>
<ul>
<li>kein Netzwerkzugriff</li>
<li>kein Zugriff auf deine Dateien oder die des Servers</li>
<li>ein kleiner, fester Speicher</li>
<li>ein paar Sekunden CPU-Zeit</li>
<li>ein hartes Wallclock-Timeout, damit auch ewiges Schlafen abgefangen wird</li>
</ul>'
		}
		'welcome/5':       PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast das erste Modul der Tour abgeschlossen!</p>
<p>Gehe zurück zur <a href='/list'>Modulliste</a>, um zu sehen, was du als Nächstes lernen kannst, oder fahre direkt mit <a href='/basics/1'>den Grundlagen der Sprache</a> fort.</p>"
		}
		'basics/1':        PageText{
			title: 'Module'
			body:  '<h2>Module</h2>
<p>Jede V-Datei deklariert das <em>Modul</em>, zu dem sie gehört. Die Deklaration ist das Erste in der Datei.</p>
<p>Ein Programm startet im Modul namens <code>main</code>, in einer Funktion namens <code>main</code>.</p>
<p>Dieses Programm verwendet die Standardbibliotheksmodule <code>math</code> und <code>strings</code>.</p>
<p>V hat ein Modul pro Verzeichnis, und ein Modulname entspricht seinem Verzeichnis. Ein Symbol ist nur dann außerhalb seines Moduls sichtbar, wenn es mit <code>pub</code> markiert ist.</p>'
		}
		'basics/2':        PageText{
			title: 'Importe'
			body:  '<h2>Importe</h2>
<p>Ein importiertes Modul bringt seine exportierten Namen in die aktuelle Datei.</p>
<p>Die Standardbibliothek wird nach Modulname importiert: <code>import math</code>, <code>import strings</code>. Drittanbieter-Bibliotheken werden auf die gleiche Weise importiert.</p>
<p>Nicht jede Operation in einem Modul ist als Funktionsschreibweise geschrieben. Manche sind stattdessen _Methoden_ auf dem Wert, also funktioniert <code>s.to_upper()</code> auf einem String ohne jeden Import.</p>'
		}
		'basics/3':        PageText{
			title: 'Variablen'
			body:  '<h2>Variablen</h2>
<p>Führe den Code aus. Beachte die Fehlermeldung.</p>
<p>V-Variablen werden mit <code>:=</code> deklariert. Anders als in den meisten Sprachen ist eine Variable in V <em>standardmäßig unveränderlich</em>, und du musst Veränderlichkeit explizit anfordern.</p>
<p>Der Compiler sagt genau das. Zeile 6 versucht, <code>sum</code> zuzuweisen, ohne um Erlaubnis zu bitten.</p>'
		}
		'basics/4':        PageText{
			title: 'Veränderliche Variablen'
			body:  '<h2>Veränderliche Variablen</h2>
<p>Um eine veränderliche Variable zu deklarieren, füge das Schlüsselwort <code>mut</code> vor dem Namen ein.</p>
<p>V verlangt dies, weil Veränderung etwas ist, das du meinen musst. Eine Variable, die nie neu zugewiesen wird, ist für den Compiler einfacher zu analysieren und für dich einfacher zu verstehen, wenn du später zum Code zurückkommst.</p>'
		}
		'basics/5':        PageText{
			title: 'Kurzdeklarationen'
			body:  '<h2>Kurzdeklarationen</h2>
<p><code>:=</code> deklariert eine Variable und ermittelt ihren Typ aus dem Wert.</p>
<p>Wenn der Typ nicht offensichtlich ist, oder wenn du spezifisch sein willst, benenne ihn direkt mit einer _Konvertierung_ wie <code>i64(42)</code> oder <code>f64(1.5)</code>.</p>'
		}
		'basics/6':        PageText{
			title: 'Funktionen'
			body:  '<h2>Funktionen</h2>
<p>Funktionen werden mit <code>fn</code> deklariert.</p>
<p>Eine Funktion kann null oder mehr Parameter annehmen. Parameter werden mit Name und Typ geschrieben, und aufeinanderfolgende Parameter desselben Typs werden als <code>x, y int</code> geschrieben.</p>'
		}
		'basics/7':        PageText{
			title: 'Mehrere Ergebnisse'
			body:  '<h2>Mehrere Ergebnisse</h2>
<p>Eine Funktion kann mehr als einen Wert zurückgeben. Schreibe den Rückgabetyp als Tupel:</p>
<pre><code>fn min_max(values []int) (int, int)</code></pre>'
		}
		'basics/8':        PageText{
			title: 'Grundtypen'
			body:  '<h2>Grundtypen</h2>
<p>Boolesche Werte sind <code>true</code> und <code>false</code>.</p>
<p>Ganze Zahlen gibt es in festen Größen, <code>i8</code>, <code>i16</code>, <code>i32</code>, <code>i64</code> und <code>i128</code>, und die vorzeichenlosen Größen <code>u8</code> bis <code>u128</code>. <code>int</code> selbst ist plattformabhängig: 64 Bit auf 64-Bit-Zielen, 32 auf 32-Bit-Zielen.</p>'
		}
		'basics/9':        PageText{
			title: 'Nullwerte'
			body:  '<h2>Nullwerte</h2>
<p>Jeder Typ hat einen <em>Nullwert</em>, der das ist, was eine Variable enthält, bevor ihr etwas zugewiesen wird.</p>
<p>Der Nullwert ist <code>0</code> für Zahlen, <code>false</code> für Booleans, der leere String für Strings und die leere Sammlung für Arrays, Slices und Maps.</p>'
		}
		'basics/10':       PageText{
			title: 'Konstanten'
			body:  '<h2>Konstanten</h2>
<p>Eine <code>const</code> ist ein Wert, den der Compiler kennt, während er dein Programm baut, also muss sie ein konstanter Ausdruck sein.</p>
<p>Konstanten werden mit <code>const</code> geschrieben, entweder einzeln oder als Gruppe in Klammern.</p>'
		}
		'basics/11':       PageText{
			title: 'Typkonvertierungen'
			body:  '<h2>Typkonvertierungen</h2>
<p>V konvertiert einen Typ niemals implizit. Der Wechsel von einem zum anderen wird immer ausgeschrieben:</p>
<pre><code>fl := f64(i)</code></pre>'
		}
		'basics/12':       PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast diese Lektion abgeschlossen!</p>
<p>Du kannst zur <a href='/list'>Modulliste</a> zurückkehen, um zu sehen, was du als Nächstes lernen kannst, oder mit <a href='/controlflow/1'>Kontrollfluss</a> fortfahren.</p>"
		}
		'basics/13':       PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast diese Lektion abgeschlossen!</p>
<p>Du kannst zur <a href='/list'>Modulliste</a> zurückkehen, um zu sehen, was du als Nächstes lernen kannst, oder mit <a href='/controlflow/1'>Kontrollfluss</a> fortfahren.</p>"
		}
		'controlflow/1':   PageText{
			title: 'For'
			body:  '<h2>For</h2>
<p>V hat ein einziges Schleifen-Schlüsselwort, und es gibt es in drei Formen.</p>
<p>Die gezählte Form sieht aus wie C:</p>
<pre><code>for i := 0; i &lt; 3; i++ {</code></pre>'
		}
		'controlflow/2':   PageText{
			title: 'For ist Vs "while"'
			body:  '<h2>For ist Vs "while"</h2>
<p>Ein <code>for</code> mit einer einzigen Bedingung läuft weiter, bis diese Bedingung falsch ist.</p>
<pre><code>for sum &lt; 1000 {</code></pre>'
		}
		'controlflow/3':   PageText{
			title: 'For weiter'
			body:  '<h2>For weiter</h2>
<p>Das Iterieren über eine Sammlung verwendet <code>in</code> statt eines Index. Das ist die Form, die du standardmäßig verwenden solltest, weil sie nicht über die Grenzen hinaus kann.</p>
<pre><code>for i, v in items {</code></pre>'
		}
		'controlflow/4':   PageText{
			title: 'If'
			body:  '<h2>If</h2>
<p>Ein <code>if</code> wird so geschrieben:</p>
<pre><code>if x &lt; 0 { return -x }</code></pre>'
		}
		'controlflow/5':   PageText{
			title: 'If mit entpacktem Wert'
			body:  '<h2>If mit entpacktem Wert</h2>
<p>Eine V-Funktion kann einen Wert <em>oder</em> einen Fehler zurückgeben. Der Rückgabetyp wird mit einem <code>!</code> davor geschrieben:</p>
<pre><code>fn parse(s string) !int</code></pre>'
		}
		'controlflow/6':   PageText{
			title: 'Match'
			body:  '<h2>Match</h2>
<p>V hat kein <code>switch</code>-Schlüsselwort. Es hat <code>match</code>, das mehr Fälle abdeckt als ein switch normalerweise.</p>
<p>Match auf einen Wert:</p>
<pre><code>match x {
	1 { }
	2 { }
	else { }
}</code></pre>'
		}
		'controlflow/7':   PageText{
			title: 'Match und Summtypen'
			body:  '<h2>Match und Summtypen</h2>
<p>Ein <em>Summtyp</em> wird mit <code>=</code> und einer Liste von Alternativen deklariert:</p>
<pre><code>type Shape = Circle | Square | Point</code></pre>'
		}
		'controlflow/8':   PageText{
			title: 'Defer'
			body:  '<h2>Defer</h2>
<p><code>defer</code> plant eine Anweisung ein, die ausgeführt wird, wenn der umschließende Block endet.</p>
<p>Sie läuft, wie auch immer der Block endet: durch Erreichen des Endes, durch ein frühes <code>return</code> oder beim Entwinden aus einem Panik. Das ist es, was es für Aufräumarbeiten nützlich macht.</p>'
		}
		'controlflow/9':   PageText{
			title: 'Übung: Schleifen und Funktionen'
			body:  '<h2>Übung: Schleifen und Funktionen</h2>
<p>Schreibe <code>sum_to</code>, sodass es die Summe der Zahlen von <code>0</code> bis <code>n</code> zurückgibt, und <code>sum_squares</code>, sodass es die Summe ihrer Quadrate zurückgibt.</p>'
		}
		'controlflow/10':  PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast diese Lektion abgeschlossen!</p>
<p>Gehe zurück zur <a href='/list'>Modulliste</a>, um zu sehen, was du als Nächstes lernen kannst, oder fahre mit <a href='/moretypes/1'>weiteren Typen</a> fort.</p>"
		}
		'moretypes/1':     PageText{
			title: 'Structs'
			body:  "<h2>Structs</h2>
<p>Ein <em>struct</em> gruppiert Werte unter einem Namen. Es ist Vs Weg zu sagen: &ldquo;diese gehören zusammen&rdquo;.</p>
<pre><code>struct Point {
	x int
	y int
}</code></pre>"
		}
		'moretypes/2':     PageText{
			title: 'Arrays'
			body:  '<h2>Arrays</h2>
<p>Ein Array hat eine feste Länge, und sein Elementtyp kommt von seinem ersten Element:</p>
<pre><code>numbers := [3, 4, 5]</code></pre>'
		}
		'moretypes/3':     PageText{
			title: 'Slices'
			body:  '<h2>Slices</h2>
<p>Ein Slice ist eine Sicht auf einen Bereich eines Arrays oder eines anderen Slices, geschrieben mit der gleichen <code>[]</code>-Syntax:</p>
<pre><code>part := arr[1..3]</code></pre>'
		}
		'moretypes/4':     PageText{
			title: 'Maps'
			body:  '<h2>Maps</h2>
<p>Eine Map enthält Schlüssel-Wert-Paare und wird als Literal geschrieben:</p>
<pre><code>ages := {
	'"'"'Ada'"'"': 36
	'"'"'Alan'"'"': 41
}</code></pre>'
		}
		'moretypes/5':     PageText{
			title: 'Strings'
			body:  '<h2>Strings</h2>
<p>Ein V-String ist eine Sequenz von Bytes, was eine Konsequenz hat, die du sofort wahrnehmen wirst: Indexieren gibt ein Byte, und <code>.len</code> zählt Bytes.</p>'
		}
		'moretypes/6':     PageText{
			title: 'Methoden'
			body:  '<h2>Methoden</h2>
<p>Eine Methode ist eine Funktion mit einem <em>Empfänger</em>: dem Wert, auf dem sie aufgerufen wird.</p>
<pre><code>fn (p Point) sum() int {
	return p.x + p.y
}</code></pre>'
		}
		'moretypes/7':     PageText{
			title: 'Übung: Wortzählung'
			body:  '<h2>Übung: Wortzählung</h2>
<p>Implementiere <code>word_count</code>, sodass es zählt, wie oft jedes Wort in einem String vorkommt.</p>'
		}
		'moretypes/8':     PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast diese Lektion abgeschlossen!</p>
<p>Du kannst zur <a href='/list'>Modulliste</a> zurückkehren, um zu sehen, was du als Nächstes lernen kannst, oder mit <a href='/optionresult/1'>Umgang mit Abwesenheit und Fehlern</a> fortfahren.</p>"
		}
		'optionresult/1':  PageText{
			title: 'Option'
			body:  '<h2>Option</h2>
<p>V unterscheidet zwei Situationen, die viele Sprachen zusammenwerfen, und gibt jeder ihren eigenen Typ.</p>
<p>Ein <code>?T</code> ist ein Wert oder <em>none</em>. Es ist für den Fall, in dem es nichts zurückzugeben gibt und nichts schiefgelaufen ist: eine Suche, die nichts gefunden hat.</p>'
		}
		'optionresult/2':  PageText{
			title: 'Result und Fehler'
			body:  '<h2>Result und Fehler</h2>
<p>Eine Option sagt, dass es nichts gibt. Ein <code>!T</code> sagt, dass etwas <em>fehlgeschlagen</em> ist, und trägt eine Nachricht darüber, wie.</p>'
		}
		'optionresult/3':  PageText{
			title: 'Übung: Options'
			body:  '<h2>Übung: Options</h2>
<p>Schreibe vier Funktionen, jede gibt eine Option zurück.</p>'
		}
		'optionresult/4':  PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast diese Lektion abgeschlossen!</p>
<p>Du kannst zur <a href='/list'>Modulliste</a> zurückkehren, um zu sehen, was du als Nächstes lernen kannst, oder mit <a href='/methods/1'>Methoden und Schnittstellen</a> fortfahren.</p>"
		}
		'methods/1':       PageText{
			title: 'Schnittstellen'
			body:  '<h2>Schnittstellen</h2>
<p>V hat keine Klassen. Ein Struct mit Methoden ist das Ganze, und für die meisten Programme ist das alles, was du brauchst.</p>
<p>Eine <em>Schnittstelle</em> ist eine Liste von Methoden. Ein Typ implementiert sie einfach, indem er sie hat: es gibt kein Schlüsselwort zu schreiben und nichts zu deklarieren.</p>'
		}
		'methods/2':       PageText{
			title: 'Einbettung'
			body:  '<h2>Einbettung</h2>
<p>Ein Struct kann ein anderes Struct einbetten, geschriebar als ein nackter Typname:</p>
<pre><code>struct Base {
	id int
}

struct User {
	Base
	name string
}</code></pre>'
		}
		'methods/3':       PageText{
			title: 'Druckbare Typen'
			body:  '<h2>Druckbare Typen</h2>
<p>V druckt einen Wert mit seiner <code>str</code>-Methode, statt über seine Felder zu reflektieren, also kontrolliert ein Typ, wie er erscheint, indem er eine definiert:</p>'
		}
		'methods/4':       PageText{
			title: 'Übung: Formen'
			body:  '<h2>Übung: Formen</h2>
<p>Vier Dinge zu schreiben.</p>'
		}
		'methods/5':       PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast diese Lektion abgeschlossen!</p>
<p>Du kannst zur <a href='/list'>Modulliste</a> zurückkehren, um zu sehen, was du als Nächstes lernen kannst, oder mit <a href='/generics/1'>Generics</a> fortfahren.</p>"
		}
		'generics/1':      PageText{
			title: 'Generische Funktionen'
			body:  '<h2>Generische Funktionen</h2>
<p>Ein Typparameter steht für einen Typ, sodass eine Deklaration einer ganzen Familie von ihnen dienen kann. V schreibt ihn in eckigen Klammern, und das ist das einzige Stück Syntax, das es sich zu merken lohnt:</p>'
		}
		'generics/2':      PageText{
			title: 'Generische Structs'
			body:  '<h2>Generische Structs</h2>
<p>Ein Struct nimmt einen Typparameter auf die gleiche Weise wie eine Funktion, und jedes Feld, der ihn erwähnt, gehört zur Instanziierung:</p>'
		}
		'generics/3':      PageText{
			title: 'Maps generischer Typen'
			body:  '<h2>Maps generischer Typen</h2>
<p>Ein generischer Typ kann der Werttyp einer Map sein, und der Typargument wird am Verwendungsort ausgeschrieben.</p>'
		}
		'generics/4':      PageText{
			title: 'Mehrere Typparameter'
			body:  '<h2>Mehrere Typparameter</h2>
<p>Typparameter stapeln sich. Zwei auf einer Funktion sind normalerweise der Eingabe- und der Ausgabetyp.</p>'
		}
		'generics/5':      PageText{
			title: 'Übung: Generics'
			body:  '<h2>Übung: Generics</h2>
<p>Vier Dinge zu schreiben, und zusammen verwenden sie jede Form aus dieser Lektion.</p>'
		}
		'generics/6':      PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast diese Lektion abgeschlossen!</p>
<p>Du kannst zur <a href='/list'>Modulliste</a> zurückkehren, um zu sehen, was du als Nächstes lernen kannst, oder mit <a href='/concurrency/1'>Nebenläufigkeit</a> fortfahren.</p>"
		}
		'concurrency/1':   PageText{
			title: 'Spawn'
			body:  '<h2>Spawn</h2>
<p><code>spawn</code> startet einen Thread und kehrt sofort zurück. Es gibt ein Handle zurück, und das Handle ist, wie du später auf den Thread wartest:</p>'
		}
		'concurrency/2':   PageText{
			title: 'Channels'
			body:  '<h2>Channels</h2>
<p>Ein Channel bewegt Werte eines Typs von einem Thread zum anderen. Erstelle ihn mit dem Elementtyp und einer Kapazität, und sende und empfange mit dem gleichen Pfeil:</p>'
		}
		'concurrency/3':   PageText{
			title: 'Gepufferte Channels'
			body:  '<h2>Gepufferte Channels</h2>
<p>Eine Kapazität gibt dem Channel Raum, sodass ein Sender voraus kann, statt bei jedem Wert zu blockieren:</p>'
		}
		'concurrency/4':   PageText{
			title: 'Empfangen bis zum Schließen'
			body:  '<h2>Empfangen bis zum Schließen</h2>
<p><strong>Es gibt kein <code>for x in ch</code> in V.</strong> Ein Channel ist keine Sammlung, also hat die Schleife nichts zu indizieren, und der Compiler sagt:</p>'
		}
		'concurrency/5':   PageText{
			title: 'Schließen'
			body:  '<h2>Schließen</body>
<p>Schließe einen Channel, wenn sein Produzent fertig damit ist, und schließe ihn vom Produzenten. Der Produzent besitzt den Channel auf die gleiche Weise, wie er die Entscheidung besitzt, zu stoppen:</p>'
		}
		'concurrency/6':   PageText{
			title: 'Select'
			body:  '<h2>Select</h2>
<p><code>select</code> wartet auf mehrere Channels und führt den Body dessen aus, der bereit ist. Es ist, wie du die erste Antwort statt einer festen Reihenfolge nimmst:</p>'
		}
		'concurrency/7':   PageText{
			title: 'Geteilter Zustand'
			body:  '<h2>Geteilter Zustand</h2>
<p>Channels bewegen Werte. Wenn Threads denselben Wert <em>ändern</em> müssen, ist das die Aufgabe eines Locks.</p>'
		}
		'concurrency/8':   PageText{
			title: 'Wait Groups'
			body:  '<h2>Wait Groups</h2>
<p>Eine Wait Group zählt laufende Arbeit. <code>add</code> vor dem Spawn, <code>done</code> darin, und <code>wait</code>, wenn du alles gestartet hast:</p>'
		}
		'concurrency/9':   PageText{
			title: 'Übung: Ein Worker-Pool'
			body:  '<h2>Übung: Ein Worker-Pool</h2>
<p>Baue einen Pool von Workern und füttere ihn mit Jobs.</p>'
		}
		'concurrency/10':  PageText{
			title: 'Glückwunsch!'
			body:  "<p>Du hast diese Lektion abgeschlossen, und damit die ganze Tour.</p>
<p>Alles oben lebt in der Sprache statt in einer Bibliothe, was es sich zu merken lohnt, während du weitergehst: ein Thread, ein Channel und ein Lock sind gewöhnliche V-Deklarationen, die du in derselben Datei wie den Code lesen kannst, dem sie dienen.</p>
<p>Du kannst zur <a href='/list'>Modulliste</a> zurückkehen, um alles noch einmal zu lesen, oder bei <a href='/welcome/1'>den ersten Schritten</a> neu beginnen.</p>"
		}
		'cli/1':          PageText{
			title: 'Alltagskommandos'
			body:  "<h2>Alltagskommandos</h2>
<p>Drei Befehle laufen bei fast jeder Änderung. <code>v fmt -w .</code> formatiert das Projekt, <code>v vet .</code> meldet verdächtige Konstrukte und <code>v test .</code> führt die Tests aus:</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>Formatiere vor jedem Commit, damit ein Review nie über Layout streitet.</p>
<p><code>v doc strings</code> zeigt die Dokumentation eines Moduls, <code>v repl</code> öffnet eine interaktive Eingabe und <code>v watch run main.v</code> baut neu und führt erneut aus, sobald sich eine Quelldatei ändert.</p>"
		}
		'vpm/1':          PageText{
			title: 'Pakete'
			body:  "<h2>Pakete</h2>
<p>Bibliotheken leben in der Paket-Registry. Durchsuche sie, sieh dir ein Ergebnis an und installiere es:</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p><code>v list</code> zeigt die Abhängigkeiten des Projekts. <code>v outdated</code> meldet neuere Versionen, <code>v update</code> holt sie und <code>v remove</code> entfernt eine.</p>
<p>Diese Befehle brauchen das Netz, also laufen sie auf deiner Maschine und nicht in der Sandbox dieser Tour.</p>"
		}
		'mcp/1':          PageText{
			title: 'Model Context Protocol'
			body:  "<h2>v mcp</h2>
<p><code>v mcp serve</code> stellt den Compiler selbst einem Coding-Agenten zur Verfügung: Deklarationen, Referenzen und Diagnostik über Standard-Ein- und Ausgabe:</p>
<pre><code>v mcp serve</code></pre>
<p><code>v mcp tools</code> listet auf, was verfügbar ist. Mit <code>--http</code> wird stattdessen über HTTP serviert, mit <code>--root</code> werden relative Pfade gegen ein Verzeichnis aufgelöst und mit <code>--read-only</code> werden keine dateischreibenden Tools registriert.</p>
<p><code>v mcp install</code> verdrahtet den Server mit einem Agenten, <code>v mcp uninstall</code> entfernt ihn wieder. Diese Oberfläche ist neu und braucht daher ein aktuelles V statt des Releases, das diese Sandbox ausführt.</p>"
		}
		'skills/1':       PageText{
			title: 'Skills'
			body:  "<h2>Skills</h2>
<p>Skills sind gebündelte Anweisungen, die ein Agent für eine Aufgabe lädt: die Sprachregeln, die Testschleife, die Werkzeugoberfläche:</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>Skills werden in <code>.agents/skills/</code> im Projekt installiert, oder mit <code>--global</code> unter deinem Home-Verzeichnis. <code>v skills path v-tools</code> zeigt, wo eines liegt, und <code>--dry-run</code> meldet, ohne zu schreiben.</p>
<p>Wie <code>v mcp</code> ist auch das neue Oberfläche: es braucht ein aktuelles V.</p>"
		}
	}
	ui:      {
		'site_title':       'Eine Tour durch V'
		'toc':              'Inhaltsverzeichnis'
		'toggle_theme':     'Design wechseln'
		'language':         'Sprache'
		'run':              'Ausführen'
		'format':           'Formatieren'
		'reset':            'Zurücksetzen'
		'solution':         'Lösung'
		'output':           'Ausgabe'
		'help':             'Tastenkürzel'
		'help_close':       'Schließen'
		'run_program':      'Programm ausführen'
		'next_page':        'Nächste Seite'
		'prev_page':        'Vorherige Seite'
		'toggle_help':      'Diese Hilfe öffnen oder schließen'
		'move_panes':       'Zwischen Bereichen wechseln'
		'previous':         'Zurück'
		'next':             'Weiter'
		'resize_panes':     'Bereiche skalieren'
		'page_of':          '\${number} / \${total}'
		'no_program':       'Der Sandbox war kein Testprogramm vorhanden.'
		'compile_failed':   'Programm wurde nicht kompiliert.'
		'could_not_reach':  'Server nicht erreichbar: '
		'could_not_format': 'Dieses Programm konnte nicht formatiert werden.'
		'sandbox_busy':     'Die Sandbox ist ausgelastet. Bitte erneut versuchen.'
		'too_large':        'Diese Anfrage ist zu groß.'
		'no_compiler':      'Der Sandbox steht kein Compiler zur Verfügung.'
		'link_counterpart': 'Diese Seite auf \${language} lesen'
		'lang_other':       'Weitere Sprachen'
	}
}
