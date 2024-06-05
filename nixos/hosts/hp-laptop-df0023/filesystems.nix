{
  fileSystems = {
    "/home" = {
      mountPoint = "/home";
      device = "/dev/disk/by-label/home_dirs";
    };
    "/".options = [ "noatime" ]; # rest defined in ./hardware-configuration.nix
  };
}
