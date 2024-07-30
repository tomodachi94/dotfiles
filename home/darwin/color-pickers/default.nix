{ pkgs, tomopkgs, ... }:
{
  imports = [ ./module.nix ];
  home.colorPickers = [ tomopkgs.${pkgs.system}.developercolorpicker ];
}
