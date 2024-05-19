local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	s({ trig = "package.path" }, {
		t('package.path = "/lib/?;/lib/?.lua;/lib/?/init.lua;" .. package.path'),
	}),
}
