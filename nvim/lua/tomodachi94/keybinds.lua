vim.g.mapleader = ' '

vim.keymap.set("n", "<Esc>", ":nohl<CR>:echo<CR>") -- Clear highlighting and buffer

-- Convinience functions for yanking/putting
vim.keymap.set("n", "<Leader>y", "*y")
vim.keymap.set("n", "<Leader>p", "*p")
vim.keymap.set("n", "<Leader>Y", "+y")
vim.keymap.set("n", "<Leader>P", "+p")

vim.keymap.set("n", "<Leader>fd", vim.cmd.NERDTreeToggle)
