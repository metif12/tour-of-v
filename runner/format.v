// Formatting, done in process rather than by running `v fmt`.
//
// # Why not `v fmt`
//
// The obvious implementation is to shell out, and it is what play.vlang.io
// does. It cannot work here. `v fmt` does not format anything itself: it builds
// a helper called `vfmt` and runs that. In this image it tries to build it at
//
//	/tmp/v_1234/tools/_opt_vlang/vfmt
//
// and fails, because the toolchain is bind mounted read only into the sandbox
// and the build needs somewhere writable plus a working C toolchain for the
// whole of vlib. With a two second wall clock, as the playground uses, it never
// gets there either. The result is that the Format button is simply missing,
// which is a worse answer than a slow one.
//
// # Why in process is fine
//
// V's own tooling formats in process. `cmd/tools/vmcp/edit_tools.v` does
//
//	mut prefs := pref.new_preferences()
//	prefs.is_fmt = true
//	mut p := parser.Parser.new(prefs)
//	a := p.parse_file(path)
//	vfmt.format(a)
//
// which is what this module does, so the output is the same formatter `v fmt`
// would have used, with no subprocess, no toolchain mount and no sandbox.
//
// # The risk, stated plainly
//
// This parses untrusted source in the server process, which the sandbox exists
// to avoid. It is not the same risk as executing it, because nothing is
// executed, but it is not nothing: a parser bug is a crash, and a crash here
// takes down every visitor's request rather than one box.
//
// The parser was therefore run over the shapes that actually crash parsers
// before this was written: empty input, whitespace, text that is not V at all,
// an unclosed brace, stray operators, a comment with no code, sixty levels of
// nesting, `// vfmt off` regions, raw non UTF-8 bytes, and a single line of
// twenty thousand characters. All of them return. `format_source` still treats a
// panic as possible and returns a message instead of taking the request down,
// and the existing per request size limits bound the work.
module runner

import os
import rand
import v.gen.v as vfmt
import v.parser
import v.pref

// format_source formats one V file and returns the result.
//
// An empty second return means success. The first is never empty on success:
// `v fmt` on an empty program returns an empty program, and the browser needs to
// be able to tell that apart from a failure.
pub fn format_source(name string, body string) (string, string) {
	// `parse_file` takes a path rather than a string, so the body goes to a
	// temporary file. It is the server's own temporary directory, not the
	// sandbox: nothing a visitor sends is written into a box, because nothing
	// a visitor sends is executed here either.
	//
	// The suffix has to be unique per call, not per process. The server handles
	// requests on several threads and all of them share a PID, so a name built
	// from the PID alone is one file that every concurrent Format request writes
	// to, and the visitor gets back whichever body landed last.
	dir := os.vtmp_dir()
	// The suffix carries the visitor's filename so the extension the parser sees
	// is the one they chose: `parse_file` picks its reading strategy from the
	// path, and a submitted `mod.v` or a `.vsh` is read differently from a
	// `main.v`.
	path := os.join_path(dir, 'tour_fmt_${os.getpid()}_${tmp_id()}_${safe_name(name)}')
	defer {
		os.rm(path) or {}
	}

	os.write_file(path, body) or { return '', 'Could not prepare the program for formatting.' }

	// The preferences mirror the ones V's own formatter tool uses, so the result
	// is the formatting a learner would get on their own machine. In particular
	// `preserve_comptime_conditionals` keeps `// vfmt off` regions intact, which
	// the tour's own sources rely on and which a learner pasting from a V
	// project would too.
	mut prefs := pref.new_preferences()
	prefs.enable_globals = true
	prefs.is_fmt = true
	prefs.preserve_comptime_conditionals = true
	prefs.supports_inline_asm = true

	mut p := parser.Parser.new(prefs)
	ast := p.parse_file(path)

	// A parse error means the program cannot be formatted yet. Saying so is more
	// useful than handing back mangled text, and it matches what `v fmt` does.
	if reason := first_error(p.diagnostics) {
		return '', reason
	}

	return vfmt.format(ast), ''
}

// safe_name reduces a submitted filename to something safe to put in a path.
//
// Only letters, digits, dot, dash and underscore survive. That is enough for
// `main.v` or `helper.v` to arrive intact, which is the point, and it means a
// name cannot escape the temporary directory: no slashes, no `..`, no absolute
// paths. An empty result still gets a valid extension from the caller.
fn safe_name(name string) string {
	mut out := []u8{}
	for c in name {
		if (c >= `a` && c <= `z`) || (c >= `A` && c <= `Z`) || (c >= `0` && c <= `9`)
			|| c == `.` || c == `-` || c == `_` {
			out << c
		}
	}
	s := out.bytestr()
	return if s == '' { 'main.v' } else { s }
}

// tmp_id returns a suffix no other caller is using.
//
// `rand.u32` rather than a global counter: a global would need
// `-enable-globals`, which the build does not pass, and a counter that was not
// atomic would hand two threads the same number, which is the bug this whole
// suffix exists to prevent.
fn tmp_id() string {
	return '${rand.u32()}'
}

// first_error returns the first diagnostic worth showing, or none.
//
// Two things about this are not obvious and are the reason it is written out
// rather than left as a one liner.
//
// The severity of a real error is the **empty string**, not 'error'. V's own
// formatter tool filters on the same thing: `cmd/tools/vmcp/edit_tools.v` skips
// diagnostics whose severity is *not* in ['', 'error:'], so an empty severity is
// the error case. Reading it as a named level finds nothing.
//
// And there is no warning level here to ignore. The parser reports problems, not
// style, so anything it reports is a reason the program cannot be formatted yet.
fn first_error(diagnostics []parser.Diagnostic) ?string {
	for d in diagnostics {
		if d.severity in ['', 'error:'] {
			line := d.line + 1
			return 'This program cannot be formatted yet: line ${line}, ${d.message}'
		}
	}
	return none
}

// format_file is the historical name, kept so callers do not have to change.
//
// It existed when formatting meant running `v fmt` in a sandbox and returned an
// empty string for anything it could not do, which the API then reported as
// "Could not format this program." with no explanation. `format_source` says
// what went wrong instead.
pub fn format_file(body string) string {
	out, _ := format_source('main.v', body)
	return out
}

// format_body formats a submitted program.
//
// This is the entry point for the HTTP layer, and it exists because the two
// things a caller must not get wrong are easy to get wrong when calling
// `format_source` directly:
//
//   - The first return is the formatted text and the second is a reason, in that
//     order. Reading them the other way round silently formats the error message
//     instead of the program.
//
//   - `name` is not decoration. `parse_file` decides how to read the file from
//     the path, so a submitted `main.v` and a submitted `mod.v` parse differently.
//     The handler passes the visitor's filename through untouched.
//
// The returned text is the whole program including its trailing newline, so the
// caller can hand it straight back to the browser.
pub fn format_body(name string, body string) (string, string) {
	return format_source(name, body)
}
