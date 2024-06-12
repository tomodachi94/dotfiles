{ pkgs, ... }:
{
  xdg.configFile."i3status-rust/config.toml".source = ./config.toml;

  home.packages = [
    pkgs.i3status-rust
  ];
}
