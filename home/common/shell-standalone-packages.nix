{ pkgs, config, lib, ... }:
{
  home.packages = lib.mkIf config.local.eagerSetup.enableExtendedCli [
    pkgs.coreutils
    pkgs.neovim
    pkgs.renameutils
    pkgs.bitwarden-cli
  ];
}
