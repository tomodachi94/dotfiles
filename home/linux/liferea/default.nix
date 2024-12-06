{ config, ... }:
{
  imports = [ ./module.nix ];

  programs.liferea = {
    enable = config.local.system.linux && config.local.eagerSetup.enableGraphicalApps;
  };
}
