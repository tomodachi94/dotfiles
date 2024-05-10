{ pkgs, ... }:
{
  home.packages = [
    pkgs.prismlauncher
    pkgs.lutris # Launcher for Windows-only games
  ];
}
