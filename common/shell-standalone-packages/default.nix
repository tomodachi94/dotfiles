{ pkgs, ... }:
{
  home.packages = [
    pkgs.coreutils # Duh
    pkgs.zsh # Shell
    pkgs.neovim # Text editor
    pkgs.eza # Better ls
    pkgs.fd # Find stuff
    pkgs.ripgrep # Better grep
    pkgs.renameutils # Do repetitive stuff faster
    # pkgs.nnn # File manager
    pkgs.starship # Shell prompt
    pkgs.atuin # Better shell history
    pkgs.direnv
    # pkgs.nur.repos.ftbwiki.ftb-rs
  ];
}
