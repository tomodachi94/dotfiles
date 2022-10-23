vim.cmd("source ~/.config/nvim/vimscript/no-autoload/source-vimscript.vim")

require("vim-plugins")
require("vim-mediawiki-editor")
require("vim-ultisnips")

--[[if has("autocmd")
  filetype indent plugin on
endif]]
