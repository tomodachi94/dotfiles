-- loads old vimscript things
vim.cmd("source ~/.config/nvim/vimscript/no-autoload/source-vimscript.vim")

require("plugins")
require("options")
require("keybinds")
require("filetype.mcmeta")
require("filetype.gemrc")
require("conf.mediawiki-editor")
require("conf.mediawiki-editor-creds")
require("conf.ultisnips")
