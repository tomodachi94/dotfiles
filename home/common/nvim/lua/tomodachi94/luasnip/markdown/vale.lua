local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
	s(
		{
			trig = "<!-- vale",
			dscr = "add an exception to a Vale rule",
		},
		fmt("<!-- vale {} = NO -->\n{}\n<!-- vale {} = YES -->", {
			i(1, ""),
			i(2, ""),
			rep(1, ""),
		})
	),
}
