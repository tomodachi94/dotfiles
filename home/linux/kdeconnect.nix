{ config, ... }:
{
  services.kdeconnect = {
    enable = config.local.system.linux && config.local.eagerSetup.enableGraphicalApps;
  };
}
