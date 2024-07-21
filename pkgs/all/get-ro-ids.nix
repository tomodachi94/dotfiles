{ stdenvNoCC, python3 }:
stdenvNoCC.mkDerivation {
  name = "get-ro-ids";
  propagatedBuildInputs = [
    (python3.withPackages (pythonPackages: with pythonPackages; [
      requests
    ]))
  ];
  dontUnpack = true;
  installPhase = ''
    install -Dm755 ${../../tools/get-ro-ids.py} $out/bin/get-ro-ids
  '';
}

