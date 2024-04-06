local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("tomodachi94.plugins") -- Setup plugins and their configuration

-- Setup theme
vim.cmd("syntax enable")
vim.cmd.colorscheme("catppuccin")

-- Setup keybinds
vim.keymap.set("n", "<Leader>pp", require("lazy").home)
vim.keymap.set("n", "<Leader>pc", require("lazy").check)
vim.keymap.set("n", "<Leader>px", require("lazy").clean)
vim.keymap.set("n", "<Leader>pu", require("lazy").update)
vim.keymap.set("n", "<Leader>ps", require("lazy").sync)
