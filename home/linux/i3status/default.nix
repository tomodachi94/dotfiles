{ config, lib, ... }:
lib.mkIf config.local.system.linux {
  xdg.configFile."i3status".source = ./.;
}
