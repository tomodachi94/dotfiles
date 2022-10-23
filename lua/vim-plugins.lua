require "paq" {
    "savq/paq-nvim";
    "tomodachi94/vim-mediawiki-editor"; -- MediaWiki support
    "chikamichi/mediawiki.vim";
    "sirver/UltiSnips"; -- snippets
    {"dracula/vim", as="dracula"}; -- theme
    "NoahTheDuke/vim-just";
    {"neoclide/coc.nvim", branch="release"}; -- autocompletion support
}

-- setup theming since this is the best spot for it
vim.cmd('syntax enable')
vim.cmd('colorscheme dracula')
