{ config, ... }:
{
  services.copyq = {
    enable = config.local.eagerSetup.enableGraphicalApps;
  };
}
