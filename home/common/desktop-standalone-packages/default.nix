{ pkgs, bitwarden-dmenu, ... }:
{
  home.packages = [
    pkgs.discord
    pkgs.obsidian
    pkgs.spotube
    bitwarden-dmenu.packages.${pkgs.system}.bwmenu
  ];
}
