{ config, ... }:
{
  services.syncthing = {
    enable = config.local.eagerSetup.enableExtraServices;
  };
}
