{ pkgs, ... }:
{
  programs.neovim.plugins = [
    pkgs.vimPlugins.lz-n
  ];
}
