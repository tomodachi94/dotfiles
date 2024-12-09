{ pkgs, ... }:
let
  cp = pkgs.callPackage;
in
{
  "3ds" = cp ./all/3ds.nix { };
  awesome-lint = cp ./all/awesome-lint { };
  get-ro-ids = cp ./all/get-ro-ids.nix { };
  mrcoles-bookmarklet = cp ./all/mrcoles-bookmarklet.nix { };
  spodcast = cp ./all/spodcast.nix { };
  ultisnips-vscode = cp ./all/ultisnips-vscode.nix { };
  wpcleaner = cp ./all/wpcleaner { };
  zsh-window-title = cp ./all/zsh-window-title.nix { };
} // pkgs.lib.optionalAttrs pkgs.stdenv.isLinux {
  crossover = cp ./linux/crossover.nix { };
  crosshair-dot = cp ./linux/crosshair-dot.nix { };
  ftb-app = cp ./linux/ftb-app.nix { };
  hp-linuxtools = cp ./linux/hp-linuxtools.nix { };
  hudkit = cp ./linux/hudkit.nix { };
} // pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
}
