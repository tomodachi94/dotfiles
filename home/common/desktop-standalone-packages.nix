{ pkgs, lib, config, bitwarden-dmenu, ... }:
{
  home.packages = lib.mkIf config.local.eagerSetup.enableGraphicalApps [
    pkgs.discord
    pkgs.obsidian
    pkgs.spotube
    pkgs.liferea
    bitwarden-dmenu.packages.${pkgs.system}.bwmenu
  ];
}
