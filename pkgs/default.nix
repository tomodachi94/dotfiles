{ pkgs, ... }:
let
  cp = pkgs.callPackage;
in
{
  awesome-lint = cp ./all/awesome-lint { };
  crossover = cp ./all/crossover.nix { };
  doctoc = cp ./all/doctoc.nix { };
  ultisnips-vscode = cp ./all/ultisnips-vscode.nix { };
} // pkgs.lib.optionalAttrs pkgs.stdenv.isLinux { } // pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
}
