{ config, ... }:
{
  programs.dircolors = {
    enable = config.local.eagerSetup.enableExtendedCli;
  };
}
