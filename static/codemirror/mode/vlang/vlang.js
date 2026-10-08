// CodeMirror 5 mode for the V programming language.
//
// Written for this project rather than pulled from a CDN, so the tour has no
// runtime dependency on a third party host and works offline.
//
// The keyword list is taken from the compiler's own token table
// (vlib/v/token/token.v) rather than from prose documentation, because that is
// the list the compiler will actually accept. Two consequences are visible
// here: `defer` is a keyword, and so are `lock`, `rlock` and `shared`.
//
// CodeMirror's contract is that `token` must advance the stream by at least
// one character on every call, and it throws "Mode vlang failed to advance
// stream" if it does not. That makes the end-of-input case the one that
// matters: `StringStream.next()` returns undefined there instead of a
// character, and every test below is written so that undefined cannot be
// mistaken for a letter. A regex like /[A-Za-z]/ applied to undefined would
// match the string "undefined" and send the mode into a loop at the end of
// every document.

(function (mod) {
	if (typeof exports === 'object' && typeof module === 'object') {
		// CommonJS, for tests.
		mod(require('../../lib/codemirror'))
	} else if (typeof define === 'function' && define.amd) {
		define(['../../lib/codemirror'], mod)
	} else {
		// Plain browser global.
		mod(CodeMirror)
	}
})(function (CodeMirror) {
	'use strict'

	// V's keywords, from the compiler's token table.
	var KEYWORDS = [
		'as', 'asm', 'assert', 'atomic', 'break', 'const', 'continue', 'defer',
		'dump', 'else', 'enum', 'false', 'fn', 'for', 'go', 'goto', 'if',
		'import', 'in', 'interface', 'is', 'lock', 'match', 'module', 'mut',
		'nil', 'none', 'or', 'pub', 'return', 'rlock', 'select', 'shared',
		'sizeof', 'spawn', 'static', 'struct', 'true', 'type', 'typeof',
		'union', 'unsafe', 'volatile',
		// Spelled like a word, read like a word.
		'__global', '_likely_', '_unlikely_', 'offsetof', 'isreftype'
	]

	// Type names, and the type syntax that reads as punctuation. Checked
	// against the primitive types in doc/docs.md and against the compiler:
	// there is no `long`, `size_t` or `byte`, and `int` is the platform
	// width rather than a fixed 32 bits.
	var TYPES = ['bool', 'string', 'rune', 'i8', 'i16', 'i32', 'i64',
		'i128', 'u8', 'u16', 'u32', 'u64', 'u128', 'int',
		'isize', 'usize', 'f32', 'f64', 'voidptr', 'any', 'map', 'array', 'chan',
		'thread', 'ptr']

	// Standard library functions that read like language constructs.
	var BUILTINS = ['println', 'print', 'eprintln', 'eprint', 'panic',
		'dump', 'typeof', 'sizeof', 'offsetof', 'string', 'rune', 'it', 'err',
		'error', 'assert']

	// Single character delimiters, matched by index rather than by a
	// character class so that undefined can never reach a test.
	var DELIMS = '()[]{}<>'
	var OPERATORS = '=+-*%!&|^~?:;,.@$#/'

	function isDigit(c) {
		return c >= '0' && c <= '9'
	}

	function isAlpha(c) {
		return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c === '_' ||
			c === '$'
	}

	function isAlnum(c) {
		return isAlpha(c) || isDigit(c)
	}

	function wordStyle(word) {
		if (word === 'true' || word === 'false' || word === 'none' ||
			word === 'nil') {
			return 'atom'
		}
		if (KEYWORDS.indexOf(word) > -1) return 'keyword'
		if (TYPES.indexOf(word) > -1) return 'type'
		if (BUILTINS.indexOf(word) > -1) return 'builtin'
		return null
	}

	CodeMirror.defineMode('vlang', function () {
		return {
			startState: function () {
				return { blockComment: false, inString: null }
			},

			copyState: function (state) {
				return {
					blockComment: state.blockComment,
					inString: state.inString
				}
			},

			// token reads as much as it can from `stream` and returns a style.
			// Every path below either consumes a character itself or delegates
			// to something that does.
			token: function (stream, state) {
				// Nothing left on this line. The caller stops at eol, so this
				// is belt and braces, but returning here keeps the advance
				// guarantee unconditional.
				if (stream.eol()) {
					stream.next()
					return null
				}

				// Inside a block comment that started on an earlier line.
				if (state.blockComment) {
					if (stream.match('*/')) {
						state.blockComment = false
					} else {
						stream.skipToEnd()
					}
					return 'comment'
				}

				// Continuation of a string that started on an earlier line.
				if (state.inString) {
					var openQuote = state.inString
					var closed = false
					while (!stream.eol()) {
						var s = stream.next()
						if (s === '\\') {
							// Skip the escaped character, whatever it is.
							if (!stream.eol()) stream.next()
							continue
						}
						if (s === openQuote) {
							closed = true
							break
						}
					}
					if (closed) state.inString = null
					return closed ? 'string' : 'string'
				}

				var ch = stream.next()

				// Line comment.
				if (ch === '/' && stream.peek() === '/') {
					stream.skipToEnd()
					return 'comment'
				}

				// Block comment.
				if (ch === '/' && stream.peek() === '*') {
					stream.next()
					if (stream.match('*')) {
						state.blockComment = true
						return 'comment'
					}
					// `/*` not followed by another `*` is not an opener.
					return 'operator'
				}

				// Division, or the start of a comment handled above.
				if (ch === '/') return 'operator'

				// Rune literal: one character, or an escape, in backticks.
				if (ch === '`') {
					var runeBody = stream.eatWhile(/[^`]/)
					if (!stream.eol()) stream.next()
					return 'string-2'
				}

				// String literals.
				if (ch === "'" || ch === '"') {
					var closedHere = false
					while (!stream.eol()) {
						var c = stream.next()
						if (c === '\\') {
							if (!stream.eol()) stream.next()
							continue
						}
						if (c === ch) {
							closedHere = true
							break
						}
					}
					if (closedHere) return 'string'
					// Unterminated: carry the quote to the next line rather than
					// colouring the rest of the file as ordinary code.
					state.inString = ch
					return 'error'
				}

				if (ch === ' ' || ch === '\t') return null

				// Numbers, including the `0x`, `0o`, `0b` and `1_000` forms V
				// accepts and the `42i64` style type suffix.
				if (isDigit(ch) || (ch === '.' && isDigit(stream.peek()))) {
					if (ch === '.') stream.next()
					stream.eatWhile(/[0-9a-fA-FxXoObB_.]/)
					// An exponent carries a sign, which the set above excludes.
					if (stream.match(/[eE][+-]?[0-9]?/)) {
						stream.eatWhile(/[0-9]/)
					}
					stream.match(/^(i8|i16|i32|i64|i128|u8|u16|u32|u64|u128|f32|f64)/)
					return 'number'
				}

				// Identifiers and keywords. The first character has already been
				// consumed, so the word is seeded with it rather than rewinding.
				if (isAlpha(ch)) {
					var word = ch
					while (!stream.eol() && isAlnum(stream.peek())) {
						word += stream.next()
					}

					// `label:` is a label or a map key, even when it spells a
					// keyword.
					if (stream.peek() === ':') return 'variable-2'

					var style = wordStyle(word)
					if (style) return style

					// V capitalises types and constants by convention.
					if (ch >= 'A' && ch <= 'Z') return 'variable-2'

					return 'variable'
				}

				if (DELIMS.indexOf(ch) > -1) return 'bracket'
				if (OPERATORS.indexOf(ch) > -1) return 'operator'

				// Anything else, including the multi character type syntax
				// such as `[]int` and `!int`, which the bracket and operator
				// rules above already cover character by character.
				return null
			},

			lineComment: '//',
			blockCommentStart: '/*',
			blockCommentEnd: '*/',

			indent: function (text, state) {
				var unit = state.indentUnit || 4
				var depth = 0
				for (var i = 0; i < text.length; i++) {
					if (text[i] === '{') depth++
					else if (text[i] === '}') depth--
				}
				if (depth > 0) return unit
				var trimmed = text.trim()
				if (trimmed.length && trimmed[trimmed.length - 1] === '{') return unit
				return 0
			}
		}
	})

	CodeMirror.defineMIME('text/x-vlang', 'vlang')
	CodeMirror.defineMIME('application/x-vlang', 'vlang')
})