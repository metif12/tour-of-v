module main

// An unfinished stub must classify as exercise so check_one SKIPs it;
// verifying a stub as PASS would let incomplete work look done.
fn test_kind_of_exercise_suffix() {
	assert kind_of('loops_exercise.v') == 'exercise'
}

// A broken-by-design lesson must classify as broken so the checker
// requires a compile failure instead of a clean run.
fn test_kind_of_broken_suffix() {
	assert kind_of('null_broken.v') == 'broken'
}

// A finished lesson must classify as done so it goes through the
// normal compile-and-run path rather than the broken-file path.
fn test_kind_of_done_suffix() {
	assert kind_of('loops_done.v') == 'done'
}

// A _solution.v sibling is the runnable answer to an exercise stub, so it
// must share the done branch; a distinct kind would fall off check_one's
// branches and silently change what gets verified.
fn test_kind_of_solution_suffix_is_done() {
	assert kind_of('loops_solution.v') == 'done'
}

// A plain file has no marker suffix, so it is a normal runnable example.
fn test_kind_of_plain_file_is_example() {
	assert kind_of('hello.v') == 'example'
}

// The .v filter happens earlier in main; kind_of only sees a base name, so
// a non-.v tail must still fall through to example rather than matching.
fn test_kind_of_non_v_tail_is_example() {
	assert kind_of('weird.v.txt') == 'example'
}

// The marker must be a suffix: the words elsewhere in the name must not
// misroute a normal example onto the stub/broken branches.
fn test_kind_of_infix_marker_is_example() {
	assert kind_of('exercise_old.v') == 'example'
}

// Short statuses are padded so the PASS/FAIL/SKIPPED report columns line up.
fn test_pad_shorter_pads_to_n() {
	assert pad('PASS', 7) == 'PASS   '
}

// An already-aligned status must pass through untouched.
fn test_pad_exact_is_unchanged() {
	assert pad('1234567', 7) == '1234567'
}

// Padding must never truncate: a long name stays readable in the report.
fn test_pad_longer_is_unchanged() {
	assert pad('a_very_long_example_name', 7) == 'a_very_long_example_name'
}

// Empty input still pads, since the report pads empty details the same way.
fn test_pad_empty_string() {
	assert pad('', 3) == '   '
	assert pad('', 0) == ''
}

// check_one branches on exactly these four strings, so any rename or extra
// kind here would silently fall through to the wrong verification path.
fn test_classification_contract() {
	assert kind_of('a_exercise.v') == 'exercise'
	assert kind_of('a_broken.v') == 'broken'
	assert kind_of('a_done.v') == 'done'
	assert kind_of('a_solution.v') == 'done'
	assert kind_of('a.v') == 'example'
}
