{ pkgs, config, lib, ... }:
{
  home.packages = lib.optionals (config.local.eagerSetup.enableGraphicalApps && lib.mkIf config.local.eagerSetup.enableHeavyDevelop) [
    pkgs.libnotify
  ];
}
