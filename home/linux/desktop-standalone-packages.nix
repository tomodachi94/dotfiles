{ pkgs, config, lib, tomopkgs, tomolib, ... }:
let
  firejailWrappers = tomolib.firejailWrappers { inherit pkgs; };
in
{
  home.packages = lib.optionals (config.local.system.linux && config.local.eagerSetup.enableGraphicalApps) [
    pkgs.lxqt.qps
    pkgs.zotero
    pkgs.naps2
    # tomopkgs.${pkgs.system}.crosshair-dot
  ];
}
