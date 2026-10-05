module main

import api
import json2
import content
import locale
import os
import runner
import strings
import tour
import veb

// port is where the server listens.
//
// Overridable so a second copy can be started alongside a running one, which is
// what makes it possible to check a build without taking the live instance down.
// The variable is read once at startup and nothing else changes it.
const default_port = 8080

// App is the veb application.
//
// `veb.StaticHandler` provides static file serving, which is mounted once at
// startup rather than per request.
pub struct App {
	veb.StaticHandler
mut:
	tour &tour.Tour
}

// Context is the per-request state.
//
// The tour needs no per-request state of its own, but the type has to exist:
// veb's routing is generic over it, and the compiler requires a handler to
// take a context parameter.
pub struct Context {
	veb.Context
}

// main starts the server.
//
// The isolation self-test runs before the listener opens. A tour that runs
// arbitrary submitted code is a remote code execution service, and the whole
// difference between that and a language tutorial is whether the sandbox
// holds. Rather than serve traffic and hope, the process checks and refuses.
//
// `--self-test-only` runs the check and exits, which is what the container
// build uses so an image whose sandbox does not work cannot be produced.
fn main() {
	runner.cleanup_all()

	self_test_only := os.args.any(it == '--self-test-only')

	if os.getenv('TOUR_SKIP_SELF_TEST') == '1' && !self_test_only {
		eprintln('[tour] warning: the sandbox self-test was skipped by')
		eprintln('[tour]          TOUR_SKIP_SELF_TEST=1. Do not do this in production.')
	} else {
		verdict := runner.self_test()
		for w in verdict.warnings {
			eprintln('[tour] warning: ${w}')
		}
		if !verdict.ok {
			eprintln('[tour] the sandbox did not contain a test program.')
			for f in verdict.fatal {
				eprintln('[tour]   ${f}')
			}
			eprintln('[tour] the sandbox needs the isolate binary, Linux namespaces, and')
			eprintln('[tour] the container described in docker-compose.yml. See README.md.')
			exit(1)
		}
		eprintln('[tour] sandbox self-test passed')
	}

	if self_test_only {
		return
	}

	mut app := &App{
		tour: tour.new_tour(content.modules())
	}
	app.handle_static('static', true) or { eprintln('[tour] static: ${err.msg()}') }

	veb.run[App, Context](mut app, listen_port())
}

// listen_port is the port to bind, from TOUR_PORT when it is set.
//
// A value that is not a number in range is ignored rather than fatal, so a typo
// in the environment falls back to the default instead of refusing to start.
fn listen_port() int {
	raw := os.getenv('TOUR_PORT')
	if raw == '' {
		return default_port
	}
	n := raw.int()
	if n > 0 && n < 65536 {
		return n
	}
	return default_port
}

// index sends a first time visitor to the first page of the tour.
@[get]
pub fn (mut app App) index(mut ctx Context) veb.Result {
	return ctx.redirect('/welcome/1', typ: .moved_permanently)
}

// list renders the table of contents.
@[get]
pub fn (mut app App) list(mut ctx Context) veb.Result {
	return render_list(mut ctx, app.tour, locale.default_locale)
}

// localized_list renders the table of contents in another language.
//
// Declared before `/:slug/:number` on purpose. veb matches routes in
// declaration order and the first match wins, and `/fa/list` has the same shape
// as a lesson page, so without this the list would be read as a lesson called
// `fa` with page number zero.
@['/:code/list'; get]
pub fn (mut app App) localized_list(mut ctx Context, code string) veb.Result {
	if !locale.known(code) {
		return ctx.not_found()
	}
	return render_list(mut ctx, app.tour, code)
}

// locale_root sends /fa to the first page in that language.
@['/:code'; get]
pub fn (mut app App) locale_root(mut ctx Context, code string) veb.Result {
	if !locale.known(code) || code == locale.default_locale {
		return ctx.not_found()
	}
	return ctx.redirect('/${code}/welcome/1')
}

// The API routes are literal paths and are declared before the one
// parameterised page route, so nothing shadows them.

// api_run compiles and runs a submitted program.
@['/api/run'; post]
pub fn (mut app App) api_run(mut ctx Context) veb.Result {
	return api.run(mut ctx.Context)
}

// api_format formats a submitted program.
@['/api/format'; post]
pub fn (mut app App) api_format(mut ctx Context) veb.Result {
	return api.format_code(mut ctx.Context)
}

// api_check_output runs a program and compares its output, for exercises.
@['/api/check_output'; post]
pub fn (mut app App) api_check_output(mut ctx Context) veb.Result {
	return api.check_output(mut ctx.Context)
}

// api_version reports the compiler version used by the sandbox.
@['/api/version'; post]
pub fn (mut app App) api_version(mut ctx Context) veb.Result {
	return api.version(mut ctx.Context)
}

