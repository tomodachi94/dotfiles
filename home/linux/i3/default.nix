{ pkgs, vars, ... }:
{
  xdg.configFile."i3/config" = {
    text = ''
      ## start manual config ##
      set $wallpaper_path "${./wallpaper.png}"
      set $font "${vars.font.monospace}"
      include ${./all.config}
      include ${./background.config}
      include ${./programs.config}
      include ${./keybinds.config}
      include ${./bar.config}
      ## end manual config ##
    '';
    onChange = ''
      	  if [ ${pkgs.lib.getExe pkgs.xorg.xprop} -root | ${pkgs.lib.getExe pkgs.gnugrep} i3 ]; then
      	    noteEcho "Reloading i3 to apply changes"
      	    ${pkgs.i3}/bin/i3-msg reload
      	  else
      	    warnEcho "i3 not running, skipping reload..."
      	  fi
      	'';
  };

  home.file.".background-image".source = ./wallpaper.png;
  # For cleanliness, this contains any packages that are exclusively used in this configuration.
  home.packages = with pkgs; [
    xss-lock
    brightnessctl
    lightlocker
    dbus
    pulseaudioFull
    xclip
    scrot
    feh
    dmenu
  ];
}
