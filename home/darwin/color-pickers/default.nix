{ pkgs, tomopkgs, ... }:
{
  imports = [ ./module.nix ];

  home.colorPickers = {
    enable = pkgs.stdenv.hostPlatform.isDarwin;
    colorPickers = [ tomopkgs.${pkgs.system}.developercolorpicker ];
  };
}
