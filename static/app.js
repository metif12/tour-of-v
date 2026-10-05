// Tour of V client.
//
// Everything on a lesson page that is not the prose and not the editor's own
// machinery lives here: navigation, persistence, running code, and marking
// the line the compiler complained about.
//
// The behaviour is deliberately modelled on the Go Tour, which is the thing
// this project is a port of. Where the Go Tour scrapes `file:line:` out of
// the compiler's output in the browser, the server does that parsing now and
// sends a single line number, so the browser has one job rather than two.

(function () {
	'use strict'

	// ---------------------------------------------------------------- storage

	// Edited programs are kept in localStorage, keyed by a hash of the
	// original source. Keying on the source rather than on the page URL means
	// two pages showing the same program share an edit, which is what the Go
	// Tour does too.
	var storage = {
		get: function (key) {
			try {
				return window.localStorage.getItem(key)
			} catch (e) {
				return null
			}
		},
		set: function (key, value) {
			try {
				window.localStorage.setItem(key, value)
			} catch (e) {
				// Private browsing, or a full quota. Editing still works for
				// this session; it just will not be remembered.
			}
		},
		remove: function (key) {
			try {
				window.localStorage.removeItem(key)
			} catch (e) {}
		}
	}

	// hash is a small, stable digest of a string, used only as a storage key.
	// It does not need to be cryptographic.
	function hash(s) {
		var h1 = 0x811c9dc5
		var h2 = 0x01000193
		for (var i = 0; i < s.length; i++) {
			var c = s.charCodeAt(i)
			h1 = (h1 ^ c) >>> 0
			h1 = (h1 * 16777619) >>> 0
			h2 = ((h2 << 5) - h2 + c) >>> 0
		}
		return h1.toString(16) + '-' + h2.toString(16) + '-' + s.length
	}

	// layout remembers how the reader split the window, and which theme they
	// chose. Both are preferences rather than content.
	function loadPref(name, fallback) {
		var v = storage.get('tour-pref-' + name)
		return v === null ? fallback : v
	}

	function savePref(name, value) {
		storage.set('tour-pref-' + name, value)
	}

	// ------------------------------------------------------------------ theme

	function applyTheme(theme) {
		document.documentElement.setAttribute('data-theme', theme)
		savePref('theme', theme)
	}

	function initTheme() {
		var stored = loadPref('theme', null)
		var theme = stored
		if (!theme || theme === 'auto') {
			var prefersDark = window.matchMedia &&
				window.matchMedia('(prefers-color-scheme: dark)').matches
			theme = prefersDark ? 'dark' : 'light'
		}
		document.documentElement.setAttribute('data-theme', theme)

		var button = document.getElementById('theme-toggle')
		if (!button) return
		button.addEventListener('click', function () {
			var current = document.documentElement.getAttribute('data-theme')
			applyTheme(current === 'dark' ? 'light' : 'dark')
		})
	}

	// -------------------------------------------------------------------- toc

	function initToc() {
		var toc = document.getElementById('toc')
		var catcher = document.getElementById('toc-catcher')
		var button = document.getElementById('toc-toggle')
		if (!toc || !button) return

		// Open the lesson currently being read, so the drawer shows where the
		// reader is without them having to go looking.
		var path = window.location.pathname
		var lesson = document.querySelector('.toc-lesson[data-slug]')
		var lessons = document.querySelectorAll('.toc-lesson')
		for (var i = 0; i < lessons.length; i++) {
			var slug = lessons[i].getAttribute('data-slug')
			if (path.indexOf('/' + slug + '/') === 0) {
				lesson = lessons[i]
			}
		}
		if (lesson) lesson.open = true

		function setOpen(open) {
			toc.hidden = !open
			if (catcher) catcher.hidden = !open
			button.setAttribute('aria-expanded', open ? 'true' : 'false')
		}

		button.addEventListener('click', function () {
			setOpen(toc.hidden)
		})
		if (catcher) {
			catcher.addEventListener('click', function () {
				setOpen(false)
			})
		}

		// Following a link inside the drawer closes it on a narrow screen,
		// where it covers the page it navigates to.
		document.addEventListener('click', function (e) {
			var a = e.target.closest ? e.target.closest('a') : null
			if (a && toc.contains(a) && window.innerWidth < 900) {
				setOpen(false)
			}
		})

		document.addEventListener('keydown', function (e) {
			if (e.key === 'Escape' && !toc.hidden) setOpen(false)
		})

		setOpen(false)
	}

	// -------------------------------------------------------------- pagination

	function initPager() {
		// PageUp and PageDown move between pages, as in the Go Tour. The
		// editor swallows both, so the editor's extraKeys handle it instead
		// and this only covers focus outside the editor.
		document.addEventListener('keydown', function (e) {
			if (e.target && e.target.classList &&
				e.target.classList.contains('CodeMirror')) {
				return
			}
			if (e.key === 'PageDown' || (e.key === 'ArrowRight' && e.altKey)) {
				var next = document.querySelector('.next-page')
				if (next && next.href) window.location.href = next.href
			} else if (e.key === 'PageUp' || (e.key === 'ArrowLeft' && e.altKey)) {
				var prev = document.querySelector('.prev-page')
				if (prev && prev.href) window.location.href = prev.href
			}
		})
	}

	// ----------------------------------------------------------------- lesson

	function Lesson(data) {
		this.data = data
		this.editor = null
		this.files = data.files || []
		this.currentFile = 0
		this.solutionShown = false
	}

	Lesson.prototype.storageKey = function (file) {
		return 'tour-code-' + hash(this.data.lesson + '/' + file.name + '\n' + file.body)
	}

	// current returns the file being edited.
	Lesson.prototype.current = function () {
		return this.files[this.currentFile]
	}

	// source returns what the editor should show: the learner's saved edit if
	// there is one, otherwise the original.
	Lesson.prototype.source = function () {
		var file = this.current()
		var saved = storage.get(this.storageKey(file))
		return saved === null ? file.body : saved
	}

	Lesson.prototype.save = function () {
		if (!this.editor) return
		storage.set(this.storageKey(this.current()), this.editor.getValue())
	}

	Lesson.prototype.reset = function () {
		storage.remove(this.storageKey(this.current()))
		if (this.editor) this.editor.setValue(this.current().body)
		this.solutionShown = false
		this.updateMenu()
	}

	Lesson.prototype.revealSolution = function () {
		var solution = (this.data.solution || [])[this.currentFile]
		if (!solution || !this.editor) return
		this.save()
		this.editor.setValue(solution.body)
		this.solutionShown = true
	}

	Lesson.prototype.updateMenu = function () {
		var button = document.getElementById('solution')
		if (button) {
			button.textContent = this.solutionShown ? 'Hide solution' : 'Solution'
		}
	}

	// ------------------------------------------------------------------- api

	function post(url, fields) {
		var body = new URLSearchParams()
		for (var key in fields) {
			if (Object.prototype.hasOwnProperty.call(fields, key)) {
				body.append(key, fields[key])
			}
		}
		return fetch(url, {
			method: 'POST',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: body.toString()
		}).then(function (r) {
			if (!r.ok) throw new Error('the server returned ' + r.status)
			return r.json()
		})
	}

	// ----------------------------------------------------------------- output

	function Output(el) {
		this.el = el
	}

	// write appends a block of text. Everything is inserted as text, never as
	// markup: a learner's program can print anything at all, including
	// something that looks like HTML.
	Output.prototype.write = function (text, kind) {
		if (!text) return
		var span = document.createElement('span')
		span.className = 'out-' + (kind || 'stdout')
		span.textContent = text
		this.el.appendChild(span)
		this.scroll()
	}

	Output.prototype.clear = function () {
		this.el.innerHTML = ''
	}

	Output.prototype.scroll = function () {
		this.el.scrollTop = this.el.scrollHeight
	}

	// -------------------------------------------------------- input and output

	// Input and output share a tab strip under the editor. Each half opens and
	// closes on its own, because the two are independent: most programs never
	// read stdin, and closing the output should not throw away typed input.
	function initOutput() {
		var panel = document.getElementById('io-panel')
		var outToggle = document.getElementById('output-toggle')
		var inToggle = document.getElementById('input-toggle')
		var stdinPanel = document.getElementById('stdin-panel')
		var outEl = document.getElementById('output')
		var stdinEl = document.getElementById('stdin')
		if (!panel || !outToggle) return

		function setOutput(open) {
			outEl.hidden = !open
			outToggle.setAttribute('aria-expanded', open ? 'true' : 'false')
			savePref('outputOpen', open ? '1' : '0')
		}

		function setInput(open) {
			stdinPanel.hidden = !open
			inToggle.setAttribute('aria-expanded', open ? 'true' : 'false')
			savePref('inputOpen', open ? '1' : '0')
		}

		outToggle.addEventListener('click', function () {
			setOutput(outEl.hidden)
		})

		if (inToggle && stdinPanel) {
			inToggle.addEventListener('click', function () {
				setInput(stdinPanel.hidden)
			})
		}

		// Output starts open, because a learner who just pressed Run needs to see
		// something. Input starts closed: most programs do not read stdin, and an
		// empty box under the editor invites typing into it for no reason.
		setOutput(loadPref('outputOpen', '1') !== '0')
		if (inToggle && stdinPanel) {
			setInput(loadPref('inputOpen', '0') === '1')
		}

		// The strip is pointless once both halves are closed, so it collapses too
		// and the editor gets the space back.
		function refreshPanel() {
			var bothClosed = outEl.hidden && (!stdinPanel || stdinPanel.hidden)
			panel.classList.toggle('collapsed', bothClosed)
		}

		outToggle.addEventListener('click', refreshPanel)
		if (inToggle) inToggle.addEventListener('click', refreshPanel)
		refreshPanel()

		// Remembered so a learner who types input once does not lose it by
		// navigating to the next page and back.
		if (stdinEl) {
			var saved = loadPref('stdin', '')
			if (saved) stdinEl.value = saved
			stdinEl.addEventListener('input', function () {
				savePref('stdin', stdinEl.value)
			})
		}
	}

	// revealOutput opens the output if the learner closed it, so that running a
	// program never appears to do nothing.
	function revealOutput() {
		var panel = document.getElementById('io-panel')
		var outEl = document.getElementById('output')
		var outToggle = document.getElementById('output-toggle')
		if (!panel || !outEl) return
		if (outEl.hidden) {
			outEl.hidden = false
			outToggle.setAttribute('aria-expanded', 'true')
			savePref('outputOpen', '1')
			panel.classList.remove('collapsed')
		}
	}

	// --------------------------------------------------------------- the page

	function initLesson(data) {
		var lesson = new Lesson(data)
		var textarea = document.getElementById('editor')
		if (!textarea) return

		var outputEl = document.getElementById('output')
		var output = new Output(outputEl)

		lesson.editor = CodeMirror.fromTextArea(textarea, {
			mode: 'text/x-vlang',
			lineNumbers: true,
			indentUnit: 4,
			tabSize: 4,
			indentWithTabs: true,
			lineWrapping: true,
			matchBrackets: true,
			autoCloseBrackets: true,
			viewportMargin: 20,
			extraKeys: {
				'Shift-Enter': function () {
					run()
				},
				'Ctrl-Enter': function () {
					format()
				},
				'PageDown': function () {
					goPage(1)
				},
				'PageUp': function () {
					goPage(-1)
				}
			}
		})
		lesson.editor.setValue(lesson.source())
		lesson.editor.clearHistory()

		// Any edit clears the error marking immediately. The Go Tour does the
		// same: a stale red line on code that has since changed is worse than
		// no marking at all.
		lesson.editor.on('change', function () {
			clearErrorMark()
			lesson.save()
		})

		function goPage(delta) {
			var link = document.querySelector(delta > 0 ? '.next-page' : '.prev-page')
			if (link && link.href) window.location.href = link.href
		}

		// --------------------------------------------------------- error marks

		var marked = null

		function clearErrorMark() {
			if (!marked) return
			lesson.editor.removeLineClass(marked, 'background', 'cm-error-line')
			marked = null
		}

		function markError(line) {
			clearErrorMark()
			if (!line || line < 1) return
			var last = lesson.editor.lineCount()
			if (line > last) line = last
			marked = lesson.editor.addLineClass(line - 1, 'background', 'cm-error-line')
			lesson.editor.scrollIntoView({ line: line, ch: 0 }, 120)
		}

		// ------------------------------------------------------------- running

		var running = false

		function run() {
			if (running) return
			running = true
			clearErrorMark()
			output.clear()
			revealOutput()

			var file = lesson.current()
			post('/api/run', {
				code: lesson.editor.getValue(),
				filename: file.name
			}).then(function (res) {
				running = false
				if (res.error) {
					// A request that never ran, as opposed to a program that
					// failed to compile, has no build output worth showing.
					output.write(res.error, 'system')
					return
				}
				if (res.buildOutput) output.write(res.buildOutput, 'build')
				if (!res.ran) {
					markError(res.diagLine)
					if (res.diagText) output.write(res.diagText, 'system')
					output.write('Program did not compile.', 'system')
					return
				}
				if (res.limited) {
					output.write(res.output, 'system')
					return
				}
				output.write(res.output || '', 'stdout')
			}).catch(function (err) {
				running = false
				output.write('Could not reach the server: ' + err.message, 'system')
			})
		}

		// ----------------------------------------------------------- wiring up

		function format() {
			var el = document.getElementById('format')
			// The button is absent on a page with no program to format, and on a
			// build where formatting is unavailable. Both are normal, so this
			// silently does nothing rather than throwing.
			if (!el) return
			post('/api/format', {
				code: lesson.editor.getValue(),
				filename: lesson.current().name
			}).then(function (res) {
				if (res.body !== undefined && res.body !== null && res.error === '') {
					lesson.editor.setValue(res.body)
					lesson.save()
					clearErrorMark()
				} else if (res.error) {
					output.write(res.error, 'system')
				}
			}).catch(function (err) {
				output.write('Could not reach the server: ' + err.message, 'system')
			})
		}

		on('run', function (e) {
			e.preventDefault()
			run()
		})
		on('format', function (e) {
			e.preventDefault()
			format()
		})
		on('reset', function (e) {
			e.preventDefault()
			lesson.reset()
			output.clear()
		})
		on('solution', function (e) {
			e.preventDefault()
			if (lesson.solutionShown) {
				lesson.editor.setValue(lesson.source())
				lesson.solutionShown = false
			} else {
				lesson.revealSolution()
			}
			lesson.updateMenu()
		})

		var tabs = document.querySelectorAll('.file-tab')
		Array.prototype.forEach.call(tabs, function (tab) {
			tab.addEventListener('click', function (e) {
				e.preventDefault()
				var name = tab.getAttribute('data-file')
				for (var i = 0; i < lesson.files.length; i++) {
					if (lesson.files[i].name === name) {
						lesson.save()
						lesson.currentFile = i
						lesson.solutionShown = false
						lesson.editor.setValue(lesson.source())
						lesson.editor.clearHistory()
						clearErrorMark()
						setActiveTab(tabs, i)
						lesson.updateMenu()
						break
					}
				}
			})
		})

		setActiveTab(tabs, 0)
		lesson.updateMenu()
	}

	function setActiveTab(tabs, index) {
		Array.prototype.forEach.call(tabs, function (tab, i) {
			tab.classList.toggle('active', i === index)
		})
	}

	function on(id, handler) {
		var el = document.getElementById(id)
		if (el) el.addEventListener('click', handler)
	}

	// ------------------------------------------------------------- resizing

	function initSplitter() {
		var splitter = document.getElementById('splitter')
		var lesson = document.getElementById('lesson')
		var prose = document.getElementById('prose-pane')
		if (!splitter || !lesson || !prose) return

		var MIN = 20

		// Below this width the panes are stacked and the splitter is hidden, so
		// there is no column split to remember or restore. The split used to be
		// written as an inline style on load, and an inline style outranks the
		// media query that stacks the panes, so a narrow window kept the
		// side by side layout with the code pane crushed into the 6px gap the
		// hidden splitter used to occupy.
		var stacked = window.matchMedia('(max-width: 860px)')

		function apply(percent) {
			if (stacked.matches) {
				lesson.style.removeProperty('grid-template-columns')
				return
			}
			percent = Math.max(MIN, Math.min(100 - MIN, percent))
			lesson.style.gridTemplateColumns = percent + '% 6px 1fr'
			savePref('split', percent)
		}

		var dragging = false

		function move(e) {
			if (!dragging) return
			var rect = lesson.getBoundingClientRect()
			var x = (e.touches ? e.touches[0].clientX : e.clientX) - rect.left
			apply((x / rect.width) * 100)
		}

		function stop() {
			dragging = false
			document.body.classList.remove('dragging')
		}

		splitter.addEventListener('mousedown', function (e) {
			dragging = true
			document.body.classList.add('dragging')
			e.preventDefault()
		})
		splitter.addEventListener('touchstart', function (e) {
			dragging = true
			document.body.classList.add('dragging')
		}, { passive: true })

		document.addEventListener('mousemove', move)
		document.addEventListener('touchmove', move, { passive: true })
		document.addEventListener('mouseup', stop)
		document.addEventListener('touchend', stop)

		// The splitter is reachable by keyboard, because a drag-only control
		// is unusable without a mouse.
		splitter.addEventListener('keydown', function (e) {
			var current = parseFloat(getComputedStyle(lesson).gridTemplateColumns) || 50
			if (e.key === 'ArrowLeft') {
				apply(current - 2)
				e.preventDefault()
			} else if (e.key === 'ArrowRight') {
				apply(current + 2)
				e.preventDefault()
			}
		})

		var saved = loadPref('split', null)
		apply(saved ? parseFloat(saved) : 50)

		// Crossing the breakpoint in either direction has to re-apply, because
		// the stacked layout is expressed in CSS and the split is inline.
		var onChange = function () { apply(parseFloat(loadPref('split', null)) || 50) }
		if (stacked.addEventListener) {
			stacked.addEventListener('change', onChange)
		} else if (stacked.addListener) {
			stacked.addListener(onChange)
		}
	}

	// -------------------------------------------------------------- language

	// The switcher is rendered by the server, because the veb template
	// compiler will not take a conditional inside a loop and each entry needs
	// one. All this does is open and close it, and keep it from staying open
	// when the table of contents opens.
	function initLang() {
		var button = document.getElementById('lang-toggle')
		var menu = document.getElementById('lang-menu')
		if (!button || !menu) return

		function setOpen(open) {
			menu.hidden = !open
			button.setAttribute('aria-expanded', open ? 'true' : 'false')
		}

		button.addEventListener('click', function (e) {
			e.stopPropagation()
			setOpen(menu.hidden)
		})

		document.addEventListener('click', function (e) {
			if (!menu.hidden && !menu.contains(e.target)) setOpen(false)
		})

		document.addEventListener('keydown', function (e) {
			if (e.key === 'Escape' && !menu.hidden) {
				setOpen(false)
				button.focus()
			}
		})

		setOpen(false)
	}

	// ------------------------------------------------------------------- help

	function initHelp() {		var button = document.getElementById('help-toggle')
		var panel = document.getElementById('help-panel')
		var overlay = document.getElementById('help-overlay')
		var close = document.getElementById('help-close')
		if (!button || !panel) return

		function setOpen(open) {
			panel.hidden = !open
			if (overlay) overlay.hidden = !open
			button.setAttribute('aria-expanded', open ? 'true' : 'false')
		}

		button.addEventListener('click', function () {
			setOpen(panel.hidden)
		})
		if (close) {
			close.addEventListener('click', function () {
				setOpen(false)
				button.focus()
			})
		}
		if (overlay) {
			overlay.addEventListener('click', function () {
				setOpen(false)
			})
		}

		document.addEventListener('keydown', function (e) {
			if (e.key === 'Escape' && !panel.hidden) {
				setOpen(false)
				button.focus()
				return
			}
			// `?` opens and closes the list, the way it works on the playground.
			// Typed characters are left alone, so only a bare `?` counts.
			var typing = e.target && (e.target.isContentEditable ||
				e.target.tagName === 'TEXTAREA' ||
				e.target.tagName === 'INPUT' ||
				(e.target.classList && e.target.classList.contains('CodeMirror')))
			if (!typing && e.key === '?') {
				setOpen(panel.hidden)
			}
		})

		setOpen(false)
	}

	// ------------------------------------------------- prose code highlighting

	// A code block in the prose should look like the editor, not like a wall of
	// grey. CodeMirror's `runMode` addon is the usual way to do that, but it is
	// not vendored here, and the whole of it is the loop below: push a token,
	// read past it, repeat.
	function escapeHTML(s) {
		return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
	}

	function highlightV(text) {
		if (typeof CodeMirror === 'undefined' || !CodeMirror.getMode) {
			return null
		}
		var mode = CodeMirror.getMode({ name: 'vlang' })
		if (!mode || typeof mode.token !== 'function') return null

		var state = CodeMirror.startState(mode)
		var out = ''
		var pos = 0
		var guard = 0

		while (pos < text.length && guard < 200000) {
			guard++
			var stream = new CodeMirror.StringStream(text, pos)
			// A blank line carries no token, so the mode is told to skip over it.
			stream.lineStart = 0
			var style = mode.token(stream, state) || null

			if (stream.current() === '' || stream.pos === pos) {
				// No progress means the mode cannot tokenise this position, which
				// happens with an unterminated string. Emit one character and
				// continue, so a broken block still renders its plain text.
				out += escapeHTML(text.charAt(pos))
				pos++
				continue
			}
			out += '<span class="cm-' + style + '">' +
				escapeHTML(text.slice(pos, stream.pos)) + '</span>'
			pos = stream.pos
		}
		if (pos < text.length) out += escapeHTML(text.slice(pos))
		return out
	}

	// Colour every `<pre><code>` in the page prose, once, and leave any that the
	// mode cannot handle as plain text.
	function initProseCode() {
		var blocks = document.querySelectorAll('.slide-content pre > code')
		if (!blocks.length) return
		for (var i = 0; i < blocks.length; i++) {
			var code = blocks[i]
			if (code.getAttribute('data-hl')) continue
			var text = code.textContent.replace(/\n$/, '')
			var html = highlightV(text)
			if (html === null) continue
			code.setAttribute('data-hl', '1')
			code.innerHTML = html
			// The theme classes live on the editor root, so a highlighted block
			// gets them too, otherwise the tokens are coloured by `.cm-*` rules
			// written against `.CodeMirror`.
			code.className = code.className ? code.className + ' CodeMirror cm-s-vlang' : 'CodeMirror cm-s-vlang'
		}
	}

	// ------------------------------------------------------------------ boot

	function boot() {
		initTheme()
		initToc()
		initLang()
		initHelp()
		initOutput()
		initPager()
		initSplitter()
		initProseCode()

		var el = document.getElementById('page-data')
		if (!el) return
		var data
		try {
			data = JSON.parse(el.textContent)
		} catch (e) {
			return
		}
		initLesson(data)
	}

	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', boot)
	} else {
		boot()
	}
})()