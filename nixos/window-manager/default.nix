{
  imports = [ ./sound.nix ];
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the LightDM desktop manager.
    displayManager.lightdm = {
      enable = true;
      # TODO: change wallpaper
      greeters.slick = {
        enable = true;
        extraConfig = ''user-background = false'';
      };
    };
    # Enable the i3 window manager.
    windowManager.i3.enable = true;
    desktopManager.runXdgAutostartIfNone = true;

  };
  # picom is a compositor, enabling us to do things like have a transparent window
  services.picom.enable = true;

  stylix.targets.lightdm.enable = true;
}
