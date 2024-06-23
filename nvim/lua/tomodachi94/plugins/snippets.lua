-- LuaSnip configuration

local M = { "L3MON4D3/LuaSnip", event = { "InsertEnter" }, build = "make install_jsregexp", }

-- Source: https://www.reddit.com/r/neovim/comments/zrcrv1/luasnip_tab_as_expandjump_trigger/j12xw3x/#c
local function luasnip_tab()
	local luasnip = require("luasnip")
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false) -- Feed <Tab> back to Neovim
	end
end

function M.config()
	vim.keymap.set({ "i", "s" }, "<Tab>", luasnip_tab, { silent = true })

	-- Load the snippets last
	require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
end

return { M }
