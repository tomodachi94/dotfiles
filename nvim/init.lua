-- loads old vimscript things
vim.cmd("source ~/.config/nvim/vimscript/no-autoload/source-vimscript.vim")

require("tomodachi94.setup-plugins")
require("tomodachi94.options")
require("tomodachi94.keybinds")
require("tomodachi94.filetype.mcmeta")
require("tomodachi94.filetype.gemrc")
require("tomodachi94.filetype.rvmrc")
require("tomodachi94.conf.mediawiki-editor")
require("tomodachi94.conf.mediawiki-editor-creds")
require("tomodachi94.conf.ultisnips")
