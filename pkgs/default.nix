{ pkgs, ... }:
let
  cp = pkgs.callPackage;
in
{
  awesome-lint = cp ./all/awesome-lint { };
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
}
