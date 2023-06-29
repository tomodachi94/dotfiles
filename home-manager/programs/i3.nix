{ pkgs, xdg, ... }:
{
  xdg.configFile."i3/config".source = ../../i3/config;
  xdg.configFile."i3/wallpaper.png".source = ../../i3/wallpaper.png;
  home.packages = with pkgs; [
    networkmanagerapplet
    xss-lock
    brightnessctl
    lightlocker
    pulseaudio
    dbus
    i3status
    scrot
    dunst
    feh
    dmenu
  ];
}
