#!/usr/bin/env -S v run

import os
import json2
import regex
import strings
import net.http

const slugs = [
	'welcome',
	'basics',
	'controlflow',
	'moretypes',
	'optionresult',
	'methods',
	'generics',
	'concurrency',
	'tooling',
]

fn is_deliberately_broken(body string) bool {
	return body.contains('sum = sum + 10') && !body.contains('mut sum := 1')
}

fn diagnose(res map[string]json2.Any) string {
	build_output := res['buildOutput'] or { '' }
	if build_output.str().contains('V panic') {
		lines := build_output.str().split('\n')
		return 'COMPILER PANIC: ' + lines[0][..110]
	}
	mut seen := []string{}
	for line in build_output.str().split('\n') {
		if line.contains(': error:') && !seen.contains(line.trim_space()) {
			seen << line.trim_space()
		}
	}
	if seen.len > 0 {
		return seen[0..2].join(' | ')
	}
	if res['error'] != null {
		return 'error: ' + res['error'].str()[..110]
	}
	if res['limited'] != null {
		return 'hit the wall clock or a resource limit with no output'
	}
	return 'no output and no diagnostic'
}

fn page_count(base string, slug string) int {
	mut n := 1
	for n < 500 {
		resp := http.get('${base}/${slug}/${n}') or {
			if err.msg().contains('404') {
				return n - 1
			}
			return n - 1
		}
		n++
	}
	return n - 1
}

fn main() {
	base := if os.args.len > 1 { os.args[1] } else { 'http://127.0.0.1:8128' }
	base = base.trim_right('/')

	resp := http.get('${base}/welcome/1') or {
		println('cannot reach a tour at ${base}: ${err}')
		exit(2)
	}

	mut ran := 0
	mut expected_failures := 0
	mut problems := []string{}
	mut pages := 0

	for slug in slugs {
		count := page_count(base, slug)
		for n in 1 .. count + 1 {
			pages++
			path := '/${slug}/${n}'
			body := http.get('${base}${path}') or {
				problems << '${path} -> ${err}'
				continue
			}
			mut re := regex.regex_opt(r'id="page-data"[^>]*>(.*?)</script>') or { continue }
			mut matches := re.find_all(body)
			if matches.len == 0 {
				problems << '${path} -> no page-data island'
				continue
			}
			data := json2.decode[map[string]json2.Any{}]
			(matches[0]) or {
				problems << '${path} -> invalid JSON'
				continue
			}
			files := data['files'] or { []json2.Any{} }
			if files.len == 0 {
				problems << '${path} -> page carries no program'
				continue
			}
			for f in files {
				name := f['name'] or { '?' }
				source := f['body'] or { '' }
				form := 'code=${source}&filename=${name}'
				res_str := http.post('${base}/api/run', form) or {
					problems << '${path} ${name.str()} -> ${err}'
					continue
				}
				res := json2.decode[map[string]json2.Any{}]
				(res_str) or {
					problems << '${path} ${name.str()} -> invalid JSON'
					continue
				}
				output := res['output'] or { '' }
				if is_deliberately_broken(source.str()) {
					if output.str() != '' {
						problems << '${path} ${name.str()} -> meant to fail but ran'
					} else {
						expected_failures++
					}
					continue
				}
				if output.str() != '' {
					ran++
				} else {
					problems << '${path} ${name.str()} -> ${diagnose(res)}'
				}
			}
		}
	}

	println('pages: ${pages}')
	println('examples that ran: ${ran}')
	println('deliberate failures confirmed: ${expected_failures}')
	if problems.len > 0 {
		println('\nPROBLEMS (${problems.len}):')
		for p in problems {
			println('  ' + p)
		}
		exit(1)
	}
	println('\nevery example runs in the sandbox compiler')
}
