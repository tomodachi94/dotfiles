require "paq" {
    "savq/paq-nvim";
    "tomodachi94/vim-mediawiki-editor"; -- MediaWiki support
    "chikamichi/mediawiki.vim";
    "sirver/UltiSnips"; -- snippets
    "vim-airline/vim-airline";
    "nvim-tree/nvim-web-devicons";
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope.nvim";
    {"dracula/vim", as="dracula"}; -- theme
    "NoahTheDuke/vim-just";
    {"neoclide/coc.nvim", branch="release"}; -- autocompletion support
}

-- setup theming since this is the best spot for it
vim.cmd('syntax enable')
vim.cmd('colorscheme dracula')
