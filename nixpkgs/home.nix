{ environment, config, pkgs, lib, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  
  home.packages = [
    # pkgs.home-manager
    pkgs.zsh # Shell
    pkgs.git # Version control
    pkgs.neovim # Text editor
    pkgs.vivaldi # Web browser
    pkgs.exa # Better ls
    pkgs.ripgrep # Better grep
    pkgs.bat # Better cat
    pkgs.kitty # Terminal

    pkgs.vscodium-hfs # GUI IDE

    # Chat
    pkgs.discord
    pkgs.element-desktop
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

  # Let Home Manager manage Nix and Nixpkgs for us
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

}
