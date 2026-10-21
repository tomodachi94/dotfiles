{ config, pkgs, tomopkgs, lib, ... }:
{
  config = lib.mkIf config.local.eagerSetup.enableHeavyDevelop {
    home.packages = [ tomopkgs.${pkgs.system}.wrapper-nvim ];
  };
}
