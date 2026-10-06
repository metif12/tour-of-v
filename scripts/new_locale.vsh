#!/usr/bin/env -S v run
import os
import strings

const ui_keys = [
	'site_title',
	'toc',
	'toggle_theme',
	'language',
	'run',
	'format',
	'reset',
	'solution',
	'output',
	'help',
	'help_close',
	'run_program',
	'next_page',
	'prev_page',
	'toggle_help',
	'move_panes',
	'previous',
	'next',
	'resize_panes',
	'page_of',
	'no_program',
	'compile_failed',
	'could_not_reach',
	'could_not_format',
	'sandbox_busy',
	'too_large',
	'no_compiler',
	'link_counterpart',
	'lang_other',
]

const module_keys = [
	'mechanics',
	'basics',
	'controlflow',
	'moretypes',
	'optionresult',
	'methods',
	'generics',
	'concurrency',
]

const lesson_keys = [
	'welcome',
	'basics',
	'controlflow',
	'moretypes',
	'optionresult',
	'methods',
	'generics',
	'concurrency',
]

fn main() {
	if os.args.len < 4 {
		eprintln('usage: v run scripts/new_locale.vsh <code> <english-name> <native-name> [--rtl]')
		exit(1)
	}

	code := os.args[1]
	name := os.args[2]
	native := os.args[3]
	rtl := os.args.len > 4 && os.args[4] == '--rtl'

	locale_file := 'locale/${code}.v'
	if os.exists(locale_file) {
		eprintln('error: ${locale_file} already exists')
		exit(1)
	}

	mut sb := strings.new_builder(4096)
	sb.write_string('module locale\n\n')
	sb.write_string('// ${code} is the ${name} translation.\n')
	sb.write_string('// Page bodies fall back to English; the interface and the table of\n')
	sb.write_string('// contents are translated.\n\n')
	sb.write_string('pub const ${code} = Text{\n')
	sb.write_string('\tmodules: {\n')
	for key in module_keys {
		sb.write_string("\t\t'${key}': '',\n")
	}
	sb.write_string('\t}\n')
	sb.write_string('\tlessons: {\n')
	for key in lesson_keys {
		sb.write_string("\t\t'${key}': '',\n")
	}
	sb.write_string('\t}\n')
	sb.write_string('\tpages:   {}\n')
	sb.write_string('\tui:      {\n')
	for key in ui_keys {
		sb.write_string("\t\t'${key}': '',\n")
	}
	sb.write_string('\t}\n')
	sb.write_string('}\n')

	os.write_file(locale_file, sb.str()) or {
		eprintln('error: could not write ${locale_file}: ${err}')
		exit(1)
	}
	println('created ${locale_file}')

	update_locale_registry(code, name, native, rtl)
}

fn update_locale_registry(code string, name string, native string, rtl bool) {
	registry_file := 'locale/locale.v'
	mut text := os.read_file(registry_file) or {
		eprintln('error: could not read ${registry_file}: ${err}')
		exit(1)
	}

	rtl_str := if rtl { 'true' } else { 'false' }
	new_entry := "\tLocale{ code: '${code}', name: '${name}', native: '${native}', rtl: ${rtl_str} },"

	ko_marker := "\tLocale{ code: 'ko', name: 'Korean', native: '한국어', rtl: false },\n"
	if !text.contains(ko_marker) {
		eprintln('error: could not find insertion point in ${registry_file}')
		exit(1)
	}
	text = text.replace(ko_marker, ko_marker + new_entry + '\n')

	ko_match := "\t\t'ko' { ko }\n"
	if !text.contains(ko_match) {
		eprintln('error: could not find translations() match in ${registry_file}')
		exit(1)
	}
	text = text.replace(ko_match, ko_match + "\t\t'${code}' { ${code} }\n")

	os.write_file(registry_file, text) or {
		eprintln('error: could not write ${registry_file}: ${err}')
		exit(1)
	}
	println('updated ${registry_file}')
}
