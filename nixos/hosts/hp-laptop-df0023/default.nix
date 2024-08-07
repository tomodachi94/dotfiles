{ config, homeInputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
    ../../base
    ../../workstation
    ./hpuefi-module.nix
    ./dash2.nix
  ];

  home-manager.users.me = { ... }: {
    imports = [ ../../../home/common ../../../home/linux ];
    xresources.properties = {
      "Xft.dpi" = 122;
    };
  };

  home-manager.extraSpecialArgs = homeInputs;

  home-manager.useUserPackages = true;

  hardware.bluetooth.enable = true;

  # This specific CPU benefits from having its microcode updated.
  hardware.cpu.intel.updateMicrocode = true;

  networking.hostName = "hp-laptop-df0023"; # Define your hostname.

  # This machine does not support hpuefi-mod/hp-linuxtools,
  # but I made a module and didn't want to waste it.
  bios.hpuefi.enable = false;
}
