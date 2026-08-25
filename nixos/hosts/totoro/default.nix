{ config, homeInputs, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../base
    ../../workstation
  ];

  home-manager.users.me = _: {
    xresources.properties = {
      "Xft.dpi" = 120;
    };
    local.eagerSetup.enableGraphicalApps = true;
    local.eagerSetup.enableExtendedCli = true;
    local.eagerSetup.enableGames = true;
    local.eagerSetup.enableHeavyDevelop = true;
  };

  hardware.bluetooth.enable = true;

  # This specific CPU benefits from having its microcode updated.
  hardware.cpu.intel.updateMicrocode = true;

  networking.hostName = "totoro"; # Define your hostname.

  services.usbmuxd.enable = true;

  # UEFI Secure Boot
  # boot.loader.systemd-boot.enable = lib.mkForce false;
  # boot.lanzaboote = {
  #   enable = true;
  #   pkiBundle = "/var/lib/sbctl";
  # };
  environment.systemPackages = with pkgs; [
    sbctl
    # libimobiledevice
  ];

  services.fwupd = {
    enable = true;
  };

  services.smartd = {
    enable = true;
    notifications.x11.enable = true;
    devices = [
      {
        device = "/dev/nvme0";
      }
    ];
  };
}
