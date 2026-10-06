module locale

// Module `locale` holds the tour's translations.
//
// # What is translated, and what is not
//
// Only prose. A page's example program, its solution and the output an exercise
// expects are language neutral and stay in `content`, in one copy. Translating
// them would mean sixteen copies of code that has to stay byte identical,
// because the editor serves the file verbatim and a learner is going to run it.
//
// The split is drawn at the struct boundary: `content.Page` keeps `code`, and
// `locale.PageText` carries `title` and `body`. A translation therefore cannot
// accidentally restate a program.
//
// # Keys
//
// A page is keyed by its lesson slug and its number, `<lesson>/<n>`, for
// example `moretypes/3`. That is stable as long as pages are not reordered,
// which a lesson edit can do. `locale_test.v` checks that every page in the tour
// has a translation for every locale, so a reorder that strands a key is caught
// by the tests rather than showing up as an English page in a translated tour.
//
// Module and lesson titles are keyed by slug, since slugs are already unique
// across the catalogue.
//
// # Fallback
//
// A key missing from a locale falls back to English rather than disappearing.
// A half translated page is a much smaller problem than a blank one, and it is
// also what makes it possible to add a locale by translating a few pages at a
// time.
module locale

// Locale is one language the tour is available in.
pub struct Locale {
pub:
	code   string // 'en', 'fa', used in the URL as /fa/moretypes/1
	name   string // English name, for anyone who does not read the endonym
	native string // the language's own name, which is what a reader picks
	rtl    bool   // true for a right to left script
}

// locales is every language currently offered, in the order the language
// switcher shows them.
//
// A locale is listed here only once it has a translation file, because a
// language picker that offers a language and then serves English is worse than
// one that does not offer it at all. The target is the world's largest
// languages by number of speakers, and the list grows as each translation
// lands.
pub const locales = [
	Locale{ code: 'en', name: 'English', native: 'English', rtl: false },
	Locale{ code: 'zh', name: 'Chinese (Simplified)', native: '简体中文', rtl: false },
	Locale{ code: 'hi', name: 'Hindi', native: 'हिन्दी', rtl: false },
	Locale{ code: 'es', name: 'Spanish', native: 'Español', rtl: false },
	Locale{ code: 'fa', name: 'Persian', native: 'فارسی', rtl: true },
	Locale{ code: 'ar', name: 'Arabic', native: 'العربية', rtl: true },
	Locale{ code: 'fr', name: 'French', native: 'Français', rtl: false },
	Locale{ code: 'bn', name: 'Bengali', native: 'বাংলা', rtl: false },
	Locale{ code: 'pt', name: 'Portuguese', native: 'Português', rtl: false },
	Locale{ code: 'ru', name: 'Russian', native: 'Русский', rtl: false },
	Locale{ code: 'ur', name: 'Urdu', native: 'اردو', rtl: true },
	Locale{ code: 'id', name: 'Indonesian', native: 'Bahasa Indonesia', rtl: false },
	Locale{ code: 'de', name: 'German', native: 'Deutsch', rtl: false },
	Locale{ code: 'ja', name: 'Japanese', native: '日本語', rtl: false },
	Locale{ code: 'tr', name: 'Turkish', native: 'Türkçe', rtl: false },
	Locale{ code: 'ko', name: 'Korean', native: '한국어', rtl: false },
]

// PageText is a translated page title and body.
pub struct PageText {
pub:
	title string
	body  string
}

// Text is one locale's contribution to the tour.
//
// Every field is optional in effect: an absent key falls back to English, so a
// locale file may hold only what has been translated so far.
pub struct Text {
pub:
	modules map[string]string
	lessons map[string]string
	pages   map[string]PageText
	ui      map[string]string
}

// default_locale is the locale an unprefixed URL means.
//
// Keeping English at the root rather than at /en means the original links, and
// every link already shared, keep working.
pub const default_locale = 'en'

// locale looks a locale code up in the registry.
pub fn locale(code string) ?Locale {
	for l in locales {
		if l.code == code {
			return l
		}
	}
	return none
}

// is_rtl reports whether a locale is written right to left.
//
// An unknown code is treated as left to right, which is the safe default: a
// language that does not exist has no text to lay out.
pub fn is_rtl(code string) bool {
	l := locale(code) or { return false }
	return l.rtl
}

// dir returns the value for the `dir` attribute on <html>.
//
// It is set explicitly rather than left to `auto`, because `auto` only inspects
// the first strong character on the page, and the first strong character on a
// lesson page is the V logo's alt text or a piece of code, not the prose.
pub fn dir(code string) string {
	return if is_rtl(code) { 'rtl' } else { 'ltr' }
}

// known reports whether a code names a locale the tour offers.
//
// The router uses this to tell /fa/moretypes/1 from a lesson called `fa`, so a
// wrong code produces a 404 rather than a page in the wrong language.
pub fn known(code string) bool {
	for l in locales {
		if l.code == code {
			return true
		}
	}
	return false
}

// translations returns a locale's text, or the English base if the code is not
// one the tour knows.
pub fn translations(code string) Text {
	return match code {
		'zh' { zh }
		'hi' { hi }
		'es' { es }
		'fa' { fa }
		'ar' { ar }
		'fr' { fr }
		'bn' { bn }
		'pt' { pt }
		'ru' { ru }
		'ur' { ur }
		'id' { id }
		'de' { de }
		'ja' { ja }
		'tr' { tr }
		'ko' { ko }
		else { en }
	}
}

// page_text returns a translated page, or none if this locale has not
// translated that page.
pub fn page_text(code string, lesson string, number int) ?PageText {
	key := '${lesson}/${number}'
	t := translations(code)
	if key in t.pages {
		return t.pages[key]
	}
	return none
}

// module_title returns a translated module title, falling back to `english`.
pub fn module_title(code string, id string, english string) string {
	t := translations(code)
	if id in t.modules {
		return t.modules[id]
	}
	return english
}

// lesson_title returns a translated lesson title, falling back to `english`.
pub fn lesson_title(code string, slug string, english string) string {
	t := translations(code)
	if slug in t.lessons {
		return t.lessons[slug]
	}
	return english
}

// ui_string returns a translated interface string.
//
// Every string the interface shows lives in the English catalogue, so this
// never returns an empty string for a known key: an untranslated key shows the
// English text rather than disappearing.
pub fn ui_string(code string, key string) string {
	t := translations(code)
	if key in t.ui {
		return t.ui[key]
	}
	if key in en.ui {
		return en.ui[key]
	}
	return key
}

// ui_map returns the whole interface catalogue for a locale, for the page to
// carry so the browser does not have to ask again.
pub fn ui_map(code string) map[string]string {
	t := translations(code)
	mut out := en.ui.clone()
	for k, v in t.ui {
		out[k] = v
	}
	return out
}

// href builds a locale prefixed path.
//
// The default locale is not prefixed, so English keeps its bare URLs and every
// link that has already been shared stays valid.
pub fn href(code string, path string) string {
	if code == '' || code == default_locale {
		return path
	}
	return '/${code}${path}'
}
