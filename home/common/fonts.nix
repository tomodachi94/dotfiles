{ config, pkgs, lib, ... }:
{
  fonts.fontconfig.enable = config.local.eagerSetup.enableGraphicalApps;

  home.packages = lib.mkIf config.local.eagerSetup.enableGraphicalApps (with pkgs; [
    nerd-fonts.blex-mono
    noto-fonts-cjk-sans # Japanese
    atkinson-hyperlegible
  ]);
}
