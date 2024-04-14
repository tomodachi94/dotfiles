{
  imports = [
    ./atuin
    ./bat
    # ./craftos-pc
    ./desktop-standalone-packages
    ./dircolors
    ./direnv
    ./eza
    ./fonts
    ./git
    ./helix
    ./home-manager
    ./nixpkgs
    ./nnn
    ./nvim
    ./readline
    ./ripgrep
    ./shell-standalone-packages
    ./syncthing
    ./zoxide
    ./zsh

    ../../home-modules
  ];
  programs.neovide.enable = true;
  programs.neovide.settings.wsl = true;
}
