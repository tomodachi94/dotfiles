local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"--single-branch",
	"https://github.com/folke/lazy.nvim.git",
	lazypath
  })
end
vim.opt.runtimepath:prepend(lazypath)

local lazy_plugins = {
	{"dracula/vim", name="dracula"}; -- theme

	-- syntax --
	{"vmchale/dhall-vim", lazy = true, ft = "dhall"};
	{"chikamichi/mediawiki.vim", lazy = true, ft = "mediawiki"};
	{"NoahTheDuke/vim-just", lazy = true, ft = "just"};

	-- new features --
	"gpanders/editorconfig.nvim"; -- EditorConfig support
	"sirver/UltiSnips"; -- snippets
	"vim-airline/vim-airline"; -- fancy status bar
	{"liuchengxu/vim-which-key", lazy = true, cmd = "WhichKey"};
	"nvim-tree/nvim-web-devicons";
	{"aquach/vim-mediawiki-editor", lazy = true, cmd = {"MWRead", "MWWrite", "MWDiff", "MWBrowse"}}; -- edit MediaWiki inside of neovim
	"nvim-lua/plenary.nvim";
	{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}, lazy = true, cmd = "Telescope"};
	{"neoclide/coc.nvim", branch="release"}; -- autocompletion support, we should switch to neovim/lspconfig.nvim
}

local lazy_options = {}

require("lazy").setup(lazy_plugins)

-- setup theming since this is the best spot for it
vim.cmd('syntax enable')
vim.cmd('colorscheme dracula')
