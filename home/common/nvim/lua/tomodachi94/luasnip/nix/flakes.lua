local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	s({ trig = "inputs.nixpkgs.follows", dscr = "override a flake input's nixpkgs with our own" }, {
		t('inputs.nixpkgs.follows = "nixpkgs";'),
	}),
}
