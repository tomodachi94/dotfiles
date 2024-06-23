{ pkgs, bitwarden-dmenu, ... }:
{
  home.packages = [
    pkgs.discord
    pkgs.obsidian
    pkgs.spotube
    pkgs.liferea
    bitwarden-dmenu.packages.${pkgs.system}.bwmenu
  ];
}
