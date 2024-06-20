{ pkgs, ... }:
{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.nvim-cmp;
      config = ''
        require("lz.n").load {
          "nvim-cmp",
          event = "InsertEnter",
          after = require("tomodachi94.plugins.nvim-cmp"),
        }
      '';
      type = "lua";
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp-buffer;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp-path;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp-nvim-lsp;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp-buffer;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp_luasnip;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp-git;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.lspkind-nvim;
      optional = true;
    }
  ];
}
