-- hacky hack to source existing vimscript configuration
local source_vimscript_things =[[for file in split(glob("~/.config/nvim/" .. "vimscript/*.vim"), "\n")
  execute "source" file
endfor"]]

vim.cmd("source ~/.config/nvim/source-vimscript.vim")

require("vim-plugins")
require("vim-mediawiki-editor")
require("vim-ultisnips")

--[[if has("autocmd")
  filetype indent plugin on
endif]]
