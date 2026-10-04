module main

import api
import json2
import content
import os
import runner
import tour
import veb

const port = 8080

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

	veb.run[App, Context](mut app, port)
}

// index sends a first time visitor to the first page of the tour.
@[get]
pub fn (mut app App) index(mut ctx Context) veb.Result {
	return ctx.redirect('/welcome/1', typ: .moved_permanently)
}

// list renders the table of contents.
@[get]
pub fn (mut app App) list(mut ctx Context) veb.Result {
	title := 'A Tour of V'
	toc := build_toc(app.tour)
	veb_content := $tmpl('templates/list.html')
	return $veb.html('templates/base.html')
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
	ref := app.tour.resolve(slug, number) or { return ctx.not_found() }

	title := '${ref.page.title} - A Tour of V'
	toc := build_toc(app.tour)

	example := ref.page.code or { content.Example{} }
	page_data := PageData{
		module_id: ref.module_id
		lesson:    ref.lesson.slug
		title:     ref.page.title
		number:    ref.number
		total:     ref.total
		body:      ref.page.body
		files:     view_files(example.files)
		solution:  view_files(example.solution)
		prev:      view_link(app.tour.prev(ref))
		next:      view_link(app.tour.next(ref))
	}
	page_json := embed_json(json2.encode(page_data))

	// The lesson template asks these questions itself; they are named here so
	// the conditions read as English at the point of use.
	has_code := page_data.files.len > 0
	has_solution := page_data.solution.len > 0
	has_files_tabs := page_data.files.len > 1
	prev_page := page_data.prev
	next_page := page_data.next
	has_prev := prev_page.slug != ''
	has_next := next_page.slug != ''

	veb_content := $tmpl('templates/page.html')
	return $veb.html('templates/base.html')
}

// not_found renders the 404 page for an unmatched URL.
pub fn (mut ctx Context) not_found() veb.Result {
	ctx.res.set_status(.not_found)
	title := 'Not found - A Tour of V'
	toc := ''
	veb_content := $tmpl('templates/not_found.html')
	return $veb.html('templates/base.html')
}
