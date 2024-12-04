{ lib, config, ... }:
{
  services.blueman-applet = {
    enable = config.local.system.linux && config.local.eagerSetup.enableGraphicalApps;
  };

  dconf.settings = {
    "org/blueman/plugins/powermanager" = {
      auto-power-on = false;
    };
  };
}
