{ pkgs, ... }:
{
  services.flatpak = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-shana
    ];
    config.common = {
      default = [
        "shana"
      ];
      "org.freedesktop.impl.portal.FileChooser" = [
        "gtk"
      ];
    };
  };
}
