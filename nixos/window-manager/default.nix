{
  imports = [ ./sound.nix ];
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    windowManager.i3.enable = true;
  };
}
