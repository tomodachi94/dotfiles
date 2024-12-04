{ config, ... }:
{
  services.gnome-keyring = {
    enable = config.local.eagerSetup.enableGraphicalApps;
  };
}
