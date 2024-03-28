{ config, pkgs, xdg, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
in
{
  imports = [ ./nix ];
  home.sessionVariables = {
    EDITOR = "${pkgs.lib.getExe pkgs.neovim}";
    VISUAL = "${pkgs.lib.getExe pkgs.neovim}";
  };
  xdg.configFile."nvim/lua".source = ./lua;
  xdg.configFile."nvim/snips".source = ./snips;
  xdg.configFile."nvim/spell".source = ./spell;
  xdg.configFile."nvim/vimscript".source = ./vimscript;
  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lazy-lock.json".source = mkOutOfStoreSymlink "${dotfilesDir}/home/common/nvim/lazy-lock.json";
}
