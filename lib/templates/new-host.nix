{ config, homeInputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../base
    # ../../workstation
  ];

  networking.hostName = "CHANGEME"; # FIXME: Define your hostname.

  /*
    home-manager.users.me = { ... }: {
    imports = [ ../../../home/common ../../../home/linux ];
    };
    home-manager.extraSpecialArgs = homeInputs;
    home-manager.useUserPackages = true;
  */

  # hardware.bluetooth.enable = true;

  # hardware.cpu.intel.updateMicrocode = true;

  /*
    services.fwupd = {
    enable = true;
    };
  */

  /*
    services.smartd = {
    enable = true;
    notifications.x11.enable = true;
    devices = [
      {
        device = "/dev/sda";
      }
    ];
    };
  */
}
