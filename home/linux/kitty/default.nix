{ lib, config, ... }:
lib.mkIf config.local.system.linux {
  xdg.configFile."kitty".source = ./.;
}
