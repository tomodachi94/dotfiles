{ environment, config, pkgs, lib, ... }:

let
  # nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs; };
in
{
  imports = [ ./home_files.nix ./gtk.nix ./nix_nixpkgs.nix ./xdg.nix ./programs ];

  home.username = "me";
  home.homeDirectory = "/home/me";
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    VISUAL = "${pkgs.neovim}/bin/nvim";
  };

  targets.genericLinux.enable = true;

  home.packages = [
    pkgs.coreutils # Duh
    pkgs.zsh # Shell
    pkgs.git # Version control
    pkgs.neovim # Text editor
    pkgs.vivaldi # Web browser
    pkgs.zoxide # Bounce around
    pkgs.exa # Better ls
    pkgs.fd # Find stuff
    pkgs.ripgrep # Better grep
    pkgs.bat # Better cat
    pkgs.renameutils # Do repetitive stuff faster
    # pkgs.nnn # File manager
    pkgs.starship # Shell prompt
    pkgs.gnome.gnome-terminal
    pkgs.atuin # Better shell history

    pkgs.nerdfonts # Monospaced font with icons

    pkgs.vscodium-fhs # GUI IDE

    # Chat
    pkgs.discord
    pkgs.element-desktop

    # Notes
    pkgs.obsidian
    pkgs.jot

    # Process management
    pkgs.lxqt.qps

    # Recording
    pkgs.kazam
    pkgs.audacity

    # Development
    pkgs.direnv
    pkgs.virtualbox

    pkgs.blueman

    # Specialized tools: FTB Wiki
    pkgs.nur.repos.ftbwiki.ftb-rs

    pkgs.eww
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # I don't have a need for module news
  news.display = "silent";

  # Let HM manage fonts
  fonts.fontconfig.enable = true;

  i18n.inputMethod.enabled = "fcitx5";

  programs.dircolors.enable = true;

  xresources.properties = {
    "Xft.dpi" = 115;
  };

  dconf.enable = true;

  services.dunst = {
    enable = false; # Only works on NixOS; TODO: reenable this when we switch
    configFile = "/home/me/.config/dunst/config";
  };
}
