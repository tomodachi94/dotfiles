{ pkgs, lib, config, ... }:
lib.mkIf (config.local.system.linux && config.local.eagerSetup.enableGraphicalApps) {
  xdg.configFile."i3status-rust/config.toml".source = ./config.toml;

  home.packages = [
    pkgs.i3status-rust
  ];
}
