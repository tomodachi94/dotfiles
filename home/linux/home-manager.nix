{ config, lib, ... }:
lib.mkIf config.local.system.linux {
  home.username = "me";
  home.homeDirectory = "/home/me";
}
