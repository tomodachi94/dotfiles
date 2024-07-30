{ config, homeInputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../base
    ../../workstation
  ];

  home-manager.users.me = { ... }: {
    imports = [ ../../../home/common ../../../home/linux ];
  };

  home-manager.extraSpecialArgs = homeInputs;

  home-manager.useUserPackages = true;

  hardware.bluetooth.enable = true;

  # This specific CPU benefits from having its microcode updated.
  hardware.cpu.intel.updateMicrocode = true;

  networking.hostName = "ponyo"; # Define your hostname.

  services.fwupd = {
    enable = true;
  };

  services.smartd = {
    enable = true;
    notifications.x11.enable = true;
    devices = [
      {
        device = "/dev/sda";
      }
    ];
  };
}
