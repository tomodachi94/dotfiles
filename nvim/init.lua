-- loads old vimscript things
vim.cmd("source ~/.config/nvim/vimscript/no-autoload/source-vimscript.vim")

require("options")
require("plugins")
require("keybinds")
require("conf.mediawiki-editor")
require("conf.mediawiki-editor-creds")
require("conf.ultisnips")
