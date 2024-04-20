{
  lib,
  buildDubPackage,
  fetchFromGitHub,
  wrapGAppsHook,
  libadwaita,
  harfbuzz,
  libimobiledevice,
  libplist,
}:
let
  runtimeDeps = [
    libadwaita
    harfbuzz
    libimobiledevice
    libplist
  ];
in
buildDubPackage rec {
  pname = "sideloader";
  version = "1.0-pre3";

  src = fetchFromGitHub {
    owner = "Dadoum";
    repo = "Sideloader";
    rev = version;
    hash = "sha256-FiIgAN5PHR2pouyfMy0r/ZuTt+IiFznMacrBA4GOSXk=";
  };

  postPatch = ''
    substituteInPlace dub.selections.json \
        --replace-fail '"plist": "~master"' '"plist": "0.0.1"'
  '';

  dubLock = ./dub-lock.json;

  dubBuildFlags = [ ":gtk-frontend" ];

  nativeBuildInputs = [ wrapGAppsHook ];

  installPhase = ''
    runHook preInstall
    install -Dm755 bin/sideloader -t "$out/bin"
    runHook postInstall
  '';

  preFixup = ''
    gappsWrapperArgs+=(--prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeDeps})
  '';

  meta = with lib; {
    description = "Open-source cross-platform iOS app sideloader";
    homepage = "https://github.com/Dadoum/Sideloader";
    license = licenses.sspl;
    maintainers = with maintainers; [ tomodachi94 ];
  };
}