// page renders one lesson page.
//
// The route is the one parameterised route in the application, and it is
// declared after every literal route on purpose: veb matches routes in
// declaration order and the first match wins, so a parameterised route
// declared earlier would shadow the literal ones beneath it.
//
// The names in the path are not read. veb binds the two URL segments to the
// two parameters after `ctx` by position, and the checker restricts those to
// string, integer or bool, which is why `number` arrives as an int.
@['/:slug/:number'; get]
pub fn (mut app App) page(mut ctx Context, slug string, number int) veb.Result {
	return render_page(mut ctx, app.tour, locale.default_locale, slug, number)
}

// localized_page renders one lesson page in another language.
//
// Three segments, so it cannot collide with the two segment English route.
@['/:code/:lesson/:number'; get]
pub fn (mut app App) localized_page(mut ctx Context, code string, lesson string, number int) veb.Result {
	if !locale.known(code) {
		return ctx.not_found()
	}
	return render_page(mut ctx, app.tour, code, lesson, number)
}

// render_list renders the table of contents in one language.
fn render_list(mut ctx Context, t &tour.Tour, loc string) veb.Result {
	title := locale.ui_string(loc, 'site_title')
	toc := build_toc(t, loc)
	veb_content := $tmpl('templates/list.html')
	return render_base(mut ctx, loc, title, toc, '/list', veb_content)
}

// render_page renders one lesson page in one language.
//
// The English and prefixed routes both land here, so a translated page cannot
// drift from the English one: there is one place that builds the view.
fn render_page(mut ctx Context, t &tour.Tour, loc string, slug string, number int) veb.Result {
	ref := t.resolve(slug, number) or { return ctx.not_found() }

	heading := page_title(loc, ref.lesson.slug, ref.number, ref.page.title)
	prose := page_body(loc, ref.lesson.slug, ref.number, ref.page.body)
	title := '${heading} - ${locale.ui_string(loc, 'site_title')}'
	toc := build_toc(t, loc)
	path := '/${slug}/${number}'

	example := ref.page.code or { content.Example{} }
	page_data := PageData{
		module_id: ref.module_id
		lesson:    ref.lesson.slug
		locale:    loc
		title:     heading
		number:    ref.number
		total:     ref.total
		body:      prose
		files:     view_files(example.files)
		solution:  view_files(example.solution)
		prev:      link_view(t.prev(ref), loc)
		next:      link_view(t.next(ref), loc)
	}
	page_json := embed_json(json2.encode(page_data))

	// The lesson template asks these questions itself; they are named here so
	// the conditions read as English at the point of use.
	has_code := page_data.files.len > 0
	has_solution := page_data.solution.len > 0
	has_files_tabs := page_data.files.len > 1
	// The toolbar sits above the editor, the way play.vlang.io puts its tools
	// above the editors and its terminal below them.
	has_tools := has_code
	// Format works: it formats in process, with the same formatter `v fmt` uses,
	// so there is nothing in a sandbox and nothing to build. See runner/format.v
	// for why that matters and what the risk is.
	has_format := has_code
	// Standard input is not offered yet. The field and the limit are in place, but
	// the sandbox has no working way to hand input to a program, so showing the
	// tab would promise something the run does not deliver. This is the one switch
	// to flip once the transport works. See the note on `runner.run`.
	has_stdin := false
	prev_page := link_view(t.prev(ref), loc)
	next_page := page_data.next
	has_prev := prev_page.slug != ''
	has_next := next_page.slug != ''

	// The lesson template needs the page chrome strings too, not just base.html.
	// veb resolves a template variable from the enclosing function at the point
	// the template is expanded, so these have to be in scope before $tmpl and
	// cannot simply be inherited from render_base.
	u := ui_for(loc)
	counter := counter_text(loc, ref.number, ref.total)
	lang_prefix := if loc == locale.default_locale { '' } else { '/' + loc }
	ui_run := u.run
	ui_format := u.format
	ui_reset := u.reset
	ui_solution := u.solution
	ui_output := u.output
	ui_prev := u.prev_page
	ui_next := u.next_page
	ui_resize := u.resize

	veb_content := $tmpl('templates/page.html')
	return render_base(mut ctx, loc, title, toc, path, veb_content)
}

// UiStrings is the interface text one request needs, already resolved for a
// locale.
//
// It is a struct rather than a map because veb resolves a template variable
// from the enclosing function, so the names have to be spelled out somewhere.
// One struct with one constructor keeps the page view and the shared chrome
// from drifting into showing two different languages.
struct UiStrings {
pub mut:
	site        string
	toc         string
	theme       string
	help        string
	help_close  string
	language    string
	run         string
	format      string
	reset       string
	solution    string
	output      string
	resize      string
	prev        string
	next        string
	run_program string
	next_page   string
	prev_page   string
	toggle_help string
	move_panes  string
	not_found   string
}

