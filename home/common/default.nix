{ pkgs, lib, config, ... }:
{
  imports = [
    ./atuin.nix
    ./bash.nix
    # ./craftos-pc
    ./desktop-standalone-packages.nix
    ./dircolors.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fonts.nix
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./home-manager.nix
    ./librewolf
    ./nixpkgs
    ./nnn.nix
    ./nvim
    ./readline.nix
    ./ripgrep.nix
    ./shell-standalone-packages.nix
    ./starship.nix
    ./syncthing.nix
    ./zoxide.nix
    ./zsh
  ];

  options.local.eagerSetup.enableGraphicalApps = lib.mkEnableOption "configuration and installation of graphical apps";
  options.local.eagerSetup.enableExtraServices = lib.mkEnableOption "configuration and installation of non-critical background services";
  options.local.eagerSetup.enableExtendedCli = lib.mkEnableOption "configuration and installation of an enhanced, Zsh-based terminal environment";
  options.local.eagerSetup.enableGames = lib.mkEnableOption "configuration and installation of games, typically taking up lots of storage space";
  options.local.eagerSetup.enableHeavyDevelop = lib.mkEnableOption "configuration and installation of heavier parts of the development environment, including LSPs";

  options.local.dotfilesDir = lib.mkOption {
    default = "${config.home.homeDirectory}/dotfiles";
    description = "The absolute path to where this repository lives";
  };

  options.local.system.linux = (lib.mkEnableOption "Linux-only or Linux-specific configuration") // { default = pkgs.stdenvNoCC.hostPlatform.isLinux; };
  options.local.system.darwin = (lib.mkEnableOption "Darwin-only or Darwin-specific configuration") // { default = pkgs.stdenvNoCC.hostPlatform.isDarwin; };
}
