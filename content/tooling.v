module content

// tooling covers the command line around the compiler: the everyday loop,
// packages, and the agent surface.
pub fn tooling() Module {
	return Module{
		id:          'tooling'
		title:       'Tooling'
		description: '<p>The compiler is only half of V. The command line formats, checks, tests, documents, shares, and connects a project to packages and to coding agents.</p>'
		lessons:     [
			Lesson{
				slug:        'cli'
				title:       'Everyday commands'
				description: 'Format, check, and test every change.'
				pages:       [
					Page{
						title: 'Format, vet, test'
						body:  cli_loop
						code:  Example{ files: [cli_example_file] }
					},
				]
			},
			Lesson{
				slug:        'vpm'
				title:       'Packages with vpm'
				description: 'Find and install libraries.'
				pages:       [
					Page{
						title: 'Packages'
						body:  vpm_packages
						code:  Example{ files: [vpm_example_file] }
					},
				]
			},
			Lesson{
				slug:        'mcp'
				title:       'Agents with v mcp'
				description: 'Expose the compiler to coding agents.'
				pages:       [
					Page{
						title: 'The model context protocol'
						body:  mcp_server
						code:  Example{ files: [mcp_example_file] }
					},
				]
			},
			Lesson{
				slug:        'skills'
				title:       'Guidance with v skills'
				description: 'Installable instructions for agents.'
				pages:       [
					Page{
						title: 'Skills'
						body:  skills_list
						code:  Example{ files: [skills_example_file] }
					},
				]
			},
		]
	}
}

const cli_example_file = CodeFile{
	name: 'cli_example.v'
	body: $embed_file('examples/cli_example.v').to_string()
}

const vpm_example_file = CodeFile{
	name: 'vpm_example.v'
	body: $embed_file('examples/vpm_example.v').to_string()
}

const mcp_example_file = CodeFile{
	name: 'mcp_example.v'
	body: $embed_file('examples/mcp_example.v').to_string()
}

const skills_example_file = CodeFile{
	name: 'skills_example.v'
	body: $embed_file('examples/skills_example.v').to_string()
}

const cli_loop = '<h2>Everyday commands</h2>
<p>Three commands run on almost every change. <code>v fmt -w .</code>
formats the project in place, <code>v vet .</code> reports suspicious
constructs, and <code>v test .</code> runs the test suite:</p>
<pre><code>v fmt -w .
v vet .
v test .</code></pre>
<p>Format before every commit, so review never argues about layout.</p>
<p><code>v doc strings</code> shows a module&rsquo;s documentation,
<code>v repl</code> opens an interactive prompt, and
<code>v watch run main.v</code> rebuilds and reruns whenever a source file
changes.</p>'

const vpm_packages = '<h2>Packages</h2>
<p>Libraries live in the package registry. Search it, inspect a result, and
install it:</p>
<pre><code>v search markdown
v show markdown
v install markdown</code></pre>
<p><code>v list</code> shows what the project depends on.
<code>v outdated</code> reports newer versions, <code>v update</code> fetches
them, and <code>v remove</code> drops one.</p>
<p>These commands reach the network, so they run on your machine rather than
in this tour&rsquo;s sandbox.</p>'

const mcp_server = '<h2>v mcp</h2>
<p><code>v mcp serve</code> exposes the compiler itself to a coding agent:
declarations, references, and diagnostics over standard input and
output:</p>
<pre><code>v mcp serve</code></pre>
<p><code>v mcp tools</code> lists what is exposed. Serve over HTTP instead
with <code>--http</code>, resolve relative paths against a directory with
<code>--root</code>, and register no file-writing tools with
<code>--read-only</code>.</p>
<p><code>v mcp install</code> wires the server into an agent client, and
<code>v mcp uninstall</code> removes it. This surface is new, so it needs a
recent V rather than the release this sandbox runs.</p>'

const skills_list = '<h2>v skills</h2>
<p>Skills are bundled instructions an agent loads for a task: the language
rules, the test loop, the tool surface:</p>
<pre><code>v skills list
v skills add v-tools
v skills update</code></pre>
<p>Skills install into <code>.agents/skills/</code> in the project, or under
your home directory with <code>--global</code>.
<code>v skills path v-tools</code> shows where one lives, and
<code>--dry-run</code> reports without writing anything.</p>
<p>Like <code>v mcp</code>, this is new surface: it needs a recent V.</p>'
