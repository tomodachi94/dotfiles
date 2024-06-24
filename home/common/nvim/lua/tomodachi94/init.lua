-- This code is in the lua/tomodachi94 directory so that the code remains self-contained.
-- The root init.lua should require() this code.

-- loads old vimscript things
vim.cmd("source ~/.config/nvim/vimscript/no-autoload/source-vimscript.vim")

require("tomodachi94.options")
require("tomodachi94.keybinds")
require("tomodachi94.autocmds")
require("tomodachi94.setup-plugins")
require("tomodachi94.filetype.mcmeta")
require("tomodachi94.filetype.gemrc")
require("tomodachi94.filetype.rvmrc")
