{ environment, config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.discord
    pkgs.obsidian
  ];
}
