{ pkgs, lib, config, ... }:
{
  home.packages = lib.optionals config.local.eagerSetup.enableGames [
    pkgs.prismlauncher
    pkgs.lutris # Launcher for Windows-only games
  ];
}
