{ config, homeInputs, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    ../../base
    ../../workstation
  ];

  home-manager.users.me = { ... }: {
    imports = [ ../../../home/common ../../../home/linux ];
    xresources.properties = {
      "Xft.dpi" = 120;
    };
  };

  home-manager.extraSpecialArgs = homeInputs;

  home-manager.useUserPackages = true;

  hardware.bluetooth.enable = true;

  # This specific CPU benefits from having its microcode updated.
  hardware.cpu.intel.updateMicrocode = true;

  networking.hostName = "ponyo"; # Define your hostname.

  services.usbmuxd.enable = true;

  # UEFI Secure Boot
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
  environment.systemPackages = with pkgs; [
    sbctl
    libimobiledevice
  ];

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
