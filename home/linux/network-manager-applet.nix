{ config, ... }:
{
  services.network-manager-applet = {
    enable = config.local.system.linux && config.local.eagerSetup.enableGraphicalApps;
  };
}
