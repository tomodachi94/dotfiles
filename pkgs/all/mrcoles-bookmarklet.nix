{ lib
, buildNpmPackage
, fetchFromGitHub
}:

buildNpmPackage rec {
  pname = "mrcoles-bookmarklet";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "mrcoles";
    repo = "bookmarklet";
    rev = "v${version}";
    hash = "sha256-v5po2Z5Cj3QIOr9JJROmGVVbElcs/vN/ykTI/mtjeWk=";
  };

  npmDepsHash = "sha256-PpAUtyXyfAYwT3JUaKG9+pbuRSzjOKnxMgjoMtMwOXQ=";
  dontNpmBuild = true;

  meta = with lib; {
    description = "A server-side bookmarklet compiler with greasemonkey userscript-like metadata options and the power of babel and uglify";
    homepage = "https://github.com/mrcoles/bookmarklet";
    changelog = "https://github.com/mrcoles/bookmarklet/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ tomodachi94 ];
    mainProgram = "bookmarklet";
    platforms = platforms.all;
  };
}
