{ config, ... }:
{
  programs.gh = {
    enable = config.local.eagerSetup.enableExtendedCli;
    gitCredentialHelper.enable = false;
  };
}
