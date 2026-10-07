#!/usr/bin/env -S v run

import os
import strings

fn main() {
	if os.args.len < 5 {
		eprintln('usage: v run scripts/new_lesson.vsh <module-slug> <module-title> <lesson-slug> <lesson-title>')
		exit(1)
	}

	module_slug := os.args[1]
	module_title := os.args[2]
	lesson_slug := os.args[3]
	lesson_title := os.args[4]

	content_file := 'content/${module_slug}.v'
	example_file := 'content/examples/${lesson_slug}_example.v'

	if os.exists(content_file) {
		eprintln('error: ${content_file} already exists')
		exit(1)
	}
	if os.exists(example_file) {
		eprintln('error: ${example_file} already exists')
		exit(1)
	}

	mut sb := strings.new_builder(4096)
	sb.write_string('module content\n\n')
	sb.write_string('// ${module_title} module.\n')
	sb.write_string('pub fn ${module_slug}() Module {\n')
	sb.write_string('\treturn Module{\n')
	sb.write_string("\t\tid:          '${module_slug}'\n")
	sb.write_string("\t\ttitle:       '${module_title}'\n")
	sb.write_string("\t\tdescription: '<p>TODO: describe this module.</p>'\n")
	sb.write_string('\t\tlessons:     [\n')
	sb.write_string('\t\t\tLesson{\n')
	sb.write_string("\t\t\t\tslug:        '${lesson_slug}'\n")
	sb.write_string("\t\t\t\ttitle:       '${lesson_title}'\n")
	sb.write_string("\t\t\t\tdescription: 'TODO: describe this lesson.'\n")
	sb.write_string('\t\t\t\tpages:       [\n')
	sb.write_string('\t\t\t\t\tPage{\n')
	sb.write_string("\t\t\t\t\t\ttitle: 'TODO: page title'\n")
	sb.write_string("\t\t\t\t\t\tbody:  '<p>TODO: page body.</p>'\n")
	sb.write_string('\t\t\t\t\t\tcode:  Example{\n')
	sb.write_string('\t\t\t\t\t\t\tfiles: [${lesson_slug}_example_file],\n')
	sb.write_string('\t\t\t\t\t\t}\n')
	sb.write_string('\t\t\t\t\t},\n')
	sb.write_string('\t\t\t\t],\n')
	sb.write_string('\t\t\t},\n')
	sb.write_string('\t\t]\n')
	sb.write_string('\t}\n')
	sb.write_string('}\n\n')
	sb.write_string('const ${lesson_slug}_example_file = CodeFile{\n')
	sb.write_string("\tname: '${lesson_slug}_example.v',\n")
	sb.write_string("\tbody:  \$embed_file('examples/${lesson_slug}_example.v').to_string(),\n")
	sb.write_string('}\n')

	os.write_file(content_file, sb.str()) or {
		eprintln('error: could not write ${content_file}: ${err}')
		exit(1)
	}
	println('created ${content_file}')

	mut ex := strings.new_builder(1024)
	ex.write_string('// ${lesson_slug}_example.v\n')
	ex.write_string('// TODO: write the example program for this lesson.\n\n')
	ex.write_string('fn main() {\n')
	ex.write_string("\tprintln('TODO: example output')\n")
	ex.write_string('}\n')

	os.write_file(example_file, ex.str()) or {
		eprintln('error: could not write ${example_file}: ${err}')
		exit(1)
	}
	println('created ${example_file}')

	update_catalog(module_slug)
}

fn update_catalog(module_slug string) {
	catalog_file := 'content/catalog.v'
	mut text := os.read_file(catalog_file) or {
		eprintln('error: could not read ${catalog_file}: ${err}')
		exit(1)
	}

	marker := '\t\tconcurrency(),\n'
	if !text.contains(marker) {
		eprintln('error: could not find insertion point in ${catalog_file}')
		exit(1)
	}
	text = text.replace(marker, marker + '\t\t${module_slug}(),\n')

	os.write_file(catalog_file, text) or {
		eprintln('error: could not write ${catalog_file}: ${err}')
		exit(1)
	}
	println('updated ${catalog_file}')
}
