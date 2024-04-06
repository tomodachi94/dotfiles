{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerdfonts
    noto-fonts-cjk-sans # Japanese
  ];
}
