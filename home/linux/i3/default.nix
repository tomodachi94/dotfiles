{ pkgs, xdg, ... }:
{
  xdg.configFile."i3/config".text = ''
# avoid polluting $HOME with symlinks by setting some paths at the config build stage
set $wallpaper_path "${./wallpaper.png}"
include ${./all.config}
include ${./background.config}
include ${./programs.config}
include ${./keybinds.config}
include ${./bar.config}
  '';
  home.file.".background-image".source = ./wallpaper.png;
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
