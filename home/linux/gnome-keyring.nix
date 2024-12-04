{ config, ... }:
{
  services.gnome-keyring = {
    enable = config.local.system.linux && config.local.eagerSetup.enableGraphicalApps;
  };
}
