module runner

import strings

// Diagnostic is one compiler message, in the shape a code editor can use.
//
// The Go Tour marks the offending line in the editor by scraping
// `file:line:` out of the compiler's stderr. That is worth copying, but the
// scraping should happen on the server where it can be tested, rather than
// in the browser where it cannot.
pub struct Diagnostic {
	// Fields are mutable because parse_diagnostic fills them in as it reads.
pub mut:
	file   string // the file the compiler named, e.g. 'main.v'
	line   int    // 1-based; 0 when the compiler gave no position
	column int    // 1-based; 0 when the compiler gave no position
	level  string // 'error', 'warning', 'note', or '' when unrecognised
	text   string // the message itself, without the position prefix
	raw    string // the original line, verbatim
}

// parse_diagnostics pulls every `file:line:col: level: message` line out of
// compiler output.
//
// V reports positions in this shape:
//
//	main.v:3:4: error: `sum` is immutable, declare it with `mut`
//
// The position is not always present, and the level is not always one of the
// three words, so both are optional in the result rather than guessed at.
pub fn parse_diagnostics(output string) []Diagnostic {
	mut found := []Diagnostic{}
	for raw in output.split_into_lines() {
		d := parse_diagnostic(raw)
		if d.line > 0 || d.level != '' {
			found << d
		}
	}
	return found
}

// parse_diagnostic reads one line of compiler output.
//
// The split is done by hand rather than with a regular expression because V
// messages routinely contain colons of their own, including inside `[...]`
// notes, so the first four colons are the position and everything after the
// fourth belongs to the message.
pub fn parse_diagnostic(raw string) Diagnostic {
	line := raw.trim_space()
	mut d := Diagnostic{
		file:   ''
		line:   0
		column: 0
		level:  ''
		text:   line
		raw:    raw
	}

	parts := line.split(':')
	if parts.len < 3 {
		return d
	}

	file := parts[0].trim_space()
	ln := parts[1].trim_space().int()
	if ln <= 0 {
		return d
	}
	// A file path with no extension is far more likely to be prose that
	// happens to contain a number than a compiler position.
	if !file.contains('.') {
		return d
	}

	d.file = file
	d.line = ln

	if parts.len >= 4 {
		col := parts[2].trim_space().int()
		if col > 0 {
			d.column = col
		}
	}

	// A diagnostic is `file:line:column: level: message`. With fewer parts
	// than the full five there may be no level and no message, so the tail is
	// taken from part three onwards and split again.
	skip := if parts.len < 3 { parts.len } else { 3 }
	rest := parts[skip..].join(':').trim_space()
	if rest == '' {
		return d
	}

	// `rest` is either `level: message` or just `message`.
	seg := rest.split(':')
	first := seg[0].trim_space()
	if first in ['error', 'warning', 'note', 'fatal', 'help'] && seg.len > 1 {
		d.level = first
		d.text = seg[1..].join(':').trim_space()
	}
	return d
}

// first_error_line returns the line number of the first error, or 0.
//
// The editor highlights one line, so when a program produces several
// diagnostics the first error is the one worth marking: the rest are usually
// consequences of it.
pub fn first_error_line(diags []Diagnostic) int {
	for diag in diags {
		if diag.line > 0 && (diag.level == 'error' || diag.level == 'fatal' || diag.level == '') {
			return diag.line
		}
	}
	return 0
}

// strip_ansi removes ANSI escape sequences from a blob of output.
//
// A submitted program may print coloured text, and a compiler error may carry
// a highlighted source excerpt. Neither reads well in a plain text pane: the
// reader would see ` [ 3 1 m` rather than a colour. Rendering colour in the
// output pane would mean inserting markup built from program output, which is
// not worth the risk for a tutorial, so the sequences are removed here instead.
//
// Only CSI sequences are handled, which covers colour, cursor movement and
// erase. A lone ESC that is not followed by `[` is dropped, since there is
// nothing sensible to show for it.
pub fn strip_ansi(text string) string {
	mut out := strings.new_builder(text.len)
	mut i := 0
	for i < text.len {
		if text[i] != esc {
			out.write_u8(text[i])
			i++
			continue
		}
		if i + 1 >= text.len || text[i + 1] != csi_intro {
			// A trailing ESC, or one introducing something other than a CSI.
			i++
			continue
		}
		// Skip the parameter and intermediate bytes, then the final byte that
		// ends the sequence. A CSI sequence ends at the first byte in the
		// range `@` to `~`, so continue while the byte is outside it.
		mut j := i + 2
		for j < text.len && (text[j] < csi_final_first || text[j] > csi_final_last) {
			j++
		}
		i = if j < text.len { j + 1 } else { j }
	}
	return out.str()
}

// esc, csi_intro and the CSI final byte range, spelled out rather than
// written as escapes so the intent is readable.
const esc = u8(27)
const csi_intro = u8(`[`)
const csi_final_first = u8(`@`)
const csi_final_last = u8(`~`)

// prettify bounds a captured output blob.
//
// Two bounds, because each catches a case the other misses: a single very
// long line, and a great many short ones. Truncation is marked so a learner
// can tell the difference between a program that printed that and a program
// whose output was cut short.
pub fn prettify(output string) string {
	mut pretty := strip_ansi(output).trim_right('\n')

	if pretty.len > max_output_bytes {
		pretty = pretty[..max_output_bytes - 3] + '...'
	}

	nlines := pretty.count('\n')
	if nlines > max_output_lines {
		pretty = pretty.split_into_lines()[..max_output_lines].join('\n')
		pretty += '\n...and ${nlines - max_output_lines} more lines'
	}
	return pretty
}

// strip_isolate_status removes isolate's own trailing status line.
//
// isolate reports its own timing on the last line of the captured output:
// `OK (0.033 sec real, 0.219 sec wall)`, or `Failed command: ./main` when the
// program could not be started. That is meaningful to an operator and noise
// to a learner.
//
// The match is on isolate's exact shape rather than on a bare `OK (` prefix,
// because a learner program is free to print a line beginning with `OK (` and
// a shorter test would delete real output.
pub fn strip_isolate_status(output string) string {
	mut lines := output.split_into_lines()
	// split_into_lines drops a trailing newline, so output that is a single
	// empty line yields one empty element rather than none.
	if lines.len == 0 {
		return output
	}
	if is_isolate_status(lines[lines.len - 1]) {
		lines = lines[..lines.len - 1]
	}
	return lines.join('\n')
}

// is_isolate_status reports whether a line is isolate's own bookkeeping.
fn is_isolate_status(line string) bool {
	if line.starts_with('OK (') && line.ends_with(')') {
		return line.contains(' sec real') || line.contains(' sec wall')
	}
	return line.starts_with('Failed command: ')
}
