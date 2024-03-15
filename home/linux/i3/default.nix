{ pkgs, xdg, ... }:
{
  xdg.configFile."i3/config".text = ''
    set $wallpaper_path "${./wallpaper.png}"
    ${builtins.readFile ./config}
  '';
  # For cleanliness, this contains any packages that are exclusively used in this configuration.
  home.packages = with pkgs; [
  	xss-lock
	networkmanagerapplet
	brightnessctl
	lightlocker
	dbus
	pulseaudioFull
	xclip
	scrot
	dunst
	feh
	dmenu
  ];
}
