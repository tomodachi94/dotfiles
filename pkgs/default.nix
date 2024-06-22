{ pkgs, ... }:
let
  cp = pkgs.callPackage;
in
{
  crossover = cp ./all/crossover.nix { };
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
  doctoc = cp ./all/doctoc.nix { };
  ultisnips-vscode = cp ./all/ultisnips-vscode.nix { };
}
