{ pkgs, ... }:
{
  home.packages = [
    pkgs.coreutils
    pkgs.neovim
    pkgs.renameutils
    pkgs.bitwarden-cli
  ];
}
