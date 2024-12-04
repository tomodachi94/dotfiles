{ config, pkgs, ... }:
{
  programs.nnn = {
    enable = config.local.eagerSetup.enableExtendedCli;
    plugins = {
      src = "${pkgs.nnn.src}/plugins";
      mappings = {
        d = "diffs";
      };
    };
  };
}
