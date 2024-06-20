{ pkgs, tomolib, ... }:
{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.telescope-nvim;
      config = ''
        require("lz.n").load {
          "telescope",
          cmd = "Telescope",
        }
      '';
      type = "lua";
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.trouble-nvim;
      config = ''
        require("lz.n").load {
          "trouble",
          cmd = {
            "Trouble",
            "TroubleClose",
            "TroubleToggle",
            "TroubleRefresh",
          },
          after = function()
            require("trouble").setup()
          end,
        }
      '';
      type = "lua";
      optional = true;
    }
  ];
}


