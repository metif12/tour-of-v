# Third party code and assets

## V logo

`static/logo.svg` and `static/favicon.png` are the official V logo, taken
unmodified from the V project's own logo repository rather than redrawn.

- Source: https://github.com/vlang/v-logo (`dist/v-logo_32x32.svg` and
  `dist/favicons/favicon-32x32.png`)
- Licence: MIT, Copyright (c) 2019 Don Alfons Nisnoni
  <https://github.com/vlang/v-logo/blob/master/LICENSE>

MIT requires the notice to travel with the asset, which is what this section
is. The logo is a trademark of the V project and is used here to identify the
language being taught, which is the nominative use the licence allows. It has
not been modified.

## CodeMirror 5

`static/codemirror/lib/codemirror.js` and `static/codemirror/lib/codemirror.css`
are CodeMirror 5.65.16, vendored rather than loaded from a CDN so that the tour
has no runtime dependency on a third party host and keeps working offline.

- Source: https://github.com/codemirror/codemirror5
- Licence: MIT, reproduced in `static/codemirror/LICENSE`

`static/codemirror/mode/vlang/vlang.js` is **not** from CodeMirror. It was
written for this project and is covered by this repository's MIT licence.

## The V mascot is deliberately not included

The V project also publishes an official mascot, "Veasel"
(<https://github.com/vlang/v-mascot>). It is not used here because it is
licensed **CC BY-NC 4.0**, which permits use only for non-commercial purposes.
This tour is non-commercial today and could use it on those terms, with
attribution, but a tutorial that is meant to stay freely available should not
depend on a licence that forbids commercial use. If the mascot is ever wanted,
the licence needs to be cleared first rather than assumed.
