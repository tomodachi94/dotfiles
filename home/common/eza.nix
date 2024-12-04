{ config, pkgs, ... }:
{
  programs.eza = {
    enable = config.local.eagerSetup.enableExtendedCli;
    enableZshIntegration = pkgs.lib.mkForce false; # Has some aliases that I do not want
  };
}
