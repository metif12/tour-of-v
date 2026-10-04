# Third party code

## CodeMirror 5

`static/codemirror/lib/codemirror.js` and `static/codemirror/lib/codemirror.css`
are CodeMirror 5.65.16, vendored rather than loaded from a CDN so that the tour
has no runtime dependency on a third party host and keeps working offline.

- Source: https://github.com/codemirror/codemirror5
- Licence: MIT, reproduced in `static/codemirror/LICENSE`

`static/codemirror/mode/vlang/vlang.js` is **not** from CodeMirror. It was
written for this project and is covered by this repository's MIT licence.
