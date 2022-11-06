require "paq" {
    "savq/paq-nvim";
    "aquach/vim-mediawiki-editor"; -- MediaWiki support
    "chikamichi/mediawiki.vim";
    "sirver/UltiSnips"; -- snippets
    "vim-airline/vim-airline";
    "liuchengxu/vim-which-key";
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
