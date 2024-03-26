{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];

  home-manager.useUserPackages = true;

  networking.hostName = "hp-laptop-df0023"; # Define your hostname.
}
