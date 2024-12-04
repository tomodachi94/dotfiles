{ pkgs, lib, config, ... }:
lib.mkIf config.local.system.darwin {
  home.packages = [
    pkgs.iterm2
  ];
}
