#!/usr/bin/env python3
"""Scaffold a new lesson with example file and content stub.

Usage:
    python scripts/new_lesson.py <module-slug> <module-title> <lesson-slug> <lesson-title>

Example:
    python scripts/new_lesson.py structs "Structs" structs_intro "Introduction to Structs"
"""

import argparse
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent


def scaffold_lesson(module_slug: str, module_title: str, lesson_slug: str, lesson_title: str) -> None:
    content_file = REPO_ROOT / 'content' / f'{module_slug}.v'
    example_file = REPO_ROOT / 'content' / 'examples' / f'{lesson_slug}_example.v'

    if content_file.exists():
        print(f'error: {content_file} already exists', file=sys.stderr)
        sys.exit(1)

    if example_file.exists():
        print(f'error: {example_file} already exists', file=sys.stderr)
        sys.exit(1)

    content_lines = [
        'module content',
        '',
        f'// {module_title} module.',
        f'pub fn {module_slug}() Module {{',
        '\treturn Module{',
        f"\t\tid:          '{module_slug}'",
        f"\t\ttitle:       '{module_title}'",
        "\t\tdescription: '<p>TODO: describe this module.</p>'",
        '\t\tlessons:     [',
        '\t\t\tLesson{',
        f"\t\t\t\tslug:        '{lesson_slug}'",
        f"\t\t\t\ttitle:       '{lesson_title}'",
        "\t\t\t\tdescription: 'TODO: describe this lesson.'",
        '\t\t\t\tpages:       [',
        '\t\t\t\t\tPage{',
        "\t\t\t\t\t\ttitle: 'TODO: page title'",
        "\t\t\t\t\t\tbody:  '<p>TODO: page body.</p>',",
        '\t\t\t\t\t\tcode:  Example{',
        f'\t\t\t\t\t\t\tfiles: [{lesson_slug}_example_file],',
        '\t\t\t\t\t\t}',
        '\t\t\t\t\t},',
        '\t\t\t\t],',
        '\t\t\t},',
        '\t\t]',
        '\t}',
        '}',
        '',
        f'const {lesson_slug}_example_file = CodeFile{{',
        f"\tname: '{lesson_slug}_example.v',",
        f"\tbody:  $embed_file('examples/{lesson_slug}_example.v').to_string(),",
        '}',
        '',
    ]

    content_file.write_text('\n'.join(content_lines), encoding='utf-8')
    print(f'created {content_file.relative_to(REPO_ROOT)}')

    example_lines = [
        f'// {lesson_slug}_example.v',
        '// TODO: write the example program for this lesson.',
        '',
        'fn main() {',
        "\tprintln('TODO: example output')",
        '}',
        '',
    ]

    example_file.write_text('\n'.join(example_lines), encoding='utf-8')
    print(f'created {example_file.relative_to(REPO_ROOT)}')

    update_catalog(module_slug)


def update_catalog(module_slug: str) -> None:
    catalog_file = REPO_ROOT / 'content' / 'catalog.v'
    text = catalog_file.read_text(encoding='utf-8')

    pattern = r'(\t\tconcurrency\(\),\n)'
    if not re.search(pattern, text):
        print('error: could not find insertion point in catalog.v', file=sys.stderr)
        sys.exit(1)

    text = re.sub(pattern, f'\\1\t\t{module_slug}(),\n', text, count=1)

    catalog_file.write_text(text, encoding='utf-8')
    print(f'updated {catalog_file.relative_to(REPO_ROOT)}')


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('module_slug', help='module slug, e.g. structs')
    parser.add_argument('module_title', help='module title, e.g. Structs')
    parser.add_argument('lesson_slug', help='lesson slug, e.g. structs_intro')
    parser.add_argument('lesson_title', help='lesson title, e.g. Introduction to Structs')
    args = parser.parse_args()

    scaffold_lesson(args.module_slug, args.module_title, args.lesson_slug, args.lesson_title)


if __name__ == '__main__':
    main()
