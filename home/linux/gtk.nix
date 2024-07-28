{ pkgs, ... }:
{
  gtk = {
    enable = true;
    # cursorTheme.package = pkgs.vanilla-dmz;
    # cursorTheme.name = "Vanilla-DMZ";
    # cursorTheme.size = 23;
    # font.package = pkgs.ibm-plex;
    # font.name = "IBM Plex Sans";
    # font.size = 10;
    theme.package = pkgs.lib.mkForce pkgs.adwaita-icon-theme;
    theme.name = pkgs.lib.mkForce "Adwaita-dark";
    iconTheme.package = pkgs.lib.mkForce pkgs.mint-y-icons;
    iconTheme.name = pkgs.lib.mkForce "Mint-Y-Dark-Grey";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-button-images = 0;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = 1;
      gtk-enable-event-sounds = 0;
      gtk-enable-input-feedback-sounds = 0;
      gtk-menu-images = 1;
      gtk-primary-button-warps-slider = 0;
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk3.extraCss = ''
      style "cs-scrollbar-style" {
        GtkScrollbar::slider-width = 10
      }

      class "GtkScrollbar" style "cs-scrollbar-style"
    '';
  };

  stylix.targets.gtk.enable = true;
}
