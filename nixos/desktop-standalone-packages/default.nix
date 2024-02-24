{ pkgs, ... }:
{
  home.packages = [
    pkgs.lxqt.qps
    pkgs.vscodium-fhs # GUI IDE
    pkgs.kazam
    pkgs.blueman
    pkgs.eww
    pkgs.gnome.gnome-terminal # Terminal
    pkgs.vivaldi # Web browser
    pkgs.zotero
  ];
}
