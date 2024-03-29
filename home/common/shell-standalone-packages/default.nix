{ pkgs, ... }:
{
  home.packages = [
    pkgs.coreutils # Duh
    pkgs.neovim # Text editor
    pkgs.fd # Find stuff
    pkgs.ripgrep # Better grep
    pkgs.renameutils # Do repetitive stuff faster
    pkgs.github-cli
    # pkgs.nnn # File manager
    pkgs.starship # Shell prompt
    # pkgs.nur.repos.ftbwiki.ftb-rs
  ];
}
