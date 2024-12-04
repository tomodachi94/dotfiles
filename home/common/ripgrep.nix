{ config, ... }:
{
  programs.ripgrep = {
    enable = config.local.eagerSetup.enableExtendedCli;
    arguments = [
      "--smart-case"
    ];
  };
}
