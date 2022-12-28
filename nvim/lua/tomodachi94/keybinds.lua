vim.keymap.set("n", "<Esc>", ":nohl<CR>:echo<CR>")

-- Convinience functions for yanking/putting
vim.keymap.set("n", "<Leader>y", "*y")
vim.keymap.set("n", "<Leader>p", "*p")
vim.keymap.set("n", "<Leader>Y", "+y")
vim.keymap.set("n", "<Leader>P", "+p")
