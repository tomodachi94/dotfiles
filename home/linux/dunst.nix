{ config, ... }:
{
  services.dunst = {
    enable = config.local.system.linux && config.local.eagerSetup.enableGraphicalApps;
  };

  stylix.targets.dunst.enable = true;
}
