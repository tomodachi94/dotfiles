{
  imports = [ ./sound.nix ];
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the LightDM desktop manager.
	displayManager.defaultSession = "none+i3";
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
  };
}
