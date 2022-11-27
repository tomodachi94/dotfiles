require "paq" {
    "savq/paq-nvim"; -- let Paq manage itself

    {"dracula/vim", as="dracula"}; -- theme

	-- syntax --
	"vmchale/dhall-vim";
	"gpanders/editorconfig.nvim";
    "chikamichi/mediawiki.vim";
    "NoahTheDuke/vim-just";

	-- new features --
	"sirver/UltiSnips"; -- snippets
    "vim-airline/vim-airline"; -- fancy status bar
    "liuchengxu/vim-which-key";
    "nvim-tree/nvim-web-devicons";
	"aquach/vim-mediawiki-editor"; -- edit MediaWiki inside of neovim
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope.nvim";
    {"neoclide/coc.nvim", branch="release"}; -- autocompletion support, we should switch to neovim/lspconfig.nvim
}

-- setup theming since this is the best spot for it
vim.cmd('syntax enable')
vim.cmd('colorscheme dracula')
