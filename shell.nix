with (import (fetchTarball https://github.com/nixos/nixpkgs/archive/037d4463a063ccdf4f257a7ee263033b0ba1820d.tar.gz) {});
mkShell {
  buildInputs = [
    dotter
    stylua
    selene
    just
  ];
}

