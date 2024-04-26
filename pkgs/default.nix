{ pkgs, ... }:
let
  cp = pkgs.callPackage;
in
{
  # awesome-lint = cp ./all/awesome-lint { };
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
  hugo-bearblog = cp ./all/hugo-bearblog.nix { };
  ultisnips-vscode = cp ./all/ultisnips-vscode.nix { };
}
