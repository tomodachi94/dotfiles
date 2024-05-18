{ lib
, fetchFromGitHub
, buildNpmPackage
, electron
}:

buildNpmPackage rec {
  pname = "crossover";
  version = "3.3.4";

  src = fetchFromGitHub {
    owner = "Lacymorrow";
    repo = "crossover";
    rev = "v${version}";
    hash = "sha256-U2UmcbSVF21MOjqFqoKuuckSARcmH8oG/HcfwtUMJOM=";
  };

  buildInputs = [ electron ];

  npmDepsHash = "sha256-Nlh90eyRrDNC0c8ihHnzRrRlvWjXxqwGJ+QCxU/tsbc=";

  # 'electron-builder: command not found'
  dontNpmBuild = true;
  makeCacheWritable = true;

  env = {
    ELECTRON_SKIP_BINARY_DOWNLOAD = 1;
  };

  postInstall = ''
    makeWrapper ${lib.getExe electron} $out/bin/${pname} \
      --add-flags $out/lib/node_modules/${pname}/main.js
  '';

  meta = with lib; {
    description = "A Crosshair overlay for any screen";
    homepage = "https://gh.lacymorrow.com/crossover";
    changelog = "https://github.com/Lacymorrow/crossover/blob/${src.rev}/CHANGELOG.md";
    license = # licenses.cc-by-nc-sa-40;
    licenses.free;
    maintainers = with maintainers; [ tomodachi94 ];
  };
}
