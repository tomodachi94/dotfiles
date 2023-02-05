vim.g.mapleader = ' '

vim.keymap.set("n", "<Esc>", ":nohl<CR>:echo<CR>") -- Clear highlighting and buffer

-- Convinience functions for yanking/putting
vim.keymap.set("n", "<Leader>y", "*y")
vim.keymap.set("n", "<Leader>p", "*p")
vim.keymap.set("n", "<Leader>Y", "+y")
vim.keymap.set("n", "<Leader>P", "+p")

vim.keymap.set("n", "<Leader>fd", vim.cmd.NERDTreeToggle)

-- Be smart.
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Q! q!")

-- Keep the register clean when using `dd`
vim.keymap.set("n","dd", function ()
	if vim.fn.getline(".") == "" then return '"_dd' end
	return "dd"
end, {expr = true})
