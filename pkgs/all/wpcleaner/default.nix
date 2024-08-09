{ stdenvNoCC
, fetchFromGitHub
, ant
, jdk8
, jre8
, stripJavaArchivesHook
, makeWrapper
, gettext
, commonsCompress
, commonsIo
, commonsLang
, commonsLogging
, jdom
, lib
}:
let
  javaDeps = [ jdom commonsIo commonsLogging commonsCompress commonsLang ];
in
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "wpcleaner";
  version = "unstable-2024-08-05";

  src = fetchFromGitHub {
    owner = "WPCleaner";
    repo = "wpcleaner";
    rev = "21fae4fd37369b64e59840aaa22b9126b2740eb6";
    hash = "sha256-lTA5qzAEPWT1I52cVDL79Sl+ETyg/lnPkX7fI9VDmLo=";
  };

  nativeBuildInputs = [
    ant
    jdk8
    stripJavaArchivesHook
    makeWrapper
  ];

  buildInputs = [
    gettext
    jre8
  ] ++ javaDeps;

  patches = [
    ./remove-keystore-prompt.patch
  ];

  postPatch = ''
    # Remove vendored dependencies that we have packaged elsewhere
    # FIXME: Package all vendored dependencies, then delete the entirety of libs/
    rm -rf libs/{jdom,commons-io,commons-logging,commons-compress,commons-lang3}-*
  '';

  preBuild = ''
    cd WikipediaCleaner
  '';

  buildPhase =
    let
      antLibs = lib.concatStringsSep " " (builtins.map (package: "-lib ${package}/share/java") javaDeps);
    in
    ''
      runHook preBuild

      ant \
        -Dgettext.path="${gettext}/bin/" \
        ${antLibs}

      runHook postBuild
    '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,share/java}
    cp build/dist/full/WikipediaCleaner.jar $out/share/java

    # classpath="$(find $out/share/java ${lib.concatStringsSep " " finalAttrs.buildInputs} -name '*.jar' -printf '%h/%f:' | sed 's/:$//g')"
    makeWrapper ${lib.getExe jre8} $out/bin/wpcleaner \
      # --add-flags "-classpath $classpath" \
      --add-flags "-jar $out/share/java/WPCleaner.jar" \
      --add-flags "org.wikipediacleaner.WikipediaCleaner"

    ls build
    echo "..."
    ls build/dist

    runHook postInstall
  '';
  meta = {
    homepage = "https://wpcleaner.toolforge.org/";
    license = lib.licenses.asl20;
  };
})
