{ environment, config, pkgs, lib, ... }:
{
  programs.nnn = {
    enable = true;
    plugins = {
      src = "${pkgs.nnn.src}/plugins";
      mappings = {
        d = "diffs";
      };
    };
  };
}
