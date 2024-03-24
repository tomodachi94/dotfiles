{
  networking = {
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    interfaces.wlp2s0.useDHCP = true;
    # Open ports in the firewall.
    firewall = {
      allowedTCPPorts = [ 22000 ];
      allowedUDPPorts = [ 22000 21027 ];
    };
  };
}
