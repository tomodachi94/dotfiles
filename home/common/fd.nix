{ config, ... }:
{
  programs.fd = {
    enable = config.local.eagerSetup.enableExtendedCli;
  };
}
