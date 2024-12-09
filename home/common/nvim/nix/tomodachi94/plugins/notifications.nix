{ pkgs, config, lib, ... }:
{
  home.packages = lib.optionals (config.local.eagerSetup.enableGraphicalApps && config.local.eagerSetup.enableHeavyDevelop) [
    pkgs.libnotify
  ];
}
