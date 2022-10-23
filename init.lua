vim.cmd("source ~/.config/nvim/vimscript/no-autoload/source-vimscript.vim")

require("plugins")
require("conf-mediawiki-editor")
require("conf-ultisnips")

--[[if has("autocmd")
  filetype indent plugin on
endif]]
