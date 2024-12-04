{ pkgs, tomopkgs, config, ... }:
{
  services.volnoti = {
    enable = config.local.eagerSetup.enableGraphicalApps;
    package = tomopkgs.${pkgs.system}.volnoti;
  };
}
