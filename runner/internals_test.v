module runner

import os

// A plain lesson file must pass: the allowlist exists to stop traversal, not
// to stop normal submissions from building.
fn test_is_safe_name_accepts_ordinary_names() {
	assert is_safe_name('main.v')
	assert is_safe_name('a-b_c.v')
}

// An empty name would join to the box directory itself, so it is rejected
// rather than resolved to a default.
fn test_is_safe_name_rejects_empty() {
	assert !is_safe_name('')
}

// The 64-character bound keeps names usable as box paths and log fields,
// so anything longer is rejected outright rather than truncated.
fn test_is_safe_name_rejects_overlong() {
	assert !is_safe_name('a'.repeat(63) + '.v')
}

// The compiler only builds `.v` files, so anything else cannot be a build
// input and is rejected before it reaches the box.
fn test_is_safe_name_rejects_missing_v_suffix() {
	assert !is_safe_name('main')
	assert !is_safe_name('main.txt')
}

// A leading dot would create a hidden file the operator cannot see when
// listing a box, so dotfiles are rejected.
fn test_is_safe_name_rejects_hidden_files() {
	assert !is_safe_name('.main.v')
}

// A slash would turn one name into a path, which is how a submission escapes
// the directory it was given, so separators are rejected.
fn test_is_safe_name_rejects_slash() {
	assert !is_safe_name('a/b.v')
}

// Backslash is a separator on the host toolchain even though the box is
// Linux, so it is rejected for the same reason as a slash.
fn test_is_safe_name_rejects_backslash() {
	assert !is_safe_name('a\\b.v')
}

// `..` climbs out of the box directory, so a name that is only dots cannot
// be allowed through even though it looks harmless.
fn test_is_safe_name_rejects_parent_reference() {
	assert !is_safe_name('..')
	assert !is_safe_name('../a.v')
}

// Spaces split an argv array back into a shell string wherever one leaks in,
// so names are limited to characters that survive joining and splitting.
fn test_is_safe_name_rejects_spaces() {
	assert !is_safe_name('a b.v')
}

// isolate reports a throttled process as exit 1 with a recognisable message,
// so that pairing is what marks a run as limited.
fn test_hit_resource_limit_matches_unavailable() {
	res := os.Result{
		exit_code: 1
		output:    'go sync__pool__process_in_thread(): Resource temporarily unavailable'
	}
	assert hit_resource_limit(res)
}

// The OOM killer leaves this wording rather than a distinct exit code, so it
// is matched as text rather than inferred from the status.
fn test_hit_resource_limit_matches_out_of_memory() {
	res := os.Result{
		exit_code: 1
		output:    'Out of Memory: the program was killed'
	}
	assert hit_resource_limit(res)
}

// A SIGKILL from the cgroup looks like an ordinary crash by exit code alone,
// so the marker is what separates a limit from a panic.
fn test_hit_resource_limit_matches_sigkill() {
	res := os.Result{
		exit_code: 1
		output:    'killed by SIGKILL after exceeding memory'
	}
	assert hit_resource_limit(res)
}

// The exit code gates the match: a clean run that happens to print one of the
// marker words is still a clean run.
fn test_hit_resource_limit_ignores_a_clean_exit() {
	res := os.Result{
		exit_code: 0
		output:    'Resource temporarily unavailable'
	}
	assert !hit_resource_limit(res)
}

// An ordinary panic also exits non-zero, so exit 1 alone without a marker
// must not read as a limit.
fn test_hit_resource_limit_ignores_an_ordinary_failure() {
	res := os.Result{
		exit_code: 1
		output:    'V panic: array index out of bounds'
	}
	assert !hit_resource_limit(res)
}

// Other exit codes belong to the compiler or the shell, not to the limiter,
// so markers under them are coincidental text rather than a verdict.
fn test_hit_resource_limit_ignores_other_exit_codes() {
	for code in [2, 137] {
		res := os.Result{
			exit_code: code
			output:    'SIGKILL'
		}
		assert !hit_resource_limit(res)
	}
}

// The editor marks one line, so a positioned error must reduce to the line
// the compiler named plus its message.
fn test_first_diagnostic_returns_line_and_text() {
	output := 'main.v:7:3: error: boom happened\nsome following line'
	line, text := first_diagnostic(output)
	assert line == 7
	assert text == 'boom happened'
}

// Output with no position carries nothing the editor can mark, so it yields
// the zero value rather than a guessed line.
fn test_first_diagnostic_returns_zero_for_unpositioned_output() {
	line, text := first_diagnostic('Cannot compile file main.v\nno positions here')
	assert line == 0
	assert text == ''
}
