{ pkgs, inputs }:
let
  cp = pkgs.lib.customisation.callPackageWith (pkgs // { inherit inputs; });
in
{
  "3ds" = cp ./all/3ds.nix { };
  awesome-lint = cp ./all/awesome-lint { };
  get-ro-ids = cp ./all/get-ro-ids.nix { };
  mrcoles-bookmarklet = cp ./all/mrcoles-bookmarklet.nix { };
  spodcast = cp ./all/spodcast.nix { };
  srg2source = cp ./all/srg2source.nix { };
  ultisnips-vscode = cp ./all/ultisnips-vscode.nix { };
  wpcleaner = cp ./all/wpcleaner { };
  wrapper-nvim = cp ./all/wrapper-nvim { };
  zsh-window-title = cp ./all/zsh-window-title.nix { };
} // pkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
  crossover = cp ./linux/crossover.nix { };
  crosshair-dot = cp ./linux/crosshair-dot.nix { };
  hp-linuxtools = cp ./linux/hp-linuxtools.nix { };
  hudkit = cp ./linux/hudkit.nix { };
  ircam-viewer = cp ./linux/ircam-viewer.nix { };
} // pkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
  developercolorpicker = cp ./darwin/developercolorpicker.nix { };
}
