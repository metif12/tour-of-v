module content

// welcome teaches how to use the tour itself, mirroring the opening module
// of the Go Tour.
pub fn welcome() Module {
	return Module{
		id:          'mechanics'
		title:       'Using the tour'
		description: "<p>Welcome to a tour of the <a href='https://vlang.io'>V programming language</a>. " +
			'The tour covers the most important features of the language.</p>'
		lessons:     [
			Lesson{
				slug:        'welcome'
				title:       'Welcome!'
				description: 'Learn how to use this tour: how to navigate the lessons and how to run code.'
				pages:       [
					Page{
						title: 'Hello, World'
						body:  welcome_intro
						code:  Example{
							files: [hello_file]
						}
					},
					Page{
						title: 'Using this tour'
						body:  welcome_using
						code:  Example{
							files: [using_tour_file]
						}
					},
					Page{
						title: 'V offline (optional)'
						body:  welcome_offline
						code:  Example{
							files: [v_offline_file]
						}
					},
					Page{
						title: 'The sandbox'
						body:  welcome_sandbox
						code:  Example{
							files: [sandbox_file]
						}
					},
					Page{
						title: 'Congratulations!'
						body:  welcome_done
						code:  Example{
							files: [welcome_done_file]
						}
					},
				]
			},
		]
	}
}

const hello_file = CodeFile{
	name: 'hello.v'
	body: $embed_file('examples/hello.v').to_string()
}

const sandbox_file = CodeFile{
	name: 'sandbox.v'
	body: $embed_file('examples/sandbox.v').to_string()
}

const welcome_intro = "<p>Welcome to a tour of the <a href='https://vlang.io'>V programming language</a>.</p>
<p>The tour is divided into a list of modules. You can reach them from the
<a href='/list'>table of contents</a>, or with the menu button in the top
right corner of the page.</p>
<p>Throughout the tour you will find slides and exercises. Navigate them
using the <b>previous</b> and <b>next</b> links below the text, or with the
<code>PageUp</code> and <code>PageDown</code> keys.</p>
<p>The tour is interactive. Press the <b>Run</b> button (or
<code>Shift</code>+<code>Enter</code>) to compile and run the program. The
result appears below the code.</p>
<p>These programs are meant to be starting points for your own
experimentation. Edit the program and run it again.</p>
<p>The tour does not offer a <b>Format</b> button. <code>v fmt</code> needs its
own helper tool, and that tool cannot be built inside the sandbox the tour runs
untrusted code in.</p>"

const welcome_using = '<p>Each page has a left column of text and a right
column of code. Between them is a drag handle: drag it to give the code more
room, or the text more room. Your layout is remembered.</p>
<p>The editor keeps your changes. If you edit a program, move to another
slide, and come back, your version is still there. <b>Reset</b> puts the
original back.</p>
<p>Some pages are <em>exercises</em>. They give you a program with a
function to fill in. When you are finished, or if you get stuck, press
<b>Solution</b> to see one way of doing it. Reading the solution first is
the fastest way to stop learning, so try it yourself first.</p>
<p>You can also press <b>Hint</b> on pages that offer one.</p>'

const welcome_offline = "<p>You do not need a local installation of V to use
this tour, but it is worth having.</p>
<p>To install V, follow the instructions at
<a href='https://vlang.io/install.html'>vlang.io/install</a>. On
Windows, macOS and Linux the installer is a single command.</p>
<p>With V installed, any page in this tour can be downloaded and run
locally. Copy the program into a file named <code>main.v</code> and run:</p>
<pre><code>v run main.v</code></pre>
<p>The programs here use only the standard library, so they work the same
way as the versions this tour runs for you.</p>"

const welcome_sandbox = '<p>Your programs run in a sandbox on the server. Each
run gets a fresh, empty directory, and is cut off from the rest of the
machine.</p>
<p>The program is compiled first. If it does not compile, nothing is run and
the compiler message is shown, with the offending line marked in the
editor. Fix it and run again.</p>
<p>If it does compile, the resulting binary runs under strict limits:</p>
<ul>
<li>no network access</li>
<li>no access to your files, or to the server&rsquo;s</li>
<li>a small, fixed amount of memory</li>
<li>a couple of seconds of CPU time</li>
<li>a hard wall-clock timeout, so sleeping forever is caught too</li>
</ul>
<p>If your program hits one of those limits, it is stopped and you are told
so.</p>
<p>The example below sleeps for a moment. Notice that the last line appears
only after the pause, and that the timestamp is the time on the server,
not in your browser.</p>'

const welcome_done = "<p>You finished the first module of the tour!</p>
<p>Go back to the <a href='/list'>list of modules</a> to find what to learn
next, or continue straight to <a href='/basics/1'>the basics of the
language</a>.</p>"

// Every page carries a program, so the code panel is never missing and the
// reader always has somewhere to type. On the closing page it is a short
// program that shows what the tour used.
const using_tour_file = CodeFile{
	name: 'using_the_tour.v'
	body: $embed_file('examples/using_the_tour.v').to_string()
}

const v_offline_file = CodeFile{
	name: 'v_offline.v'
	body: $embed_file('examples/v_offline.v').to_string()
}

const welcome_done_file = CodeFile{
	name: 'congratulations.v'
	body: $embed_file('examples/congratulations.v').to_string()
}
