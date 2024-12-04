{ pkgs, tomopkgs, config, ... }:
{
  services.volnoti = {
    enable = config.local.system.linux && config.local.eagerSetup.enableGraphicalApps;
    package = tomopkgs.${pkgs.system}.volnoti;
  };
}
