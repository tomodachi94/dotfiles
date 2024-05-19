local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local function symbol(friendly_name, trigger, character)
	return s({
		trig = trigger,
		desc = friendly_name .. " symbol (" .. character .. ")",
		regTrig = false,
		priority = 100,
		snippetType = "autosnippet",
	}, {
		t(character),
	})
end

return {
	symbol("Section", "sec", "§"),
	symbol("Em-dash", "--", "—"),
	symbol("Yen", "yen", "￥"),
	symbol("Pound", "pound", "￡"),
	symbol("Euro", "euro", "￡"),
	symbol("Cents", "cent", "￠"),
}
