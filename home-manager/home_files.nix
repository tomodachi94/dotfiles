{ xdg, ... }:
{
  xdg.configFile."albert/albert.conf".source = ../albert/albert.conf;
  xdg.configFile."bat".source = ../bat;
  xdg.configFile."emacs".source = ../emacs;
  xdg.configFile."i3status".source = ../i3status;
  xdg.configFile."kitty".source = ../kitty;
  xdg.configFile."neofetch".source = ../neofetch;
  # xdg.configFile."nixpkgs".source = ../nixpkgs;
  xdg.configFile."readline".source = ../readline;
  home.file.".Xmodmap".source = ../xorg/Xmodmap;
  home.file.".zsh".source = ../zsh/config;
}
