{ pkgs, ... }:
{
  home.packages = [
    pkgs.lxqt.qps
    pkgs.vscodium-fhs # GUI IDE
    pkgs.librewolf # Web browser
    pkgs.zotero
  ];
}
