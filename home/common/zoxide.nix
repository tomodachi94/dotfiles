{ config, ... }:
{
  programs.zoxide = {
    enable = config.local.eagerSetup.enableExtendedCli;
    enableZshIntegration = true;
  };
}
