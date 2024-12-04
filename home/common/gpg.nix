{ config, ... }:
{
  programs.gpg = {
    enable = config.local.eagerSetup.enableExtendedCli;
  };
}