// ui_for resolves the interface catalogue for a locale.
fn ui_for(loc string) UiStrings {
	return UiStrings{
		site:        locale.ui_string(loc, 'site_title')
		toc:         locale.ui_string(loc, 'toc')
		theme:       locale.ui_string(loc, 'toggle_theme')
		help:        locale.ui_string(loc, 'help')
		help_close:  locale.ui_string(loc, 'help_close')
		language:    locale.ui_string(loc, 'language')
		run:         locale.ui_string(loc, 'run')
		format:      locale.ui_string(loc, 'format')
		reset:       locale.ui_string(loc, 'reset')
		solution:    locale.ui_string(loc, 'solution')
		output:      locale.ui_string(loc, 'output')
		resize:      locale.ui_string(loc, 'resize_panes')
		prev:        locale.ui_string(loc, 'previous')
		next:        locale.ui_string(loc, 'next')
		run_program: locale.ui_string(loc, 'run_program')
		next_page:   locale.ui_string(loc, 'next_page')
		prev_page:   locale.ui_string(loc, 'prev_page')
		toggle_help: locale.ui_string(loc, 'toggle_help')
		move_panes:  locale.ui_string(loc, 'move_panes')
		not_found:   locale.ui_string(loc, 'not_found_title')
	}
}

// counter_text renders the page counter for a locale.
//
// The catalogue stores `${number} / ${total}` so a translator can reorder it,
// which is why Persian can say "۱ از ۵" rather than "1 / 5". The placeholders are
// substituted rather than interpolated because V would have eaten a literal
// `${` when the catalogue was compiled, so the dollar sign is put back here.
fn counter_text(loc string, number int, total int) string {
	mut s := locale.ui_string(loc, 'page_of')
	s = s.replace('$' + '{number}', number.str())
	s = s.replace('$' + '{total}', total.str())
	return s
}

// render_base fills in everything base.html needs and returns it.
//
// base.html is shared by the lesson page, the table of contents and the 404, so
// the language, the direction and the interface strings are resolved once here
// rather than at each call site.
//
// The interface strings are passed to the template as named variables rather
// than as a map it indexes, because that is what the veb template compiler in
// this V version is reliable at. The whole catalogue still goes to the browser
// as a JSON island, since app.js needs the strings it builds at runtime.
fn render_base(mut ctx Context, loc string, title string, toc string, path string, veb_content string) veb.Result {
	lang := loc
	dir := locale.dir(loc)
	ui := locale.ui_map(loc)
	locales := locale_choices(loc, path)
	u := ui_for(loc)
	ui_site := u.site
	ui_toc := u.toc
	ui_theme := u.theme
	ui_help := u.help
	ui_help_close := u.help_close
	ui_run := u.run_program
	ui_next := u.next_page
	ui_prev := u.prev_page
	ui_toggle_help := u.toggle_help
	ui_panes := u.move_panes
	ui_language := u.language
	// The logo link needs the locale prefix inline in the template, which is
	// simpler than giving the template a path to prefix.
	lang_prefix := if loc == locale.default_locale { '' } else { '/' + loc }
	ui_json := embed_json(json2.encode(ui))
	return $veb.html('templates/base.html')
}

// locale_choices renders the language switcher.
//
// Built in V rather than in the template for the same reason the table of
// contents is: the veb template compiler will not take a conditional inside a
// loop, and each entry needs one.
//
// `path` is the page the visitor is on, without a locale prefix, so switching
// language keeps them where they were rather than dropping them on the front
// page.
fn locale_choices(current string, path string) string {
	mut sb := strings.new_builder(1024)
	sb.write_string('<div class="lang-menu" id="lang-menu" hidden role="menu">')
	for l in locale.locales {
		if l.code == current {
			sb.write_string('<a class="lang-item current" href="${locale.href(l.code, path)}" aria-current="true" lang="${l.code}" dir="${locale.dir(l.code)}">')
		} else {
			sb.write_string('<a class="lang-item" href="${locale.href(l.code, path)}" lang="${l.code}" dir="${locale.dir(l.code)}">')
		}
		sb.write_string('<span class="lang-native">${l.native}</span>')
		sb.write_string('<span class="lang-name">${l.name}</span>')
		sb.write_string('</a>')
	}
	sb.write_string('</div>')
	return sb.str()
}

// not_found renders the 404 page for an unmatched URL.
//
// It goes through render_base like every other page so that a 404 in Persian is
// still Persian, and still offers the language switcher. The tour is not
// reachable from a bare context, so the table of contents is left empty rather
// than guessed at.
pub fn (mut ctx Context) not_found() veb.Result {
	ctx.res.set_status(.not_found)
	title := 'Not found - A Tour of V'
	toc := ''
	veb_content := $tmpl('templates/not_found.html')
	return render_base(mut ctx, locale.default_locale, title, toc, '', veb_content)
}
