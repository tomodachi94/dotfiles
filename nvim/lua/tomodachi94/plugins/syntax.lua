--- Primary file for all syntax highlighting
-- Plugins whose primary function is to do something else should go into a new file
-- Otherwise, this is the place.

local syntax = {}
syntax[1] = { "vmchale/dhall-vim", lazy = true, ft = "dhall" }
syntax[2] = { "chikamichi/mediawiki.vim", lazy = true, ft = "mediawiki" }
syntax[3] = { "NoahTheDuke/vim-just", lazy = true, ft = "just" }

return syntax
