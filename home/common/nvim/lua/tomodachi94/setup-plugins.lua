local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("tomodachi94.plugins") -- Setup plugins and their configuration

-- Setup theme
vim.cmd("syntax enable")
vim.cmd.colorscheme("catppuccin")

-- Setup keybinds
local uniqueKeymap = require("tomodachi94.util").uniqueKeymap
uniqueKeymap("n", "<Leader>pp", require("lazy").home)
uniqueKeymap("n", "<Leader>pc", require("lazy").check)
uniqueKeymap("n", "<Leader>px", require("lazy").clean)
uniqueKeymap("n", "<Leader>pu", require("lazy").update)
uniqueKeymap("n", "<Leader>ps", require("lazy").sync)
