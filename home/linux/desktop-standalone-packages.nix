{ pkgs, tomolib, ... }:
let
  firejailWrappers = tomolib.firejailWrappers { inherit pkgs; };
in
{
  home.packages = [
    pkgs.lxqt.qps
    pkgs.vscodium-fhs # GUI IDE
    pkgs.zotero
  ];
}
