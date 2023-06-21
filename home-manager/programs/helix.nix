{ environment, config, pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "molokai";
    };
  };
}
