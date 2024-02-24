{ environment, config, pkgs, lib, ... }:
{
  home.sessionVariables = {
    RIPGREP_CONFIG_PATH = ./config;
  };
}
