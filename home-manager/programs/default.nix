{ environment, config, pkgs, lib, ... }:
{
  imports = [
    ./atuin.nix
    ./direnv.nix
    ./gnome-terminal.nix
    ./nnn.nix
    ./starship.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
