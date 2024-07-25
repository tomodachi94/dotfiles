local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		{
			trig = "programs.*.enable",
			dscr = "enable a module",
		},
		fmt(
			[[{{
  {}.{} = {{
    enable = true;{}
  }};
}}
]],
			{
				i(1, "programs"),
				i(2, ""),
				i(3, ""),
			}
		)
	),
	s(
		{
			trig = "services.*.enable",
			dscr = "enable a module",
		},
		fmt(
			[[{{
  {}.{} = {{
    enable = true;{}
  }};
}}
]],
			{
				i(1, "services"),
				i(2, ""),
				i(3, ""),
			}
		)
	),
	s(
		{
			trig = "enable",
			dscr = "enable a module",
		},
		fmt(
			[[{{
  {}.{} = {{
    enable = true;{}
  }};
}}
]],
			{
				i(1, ""),
				i(2, ""),
				i(3, ""),
			}
		)
	),
}
