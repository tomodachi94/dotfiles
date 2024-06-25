---Keyboard-related things.
--This file is for key (re)mapping that doesn't involve plugins.
--Plugin keybinds should go into their own file.
--Other files that have keybinds: [ setup-plugins.lua, plugins/*.lua ]
local uniqueKeymap = require("tomodachi94.util").uniqueKeymap

vim.g.mapleader = " "

uniqueKeymap("n", "<Esc>", ":nohl<CR>:echo<CR>") -- Clear highlighting and buffer

-- Convinience functions for yanking/putting
uniqueKeymap("n", "<Leader>y", "*y")
uniqueKeymap("n", "<Leader>p", "*p")
uniqueKeymap("n", "<Leader>Y", "+y")
uniqueKeymap("n", "<Leader>P", "+p")

uniqueKeymap("n", "<Leader>fd", vim.cmd.NERDTreeToggle)

-- Be smart.
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Qa! qa!")
vim.cmd("cnoreabbrev QA! qa!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Q! q!")

vim.cmd("xnoremap j gj")
vim.cmd("xnoremap k gk")
vim.cmd("xnoremap <Down> gj")
vim.cmd("xnoremap <Up> gk")

-- Keep the register clean when using `dd`
uniqueKeymap("n", "dd", function()
	if vim.fn.getline(".") == "" then
		return '"_dd'
	end
	return "dd"
end, { expr = true })
