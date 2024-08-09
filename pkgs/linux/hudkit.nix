{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, gtk3
, webkitgtk
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

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    gtk3
    webkitgtk
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
