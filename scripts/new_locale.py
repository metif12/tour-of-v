#!/usr/bin/env python3
"""Scaffold a new locale file with all UI keys.

Usage:
    python scripts/new_locale.py <code> <english-name> <native-name> [--rtl]

Example:
    python scripts/new_locale.py sv Swedish Svenska
    python scripts/new_locale.py he Hebrew עברית --rtl
"""

import argparse
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent

UI_KEYS = [
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

MODULE_KEYS = [
    'mechanics',
    'basics',
    'controlflow',
    'moretypes',
    'optionresult',
    'methods',
    'generics',
    'concurrency',
]

LESSON_KEYS = [
    'welcome',
    'basics',
    'controlflow',
    'moretypes',
    'optionresult',
    'methods',
    'generics',
    'concurrency',
]


def scaffold_locale(code: str, name: str, native: str, rtl: bool) -> None:
    locale_file = REPO_ROOT / 'locale' / f'{code}.v'

    if locale_file.exists():
        print(f'error: {locale_file} already exists', file=sys.stderr)
        sys.exit(1)

    lines = [
        'module locale',
        '',
        f'// {code} is the {name} translation.',
        '// Page bodies fall back to English; the interface and the table of',
        '// contents are translated.',
        '',
        f'pub const {code} = Text{{',
        '\tmodules: {',
    ]

    for key in MODULE_KEYS:
        lines.append(f"\t\t'{key}': '',")

    lines.append('\t}')
    lines.append('\tlessons: {')

    for key in LESSON_KEYS:
        lines.append(f"\t\t'{key}': '',")

    lines.append('\t}')
    lines.append('\tpages:   {}')
    lines.append('\tui:      {')

    for key in UI_KEYS:
        lines.append(f"\t\t'{key}': '',")

    lines.append('\t}')
    lines.append('}')
    lines.append('')

    locale_file.write_text('\n'.join(lines), encoding='utf-8')
    print(f'created {locale_file.relative_to(REPO_ROOT)}')

    update_locale_registry(code, name, native, rtl)


def update_locale_registry(code: str, name: str, native: str, rtl: bool) -> None:
    registry_file = REPO_ROOT / 'locale' / 'locale.v'
    text = registry_file.read_text(encoding='utf-8')

    rtl_str = 'true' if rtl else 'false'
    new_entry = f"\tLocale{{ code: '{code}', name: '{name}', native: '{native}', rtl: {rtl_str} }},"

    pattern = r'(\tLocale\{ code: \'ko\'.*?\n)'
    if not re.search(pattern, text):
        print('error: could not find insertion point in locale.v', file=sys.stderr)
        sys.exit(1)

    text = re.sub(pattern, f'\\1\t{new_entry}\n', text, count=1)

    match_pattern = r'(\t\t\'ko\' \{ ko \}\n)'
    if not re.search(match_pattern, text):
        print('error: could not find translations() match in locale.v', file=sys.stderr)
        sys.exit(1)

    text = re.sub(match_pattern, f'\\1\t\t\'{code}\' {{ {code} }}\n', text, count=1)

    registry_file.write_text(text, encoding='utf-8')
    print(f'updated {registry_file.relative_to(REPO_ROOT)}')


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('code', help='locale code, e.g. sv')
    parser.add_argument('name', help='English name, e.g. Swedish')
    parser.add_argument('native', help='native name, e.g. Svenska')
    parser.add_argument('--rtl', action='store_true', help='right-to-left script')
    args = parser.parse_args()

    scaffold_locale(args.code, args.name, args.native, args.rtl)


if __name__ == '__main__':
    main()
