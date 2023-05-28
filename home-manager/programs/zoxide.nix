{ environment, config, pkgs, lib, ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
