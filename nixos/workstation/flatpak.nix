{ pkgs, ... }:
{
  services.flatpak = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-shana
    ];
    config.common = {
      default = [
        "shana"
      ];
    };
  };
}
