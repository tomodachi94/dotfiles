local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local function fmtmw(string, nodes, opts)
	opts = opts or {}
	opts["delimiters"]:insert("$$")
	fmt(string, nodes, opts)
end

return {
	s(
		{ trig = "aboutl", dscr = "Transclude the {{About}} template" },
		fmtmw("{{About{{L}}|$${{L}}|<translate>$$</translate>}}", { i(1), rep(1) })
	),
	s(
		{ trig = "imod", dscr = "Transclude the {{Infobox mod}} template" },
		fmtmw(
			[[{{Infobox mod
|name=$$
|image=Modicon $$.png
|modloader={{L|$$}}
|author=$$
|version=$$
|mcversion=$$
|url=$$
}}

$$
]],
			{ i(1), rep(1), i(2), i(3), i(4), i(5), i(6), i(0) }
		)
	),
	s(
		{ trig = "pageend", dscr = "Add various endmatter to a page" },
		fmtmw(-[[{{Navbox $$}}

[[Category:$$\]\]

<languages />
]])
	),
}
