# FIXME: The bookmarks option doesn't appear to have an effect.
{ pkgs, tomopkgs, ... }:
let
  mkBookmarkletFile = file: pkgs.stdenvNoCC.mkDerivation {
    name = builtins.baseNameOf file;
    src = file;
    dontUnpack = true;
    nativeBuildInputs = [
      tomopkgs.${pkgs.system}.mrcoles-bookmarklet
    ];
    buildPhase = ''
      bookmarklet "$src" "$out"
    '';
  };
  mkMark = attrs: {
    inherit (attrs) name;
    tags = [ "bookmarklet" ] ++ attrs.tags or [ ];
    url = builtins.readFile (mkBookmarkletFile attrs.file);
  };
in
{
  programs.librewolf.profiles.default.bookmarks = [{
    name = "bookmarklets";
    toolbar = true;
    bookmarks = [
      (mkMark {
        name = "Check web archives";
        file = ./check_web_archives.js;
      })
    ];
  }];
}
