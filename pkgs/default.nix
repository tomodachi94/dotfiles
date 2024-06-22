{ pkgs, ... }:
let
  cp = pkgs.callPackage;
in
{
  awesome-lint = cp ./all/awesome-lint { };
  ultisnips-vscode = cp ./all/ultisnips-vscode.nix { };
} // pkgs.lib.optionalAttrs pkgs.stdenv.isLinux {
  crossover = cp ./linux/crossover.nix { };
} // pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
}
