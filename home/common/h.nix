{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.h
  ];

  programs.zsh.initExtra = ". " + pkgs.runCommand "h-zsh-init" { nativeBuildInputs = [ pkgs.h ]; } "h --setup ${config.home.homeDirectory}/git > $out";
}
