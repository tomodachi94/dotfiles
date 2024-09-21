{ pkgs, tomopkgs, tomolib, ... }:
let
  firejailWrappers = tomolib.firejailWrappers { inherit pkgs; };
in
{
  home.packages = [
    pkgs.lxqt.qps
    pkgs.zotero
    tomopkgs.${pkgs.system}.crosshair-dot
  ];
}
