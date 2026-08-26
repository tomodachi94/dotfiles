{ lib
, stdenv
, fetchFromGitHub
, fetchpatch
, pkg-config
, gtk3
, webkitgtk_4_1
}:

stdenv.mkDerivation rec {
  pname = "hudkit";
  version = "4.1.0";

  src = fetchFromGitHub {
    owner = "anko";
    repo = "hudkit";
    rev = "v${version}";
    hash = "sha256-Itm1CayIkMxwWymirzHOuU/h3+tJ0OFO/jmAH8OIB40=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/swstegall/hudkit/commit/8df873abf073ea66f6da4ad303b9970833f4a8a1.patch";
      hash = "sha256-j7H3cfq5s823qf4ZFByRsKLCxnik1VAZBhp84KoOfO8=";
    })
  ];

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    gtk3
    webkitgtk_4_1
  ];

  installPhase = ''
    install -Dm555 ./hudkit $out/bin/hudkit
  '';

  meta = with lib; {
    description = "Transparent fullscreen on-top click-through WebKit web view, for making cool desktop HUDs";
    homepage = "https://github.com/anko/hudkit";
    license = licenses.isc;
    maintainers = with maintainers; [ ];
    mainProgram = "hudkit";
    platforms = platforms.all;
  };
}
