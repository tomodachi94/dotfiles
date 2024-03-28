{ pkgs, ... }:
{
  programs.eza = {
    enable = true;
	enableZshIntegration = pkgs.lib.mkForce false; # Has some aliases that I do not want
  };
}
