{ config, ... }:
{
  services.dunst = {
    enable = config.local.eagerSetup.enableGraphicalApps;
  };

  stylix.targets.dunst.enable = true;
}
