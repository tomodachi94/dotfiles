{ mac-app-util, ... }:
{
  imports = [
    mac-app-util.homeManagerModules.default
    ./color-pickers.nix
    ./desktop-standalone-packages.nix
    ./git.nix
    ./zsh
  ];
}
