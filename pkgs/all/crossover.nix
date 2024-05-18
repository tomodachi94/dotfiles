{ appimageTools, fetchurl, lib }:
let
  pname = "crossover";
  version = "3.3.4";

  src = fetchurl {
    url = "https://github.com/lacymorrow/crossover/releases/download/v${version}/CrossOver-${version}-x86_64.AppImage";
    hash = "sha256-q9QpfUYerAsghTbEV9d1W+O2Jjv61UiEKsNEpoKXn0E=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
  meta = with lib; {
    license = licenses.cc-by-nc-sa-40;
    maintainers = with maintainers; [ tomodachi94 ];
    homepage = "https://lacymorrow.github.io/crossover";
    platforms = [ "linux-x86_64" ];
  };
}
