require "paq" {
    "savq/paq-nvim";
    "tomodachi94/vim-mediawiki-editor"; -- MediaWiki support
    "chikamichi/mediawiki.vim";
    "sirver/UltiSnips"; -- snippets
    {"neoclide/coc.nvim", branch="release"}; -- autocompletion support
    "quangnguyen30192/cmp-nvim-ultisnips";
    {"dracula/vim", as="dracula"} -- theme
}

-- setup theming since this is the best spot for it
vim.cmd('syntax enable')
vim.cmd('colorscheme dracula')
