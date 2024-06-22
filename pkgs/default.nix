{ pkgs, ... }:
let
  cp = pkgs.callPackage;
in
{
  awesome-lint = cp ./all/awesome-lint { };
  crossover = cp ./all/crossover.nix { };
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
  doctoc = cp ./all/doctoc.nix { };
  ultisnips-vscode = cp ./all/ultisnips-vscode.nix { };
}
