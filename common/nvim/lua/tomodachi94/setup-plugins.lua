local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
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
