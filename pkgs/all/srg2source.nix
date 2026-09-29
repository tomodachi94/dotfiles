{
  lib,
  stdenv,
  fetchurl,
  makeWrapper,
  jre,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "srg2source";
  version = "8.2.3";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchurl {
    url = "https://maven.minecraftforge.net/net/minecraftforge/Srg2Source/8.2.3/Srg2Source-${finalAttrs.version}-fatjar.jar";
    hash = "sha256-AqxfEvtcGsbPrnIc7ByQM8rzzil82I8Y0Bb5f2oLbbs=";
  };
  dontUnpack = true;

  nativeBuildInputs = [
    makeWrapper
  ];
  buildInputs = [
    jre
  ];

  installPhase = ''
    runHook pre Install

    mkdir -p $out/{bin,share/java}
    cp "$src" $out/share/java/Srg2Source.jar

    makeWrapper "${lib.getExe jre}" "$out/bin/srg2source" \
      --add-flags "-jar $out/share/java/Srg2Source.jar"

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Applies source level refactors to java source code";
    homepage = "https://github.com/MinecraftForge/Srg2Source";
    license = lib.licenses.lgpl21Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "srg2source";
    platforms = lib.platforms.all;
  };
})
