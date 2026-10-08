module main

import os

// The suite mutates TOUR_PORT, so every test saves and restores it: without
// this, order decides which port a neighbouring test sees and the suite only
// passes in one sequence.
fn save_port() string {
	return os.getenv('TOUR_PORT')
}

fn restore_port(old string) {
	if old == '' {
		os.unsetenv('TOUR_PORT')
	} else {
		os.setenv('TOUR_PORT', old, true)
	}
}

// With no override configured the server must come up on the documented
// default rather than refusing to bind.
fn test_listen_port_defaults_when_unset() {
	old := save_port()
	defer {
		restore_port(old)
	}
	os.unsetenv('TOUR_PORT')
	assert listen_port() == 8080
}

// An empty override is the same as no override: containers often pass through
// an empty variable, and that must not change the port.
fn test_listen_port_defaults_when_empty() {
	old := save_port()
	defer {
		restore_port(old)
	}
	os.setenv('TOUR_PORT', '', true)
	assert listen_port() == 8080
}

// A valid override is honoured exactly, which is what lets a second copy run
// alongside the live instance.
fn test_listen_port_uses_valid_value() {
	old := save_port()
	defer {
		restore_port(old)
	}
	os.setenv('TOUR_PORT', '3001', true)
	assert listen_port() == 3001
}

// A typo in the environment falls back to the default instead of refusing to
// start; a tour that will not boot over a misspelling helps nobody.
fn test_listen_port_falls_back_when_non_numeric() {
	old := save_port()
	defer {
		restore_port(old)
	}
	os.setenv('TOUR_PORT', 'abc', true)
	assert listen_port() == 8080
}

// Zero is not a usable port, so it falls back rather than binding nowhere.
fn test_listen_port_falls_back_for_zero() {
	old := save_port()
	defer {
		restore_port(old)
	}
	os.setenv('TOUR_PORT', '0', true)
	assert listen_port() == 8080
}

// Ports stop at 65535; anything above is a typo and must not be passed to the
// listener.
fn test_listen_port_falls_back_above_range() {
	old := save_port()
	defer {
		restore_port(old)
	}
	os.setenv('TOUR_PORT', '65536', true)
	assert listen_port() == 8080
}

// A negative value is not a port either, so it falls back like the rest.
fn test_listen_port_falls_back_when_negative() {
	old := save_port()
	defer {
		restore_port(old)
	}
	os.setenv('TOUR_PORT', '-5', true)
	assert listen_port() == 8080
}

// The top of the range is still valid; the bound is exclusive of 65536, and
// this pins which side the edge falls on.
fn test_listen_port_accepts_top_of_range() {
	old := save_port()
	defer {
		restore_port(old)
	}
	os.setenv('TOUR_PORT', '65535', true)
	assert listen_port() == 65535
}
