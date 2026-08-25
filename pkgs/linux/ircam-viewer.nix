{
  lib,
  stdenv,
  fetchFromGitHub,
  nix-update-script,
  pkg-config,
  installShellFiles,
  SDL2,
  SDL2_ttf,
  ffmpeg,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "ircam-viewer";
  version = "0-unstable-2026-05-14";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "jcalvinowens";
    repo = "ircam-viewer";
    rev = "8f60f061f9dfb5f014c4c08c4d25e1b884a652b5";
    hash = "sha256-8Y3E9XenzahoKo8erGOayNjRUFn6GFq+0rp6GwNrv6s=";
  };

  nativeBuildInputs = [
    pkg-config
    installShellFiles
  ];
  buildInputs = [
    SDL2
    SDL2_ttf
    ffmpeg
  ];

  buildPhase = ''
    runHook preBuild

    make CFLAGS="$(pkg-config --cflags sdl2 SDL2_ttf)"

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    installBin ircam

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Linux Infrared Camera Viewer";
    homepage = "https://github.com/jcalvinowens/ircam-viewer";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "ircam-viewer";
    platforms = lib.platforms.linux;
  };
})
