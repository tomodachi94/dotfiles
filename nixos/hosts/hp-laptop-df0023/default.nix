{ homeInputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
    ../../base
    ../../workstation
  ];

  home-manager.users.me = { ... }: {
    imports = [ ../../../home/common ../../../home/linux ];
  };

  home-manager.extraSpecialArgs = homeInputs;

  home-manager.useUserPackages = true;

  hardware.bluetooth.enable = true;

  networking.hostName = "hp-laptop-df0023"; # Define your hostname.
}
