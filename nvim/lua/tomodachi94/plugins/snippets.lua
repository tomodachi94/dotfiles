-- LuaSnip configuration

local M = { "L3MON4D3/LuaSnip", event = { "InsertEnter" } }

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
	require("luasnip.loaders.from_vscode").lazy_load({ paths = { "../vscode-snippets" } })
	vim.keymap.set({ "i", "s" }, "<Tab>", luasnip_tab, { silent = true })
end

return { M }
