{ config, ... }:
{
  services.kdeconnect = {
    enable = config.local.eagerSetup.enableGraphicalApps;
  };
}
