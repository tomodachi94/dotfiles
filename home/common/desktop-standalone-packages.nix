{ pkgs, lib, config, inputs, ... }:
{
  home.packages = lib.mkIf config.local.eagerSetup.enableGraphicalApps [
    pkgs.discord
    pkgs.obsidian
    pkgs.spotube
    inputs.bitwarden-dmenu.packages.${pkgs.stdenvNoCC.hostPlatform.system}.bwmenu
  ];
}
