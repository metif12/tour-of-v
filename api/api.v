// Module `api` implements the JSON endpoints the browser talks to.
//
// These are plain functions rather than veb handlers because the routing
// table lives in main.v, next to the page routes, where the whole URL space
// can be read at once.
//
// The response shapes follow play.vlang.io, so the client code and the
// expectations of anyone who has used the V playground line up.
module api

import runner
import veb

// max_body_bytes is the largest request body the API will look at.
//
// veb enforces no request body limit of its own. The snippet limits in
// `runner` are the real defence, but reading a 500 MB body into a map before
// rejecting it is not, so the size is checked from the header first.
const max_body_bytes = 256 * 1024

// RunResponse is what POST /api/run returns.
//
// The Go field names are snake_case because V requires it; the `json` tags
// restore the camelCase wire format that play.vlang.io uses, so the browser
// client is interchangeable with the official playground's.
pub struct RunResponse {
pub:
	output    string @[json: 'output']
	build_out string @[json: 'buildOutput']
	error     string @[json: 'error']
	// diag_line is a 1-based line in the submitted file, or 0. The editor
	// uses it to mark the line the compiler complained about, the way the Go
	// Tour does.
	diag_line int    @[json: 'diagLine']
	diag_text string @[json: 'diagText']
	ran       bool   @[json: 'ran']
	limited   bool   @[json: 'limited']
}

// FormatResponse is what POST /api/format returns.
pub struct FormatResponse {
pub:
	body  string @[json: 'body']
	error string @[json: 'error']
}

// CheckResponse is what POST /api/check_output returns.
//
// The upstream V playground exposes the same endpoint and its shipped
// frontend never calls it. It is here so an exercise page can ask whether a
// learner's output matches what the page expects.
pub struct CheckResponse {
pub:
	output   string @[json: 'output']
	is_equal bool   @[json: 'isEqual']
	expected string @[json: 'expected']
	error    string @[json: 'error']
}

// VersionResponse is what POST /api/version returns.
pub struct VersionResponse {
pub:
	version string @[json: 'version']
	error   string @[json: 'error']
}

// run compiles and runs the submitted program.
pub fn run(mut ctx veb.Context) veb.Result {
	if reason := too_big(&ctx) {
		return ctx.json(RunResponse{
			error: reason
		})
	}

	mut files := [submitted_file(&ctx)]
	stdin := ctx.form['stdin'] or { '' }
	res := runner.run(files, stdin)
	return ctx.json(RunResponse{
		output:    res.output
		build_out: res.build_out
		error:     res.error
		diag_line: res.diag_line
		diag_text: res.diag_text
		ran:       res.ran
		limited:   res.hit_limits
	})
}

// format_code formats a submitted program.
pub fn format_code(mut ctx veb.Context) veb.Result {
	if reason := too_big(&ctx) {
		return ctx.json(FormatResponse{
			error: reason
		})
	}

	submitted := submitted_file(&ctx)
	formatted, reason := runner.format_body(submitted.name, submitted.body)
	if reason != '' {
		return ctx.json(FormatResponse{
			body:  submitted.body
			error: reason
		})
	}
	// An empty result is legitimate: an empty program formats to an empty
	// program, and so does one the formatter reduced to nothing. The browser
	// keeps what it already had when `body` is empty, so this is not a failure
	// and must not be reported as one.
	return ctx.json(FormatResponse{
		body: formatted
	})
}

// check_output runs a program and compares its output to an expected string,
// so an exercise page can mark itself.
pub fn check_output(mut ctx veb.Context) veb.Result {
	if reason := too_big(&ctx) {
		return ctx.json(CheckResponse{
			error: reason
		})
	}

	expected := ctx.form['expected'] or { '' }
	stdin := ctx.form['stdin'] or { '' }
	res := runner.run([submitted_file(&ctx)], stdin)
	return ctx.json(CheckResponse{
		output:   res.output
		is_equal: res.error == '' && res.output.trim_space() == expected.trim_space()
		expected: expected
		error:    res.error
	})
}

// version reports the compiler the sandbox will use.
//
// Useful when a lesson mentions a version specific feature, and when
// diagnosing "it compiles on my machine".
pub fn version(mut ctx veb.Context) veb.Result {
	v := runner.compiler_version()
	return ctx.json(VersionResponse{
		version: v
		error:   if v == '' { 'The sandbox has no compiler available.' } else { '' }
	})
}

// submitted_file turns a browser submission into a runner.SourceFile.
//
// The browser sends `code`, and optionally `filename`. Only the base name is
// honoured; anything containing a path is reduced to its last segment, and
// `runner.validate` then has the final say.
fn submitted_file(ctx &veb.Context) runner.SourceFile {
	mut name := ctx.form['filename'] or { 'main.v' }
	if name.contains('/') {
		name = name.all_after_last('/')
	}
	if name.contains('\\') {
		name = name.all_after_last('\\')
	}
	if name == '' {
		name = 'main.v'
	}
	return runner.SourceFile{
		name: name
		body: ctx.form['code'] or { '' }
	}
}

// too_big rejects an oversized request before its body is parsed.
fn too_big(ctx &veb.Context) ?string {
	length := (ctx.get_header(.content_length) or { '0' }).int()
	if length > max_body_bytes {
		return 'That request is too large.'
	}
	return none
}
