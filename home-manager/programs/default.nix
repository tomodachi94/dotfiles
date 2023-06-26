{ environment, config, pkgs, lib, ... }:
{
  imports = [
    ./atuin.nix
    ./direnv.nix
    ./git.nix
    ./gnome-terminal.nix
    ./helix.nix
    ./i3.nix
    ./nnn.nix
    ./starship.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
