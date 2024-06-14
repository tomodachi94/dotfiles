{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [ ];
  };
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
