module runner

import os
import time

// IsolationVerdict is the outcome of the startup self-test.
//
// Fields are mutable because the checks fill the verdict in as they go.
pub struct IsolationVerdict {
pub mut:
	ok       bool
	fatal    []string // failures that mean visitor code is not contained
	warnings []string // things that are wrong but not containment failures
}

// self_test is the startup check that the sandbox actually contains code.
//
// It runs a handful of deliberately hostile programs through the real run
// path and requires each one to fail in the expected way. A program that
// succeeds where it should have been stopped is a containment failure, and
// the server refuses to start.
//
// This exists because of how the official V playground got it wrong. Its
// `/cgen` endpoint was discovered running the compiler directly on the host,
// with no isolate in front, and served that way for roughly two years. The
// most recent commit in that repository is titled "fix vulnerability". A
// sandbox is a claim that is easy to make and easy to stop making by
// accident, so it is checked on every start instead of trusted once.
pub fn self_test() IsolationVerdict {
	mut verdict := IsolationVerdict{
		ok:       true
		fatal:    []string{}
		warnings: []string{}
	}

	// isolate has to be installed at all.
	if !isolate_available() {
		verdict.fatal << 'the `isolate` binary is missing, so nothing is sandboxed'
		verdict.ok = false
		return verdict
	}

	// A program that compiles and runs. If this fails, every result below is
	// meaningless, because a broken toolchain looks identical to a working
	// sandbox.
	hello := run([SourceFile{
		name: 'main.v'
		body: "fn main() {\n\tprintln('self test ok')\n}\n"
	}])
	if hello.error != '' || !hello.ran || !hello.output.contains('self test ok') {
		verdict.fatal << 'a trivial program did not run: ${hello.error}'
		if hello.build_out != '' {
			verdict.fatal << 'compiler said: ${hello.build_out.all_after_last('\n')}'
		}
		verdict.ok = false
		return verdict
	}

	// Each probe is expected to be stopped. `expect` describes how, and the
	// probe fails the self-test if it manages to succeed instead.
	probes := [
		Probe{
			name:   'network'
			why:    'a sandboxed program must not be able to open a connection'
			body:   "import net\n\nfn main() {\n\tmut targets := ['1.1.1.1:80', '8.8.8.8:53', 'example.com:80']\n\tfor host in targets {\n\t\tres := net.new_dialer('tcp', host)\n\t\tres.connect()!\n\t}\n\tprintln('CONNECTED')\n}\n"
			expect: .not_run
		},
		Probe{
			name:   'filesystem'
			why:    'a sandboxed program must not be able to read the host filesystem'
			body:   "import os\n\nfn main() {\n\tif os.exists('/etc/passwd') {\n\t\tprintln('READ ' + os.read_file('/etc/passwd') or { '' })\n\t}\n\tif os.exists(os.dir(os.executable())) {\n\t\tprintln('ESCAPED')\n\t}\n}\n"
			expect: .no_marker
		},
		Probe{
			name:   'infinite loop'
			why:    'a sandboxed program must not be able to run unbounded'
			body:   'fn main() {\n\tfor {\n\t}\n}\n'
			expect: .limited
		},
		Probe{
			name:   'memory bomb'
			why:    'a sandboxed program must not be able to exhaust host memory'
			body:   'fn main() {\n\tmut blocks := [][]u8{cap: 64_000_000}\n\tfor {\n\t\tblocks << []u8{len: 64_000_000, init: u8(1)}\n\t}\n}\n'
			expect: .limited
		},
		Probe{
			name:   'fork bomb'
			why:    'a sandboxed program must not be able to spawn unbounded processes'
			body:   "import os\n\nfn main() {\n\tmut kids := []&os.Process{cap: 4}\n\tfor {\n\t\tmut kids2 := kids\n\t\tkids2 << os.new_process('/bin/true')\n\t\tkids2 << os.new_process('/bin/true')\n\t\tkids = kids2\n\t}\n}\n"
			expect: .limited
		},
		Probe{
			name:   'escape attempt'
			why:    'a sandboxed program must not be able to write outside its box'
			body:   "import os\n\nfn main() {\n\tfor path in ['/tmp/escape-probe', '/escape-probe', os.dir(os.executable()) + '/escape-probe'] {\n\t\tif os.write_file(path, 'x') or { '' } == 'x' {\n\t\t\tprintln('WROTE ' + path)\n\t\t}\n\t}\n}\n"
			expect: .no_marker
		},
	]

	for probe in probes {
		problem := run_probe(probe)
		if problem != '' {
			verdict.fatal << problem
			verdict.ok = false
		}
	}

	// A wall-clock timeout only matters for a program that sleeps rather than
	// spins, since CPU time does not advance while sleeping.
	sleeper := run([SourceFile{
		name: 'main.v'
		body: "import time\n\nfn main() {\n\ttime.sleep(60 * time.second)\n\tprintln('SLEPT')\n}\n"
	}])
	if sleeper.error == '' && sleeper.output.contains('SLEPT') {
		verdict.fatal << 'a program slept for 60 seconds and was not stopped'
		verdict.ok = false
	}

	// A compile error is not a containment failure, but it does mean the
	// lesson pages will look broken, so it is worth saying out loud.
	bad := run([SourceFile{
		name: 'main.v'
		body: 'fn main() { this is not V }\n'
	}])
	if bad.ran {
		verdict.warnings << 'a program that cannot compile appears to have run'
	}

	return verdict
}

// Probe is one hostile program in the self-test.
struct Probe {
	name   string
	why    string
	body   string
	expect Expect
}

// Expect is how a probe is supposed to end.
enum Expect {
	not_run   // must not produce the marker at all
	no_marker // must not print its marker
	limited   // must be stopped by a resource limit
}

// run_probe runs one hostile program and returns a description of the
// containment failure, or an empty string when the probe behaved.
fn run_probe(p Probe) string {
	started := time.now()
	res := run([SourceFile{
		name: 'main.v'
		body: p.body
	}])
	elapsed := time.since(started)

	// A probe that fails to compile tells us nothing about containment, so it
	// is reported as a warning rather than silently treated as a pass.
	if res.error != '' && !res.ran {
		return 'the ${p.name} probe did not compile, so it proved nothing: ${res.build_out.all_after_last('\n')}'
	}

	match p.expect {
		.not_run {
			// The probe prints CONNECTED only if a connection succeeded.
			if res.output.contains('CONNECTED') {
				return 'the ${p.name} probe reached the network: ${p.why}'
			}
			if res.error != '' {
				return 'the ${p.name} probe could not even start: ${p.why}'
			}
		}
		.no_marker {
			if res.output.contains('ESCAPED') || res.output.contains('READ ')
				|| res.output.contains('WROTE') {
				return 'the ${p.name} probe touched the host: ${p.why}'
			}
		}
		.limited {
			// Either the limit stopped it, or it stopped on its own. Both are
			// acceptable outcomes, but it must not have run to a normal finish
			// while ignoring the wall clock.
			if !res.hit_limits && res.error == '' && elapsed > 30 * time.second {
				return 'the ${p.name} probe ran for ${elapsed} without being stopped: ${p.why}'
			}
		}
	}
	return ''
}
