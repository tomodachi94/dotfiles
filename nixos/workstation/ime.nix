{ pkgs, ... }:
{
  # Setup Japanese keyboard
  i18n.inputMethod = {
    # FIXME: bring this back
    enable = false;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
}
