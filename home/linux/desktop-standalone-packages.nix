{ pkgs, config, lib, tomopkgs, tomolib, ... }:
let
  firejailWrappers = tomolib.firejailWrappers { inherit pkgs; };
in
{
  home.packages = lib.optionals config.local.eagerSetup.enableGraphicalApps [
    pkgs.lxqt.qps
    pkgs.zotero
    tomopkgs.${pkgs.system}.crosshair-dot
  ];
}
