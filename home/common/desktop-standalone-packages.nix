{ pkgs, lib, config, bitwarden-dmenu, ... }:
{
  home.packages = lib.mkIf config.local.eagerSetup.enableGraphicalApps [
    pkgs.discord
    pkgs.obsidian
    pkgs.spotube
    bitwarden-dmenu.packages.${pkgs.stdenvNoCC.hostPlatform.system}.bwmenu
  ];
}
