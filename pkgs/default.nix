{ pkgs, ... }:
let
  cp = pkgs.callPackage;
in
{
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
}
