{ pkgs, ... }:
{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.vim-fugitive;
      config = ''
        require("lz.n").load {
          "vim-fugitive",
          cmd = {
            "Gedit",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "Glgrep",
            "GMove",
            "GRename",
            "GDelete",
            "GBrowse",
            "G",
            "Git",
          },
        }
      '';
      type = "lua";
      optional = true;
    }
  ];
}
