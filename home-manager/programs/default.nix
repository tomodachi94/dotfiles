{ environment, config, pkgs, lib, ... }:
{
  imports = [
    ./atuin.nix
    ./direnv.nix
    ./git.nix
    ./gnome-terminal.nix
    ./nnn.nix
    ./starship.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
