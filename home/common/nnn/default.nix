{ pkgs, ... }:
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
