module runner

import os

// isolate_bin is the sandbox launcher.
pub const isolate_bin = 'isolate'

// Box is a handle on one isolate sandbox: its directory and its id.
pub struct Box {
pub mut:
	path string
	id   int
	ok   bool
}

// init_box allocates a sandbox, reusing an existing directory where possible.
//
// The directory is always `<root>/<id>/box`, which keeps the mapping from box
// to directory unambiguous for cleanup.
pub fn init_box() Box {
	for id in 0 .. max_boxes {
		res := os.exec([isolate_bin, '--box-id=${id}', '--init'])
		if res.exit_code != 0 {
			continue
		}
		root := res.output.trim_space()
		if root == '' {
			continue
		}
		return Box{
			path: os.join_path(root, 'box')
			id:   id
			ok:   true
		}
	}
	return Box{
		path: ''
		id:   -1
		ok:   false
	}
}

// cleanup releases a sandbox and everything in it.
//
// The caller must invoke this even when the run failed, so that a compile
// error does not leak a box per request.
pub fn cleanup(b Box) {
	if !b.ok || b.id < 0 {
		return
	}
	os.exec([isolate_bin, '--box-id=${b.id}', '--cleanup'])
}

// cleanup_all removes every sandbox this process may have created.
//
// Run once at startup, because a process killed while boxes were live leaves
// them behind, and they hold file descriptors and cgroup state.
pub fn cleanup_all() {
	for id in 0 .. max_boxes {
		os.exec([isolate_bin, '--box-id=${id}', '--cleanup'])
	}
}

// isolate_available reports whether the isolate binary can be invoked.
//
// This is the cheap first signal that we are not in the intended container.
// The authoritative check is the isolation self-test, which is much harder to
// pass by accident.
pub fn isolate_available() bool {
	return os.exec([isolate_bin, '--version']).exit_code == 0
}

// exec_boxed runs a command inside the sandbox and captures its output.
//
// `root` is the read-only V toolchain bind mounted into the box. It has to be
// the compiler itself, not this program, because the compiler is what the
// limits are there to constrain. Pass an empty string for a command that needs
// no toolchain.
//
// `limits` are isolate's own resource flags, assembled by the caller.
//
// Every command is passed as an argument array rather than a shell string. V
// has deprecated `os.execute` for exactly this reason: it runs
// `/bin/sh -c <string>`, so anything interpolated into that string is a
// potential injection. Nothing here should ever be attacker controlled, but an
// argv array removes the question rather than relying on that.
//
// isolate inherits our stdout and stderr, so the caller gets one merged stream:
// compiler diagnostics, program output and isolate's own status line all arrive
// together. That is unavoidable without separating the file descriptors, and it
// matches what play.vlang.io returns.
pub fn exec_boxed(b Box, root string, limits []string, argv []string) os.Result {
	if !b.ok {
		return os.Result{
			exit_code: -1
			output:    'no sandbox available'
		}
	}

	mut full := [isolate_bin, '--box-id=${b.id}']
	if root != '' {
		full << '--dir=${root}'
	}
	full << limits
	full << ['--run', '--']
	full << argv
	return os.exec(full)
}
