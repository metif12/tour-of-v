module api

import net.http
import veb

// submitted_file and too_big read the live request off veb.Context, so these
// tests build one by hand. That works because `form` and `req` are both
// `pub mut` on veb.Context, and the size check travels on req.header, which
// http.Header exposes through set/get.
fn ctx_with(form map[string]string, content_length string) &veb.Context {
	mut ctx := &veb.Context{
		form: form
		req:  http.Request{
			header: http.new_header()
		}
	}
	if content_length != '' {
		ctx.req.header.set(.content_length, content_length)
	}
	return ctx
}

// No filename key means the browser sent a bare snippet, which always lands
// in main.v.
fn test_submitted_file_defaults_to_main_v() {
	f := submitted_file(ctx_with({
		'code': 'fn main() {}'
	}, ''))
	assert f.name == 'main.v'
	assert f.body == 'fn main() {}'
}

// Only the base name is honoured, so a unix path cannot pick the output path.
fn test_submitted_file_strips_unix_directories() {
	ctx := ctx_with({
		'code':     'x'
		'filename': 'a/b/main.v'
	}, '')
	assert submitted_file(ctx).name == 'main.v'
}

// Same rule for a Windows-style path, which a browser file input can send.
fn test_submitted_file_strips_windows_directories() {
	ctx := ctx_with({
		'code':     'x'
		'filename': 'a\\b\\x.v'
	}, '')
	assert submitted_file(ctx).name == 'x.v'
}

// An explicitly empty filename carries no name, so it is main.v too.
fn test_submitted_file_treats_empty_filename_as_missing() {
	ctx := ctx_with({
		'code':     'x'
		'filename': ''
	}, '')
	assert submitted_file(ctx).name == 'main.v'
}

// A trailing separator leaves nothing after it, which is also main.v.
fn test_submitted_file_treats_trailing_separator_as_missing() {
	ctx := ctx_with({
		'code':     'x'
		'filename': 'a/b/'
	}, '')
	assert submitted_file(ctx).name == 'main.v'
}

// The body is whatever came in `code`, and '' when the browser sent none.
fn test_submitted_file_body_comes_from_code() {
	assert submitted_file(ctx_with({
		'code': 'hello'
	}, '')).body == 'hello'
	assert submitted_file(ctx_with(map[string]string{}, '')).body == ''
}

// No content-length header means no body was sent, which is never too big.
fn test_too_big_allows_a_missing_header() {
	assert too_big(ctx_with(map[string]string{}, '')) == none
}

// A small body passes through to the handlers.
fn test_too_big_allows_a_body_under_the_limit() {
	assert too_big(ctx_with(map[string]string{}, '100')) == none
}

// The boundary is exclusive: exactly max_body_bytes still passes.
fn test_too_big_allows_exactly_the_limit() {
	assert too_big(ctx_with(map[string]string{}, max_body_bytes.str())) == none
}

// One byte over the limit is rejected before the body is parsed.
fn test_too_big_rejects_one_byte_over_the_limit() {
	if reason := too_big(ctx_with(map[string]string{}, (max_body_bytes + 1).str())) {
		assert reason == 'That request is too large.'
	} else {
		assert false, 'expected max_body_bytes + 1 to be rejected'
	}
}

// A wildly oversized length is rejected the same way, not just the edge.
fn test_too_big_rejects_a_huge_body() {
	if reason := too_big(ctx_with(map[string]string{}, '999999999')) {
		assert reason == 'That request is too large.'
	} else {
		assert false, 'expected a huge content-length to be rejected'
	}
}
