// Module `runner` compiles and executes the code a visitor submits.
//
// V has no embeddable compiler and no in-process sandbox, so every run is a
// subprocess on the far side of an `isolate` box. isolate provides Linux
// namespaces, cgroups, seccomp and a chroot, which together are the actual
// security boundary. Nothing in this module is a substitute for that.
//
// The limits below mirror the ones the official V playground uses, so a
// program that behaves here behaves the same way at play.vlang.io.
module runner

// max_program_processes caps threads and processes inside a box while a
// submitted program is running, which is what stops a fork bomb.
const max_program_processes = 10

// max_compiler_processes caps them while the V compiler runs, and it has to be
// far higher than the program cap.
//
// V builds a thread pool sized from the CPU count as the compiler starts, so a
// cap anywhere near the program cap starves it before it does any work. The
// compiler then dies with
//
//	V panic: `go sync__pool__process_in_thread()`: Resource temporarily unavailable
//
// before printing anything, so the failure reaches the diagnostics parser as
// an empty string and reads like the sandbox silently refusing to compile.
// Measured on a 12-CPU host: 10 fails, 20 compiles. 64 leaves headroom for
// larger hosts while still bounding what a submission can spawn while it is
// being compiled.
//
// This is a cap and not an allowance. Nothing here raises the container's own
// limits, and the submitted program still runs under max_program_processes.
const max_compiler_processes = 64

// Compiler and program memory limits, in KiB.
//
// isolate applies these as RLIMIT_AS, which bounds address space rather than
// pages actually touched. That distinction drives the large difference between
// the two numbers: the V compiler reserves a lot of virtual memory up front, so
// a limit sized for a program's real usage starves it before it starts. The
// number that actually protects the host is the container's own memory limit,
// not this one.
const max_compiler_memory_kb = 2_000_000
const max_run_memory_kb = 500_000

// CPU seconds for the compiled program. Note this is CPU time, not wall clock,
// so a program that sleeps does not consume it.
const run_cpu_seconds = 2

// Wall clock seconds for a submitted program. This is the backstop for
// `time.sleep(10**9)` and for anything that blocks rather than spins. It is
// deliberately only a little larger than run_cpu_seconds.
const wall_seconds = 3

// Wall clock seconds for a compile. Builds are much slower than programs, so
// this is separate rather than shared. There is no matching CPU limit: the
// compiler is given the benefit of the doubt on CPU time because the wall clock
// still catches a hang, and cutting off a slow but legitimate build would be
// worse than waiting for it.
const wall_compile_seconds = 60

// max_output_bytes and max_output_lines bound what a program can make the
// server hold in memory or send back. A program in a tight `print` loop can
// produce output far faster than it burns CPU.
const max_output_bytes = 10_000
const max_output_lines = 100

// max_source_bytes bounds a single submitted file, and max_source_files
// bounds how many files one submission may contain. Both are enforced before
// anything is written to disk.
//
// veb does not enforce a request body limit of its own, so without this a
// visitor could post an arbitrarily large body.
const max_source_bytes = 64 * 1024
const max_source_files = 5

// max_boxes bounds how many isolate boxes may exist at once. Each box is a
// directory plus a namespace, so this is the concurrency ceiling of the whole
// service.
const max_boxes = 64

// compile_flags are passed to the V compiler for every build.
//
//   -g             emit debug info, which is what gives runtime errors a
//                  usable `file:line:column` instead of a bare address
//   -no-parallel   the compiler forks a C build per translation unit, which
//                  competes with its own thread pool for max_compiler_processes
//                  and makes a build slower than it needs to be
//   -no-retry-compilation
//                  do not silently retry, so a failure is reported once
const compile_flags = '-cflags -DGC_MARKERS=1 -no-parallel -no-retry-compilation -g'

// format_flags are passed to `v fmt`.
const format_flags = '-verify'

// The flag sets above are written as readable strings and split here, so that
// there is one place where a flag list becomes an argument array. Every
// isolate invocation is an argv array rather than a shell string.
fn split_flags(flags string) []string {
	return flags.split(' ').filter(it != '')
}

// compile_flag_args returns the compiler flags as separate arguments.
//
// `-cc gcc` is explicit because the V compiler otherwise prefers tcc when it
// finds it, and the two do not always agree on the generated C. Naming the C
// compiler keeps a submitted program's build reproducible, which also matters
// because the container is what decides what a learner sees.
//
// compile_flags used to sit here as a comment while the function returned only
// `-cc gcc`, so none of it reached a build: no debug info, and the compiler's
// silent retry was left on. That retry matters more than it looks, because it
// is what turns one C compiler into two attempts and lets a later attempt
// succeed after an earlier one failed, so the diagnostics end up describing a
// build that is not the one whose output the learner sees.
pub fn compile_flag_args() []string {
	mut args := ['-cc', 'gcc']
	args << split_flags(compile_flags)
	return args
}

// format_flag_args returns the formatter flags as separate arguments.
pub fn format_flag_args() []string {
	return split_flags(format_flags)
}

// box_env is the environment every box gets.
//
// HOME has to be inside the box, or the V compiler has nowhere writable to put
// its temporary files. PATH has to be set explicitly because isolate starts a
// box with an empty environment, and without it `v` cannot find the C compiler
// it needs in order to link anything.
pub fn box_env() []string {
	return ['--env=HOME=/box', '--env=PATH=/usr/local/bin:/usr/bin:/bin']
}

// compile_limits are the isolate limits for a build.
//
// The memory ceiling is far larger than the one applied to a submitted program.
// isolate enforces it as RLIMIT_AS, which caps *address space* rather than
// pages touched, and the V compiler reserves a great deal of virtual memory
// before it allocates anything real. A limit sized for a program's actual usage
// starves the compiler before it starts.
pub fn compile_limits() []string {
	mut limits := [
		'--processes=${max_compiler_processes}',
		'--mem=${max_compiler_memory_kb}',
		'--wall-time=${wall_compile_seconds}',
	]
	limits << box_env()
	return limits
}

// run_limits are the isolate limits for the compiled program.
//
// Both a CPU limit and a slightly larger wall clock limit, which together stop
// a spinning program and a sleeping one.
pub fn run_limits() []string {
	mut limits := [
		'--processes=${max_program_processes}',
		'--mem=${max_run_memory_kb}',
		'--time=${run_cpu_seconds}',
		'--wall-time=${wall_seconds}',
	]
	limits << box_env()
	return limits
}

// tool_limits are the isolate limits for `v fmt` and `v -version`.
//
// The wall clock is what bounds these, since both are short single purpose
// invocations. The process cap is the compiler's rather than the program's,
// because `v fmt` boots the same front-end and would otherwise be starved by
// the same thread pool the compile step is.
pub fn tool_limits() []string {
	mut limits := [
		'--processes=${max_compiler_processes}',
		'--mem=${max_compiler_memory_kb}',
		'--wall-time=${wall_seconds}',
	]
	limits << box_env()
	return limits
}
