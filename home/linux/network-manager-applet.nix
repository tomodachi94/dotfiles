{ config, ... }:
{
  services.network-manager-applet = {
    enable = config.local.eagerSetup.enableGraphicalApps;
  };
}
