{ pkgs, ... }:
{
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-mozc
    fcitx5-gtk
  ];
  xdg.configFile."fcitx5/profile".source = ./profile;
  xdg.configFile."fcitx5/config".source = ./config;
  xdg.configFile."fcitx5/conf/mozc.conf".source = ./mozc.conf;
  xdg.configFile."fcitx5/conf/notifications.conf".source = ./notifications.conf;
}
