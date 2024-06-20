{ pkgs, ... }:
{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.nerdtree;
      config = ''
        require("lz.n").load {
          "nerdtree",
          cmd = {
            "NERDTree",
            "NERDTreeVCS",
            "NERDTreeFromBookmark",
            "NERDTreeToggle",
            "NERDTreeToggleVCS",
            "NERDTreeFocus",
            "NERDTreeMirror",
            "NERDTreeClose",
            "NERDTreeFind",
            "NERDTreeCWD",
            "NERDTreeRefreshRoot",
          },
          after = require("tomodachi94.plugins.nerdtree"),
        }
      '';
      type = "lua";
      optional = true;
    }
  ];
}
