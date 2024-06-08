{ lib
, fetchFromGitHub
, buildNpmPackage
}:

buildNpmPackage rec {
  pname = "awesome-lint";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "sindresorhus";
    repo = "awesome-lint";
    rev = "v${version}";
    hash = "sha256-W1Dd0MdP9gqYqydUFSWqUzAP1WeS7Qveoqns1D5dwEw=";
  };

  dontNpmBuild = true;

  dontNpmPrune = true;

  npmDepsHash = "sha256-c49XOazBUPsplFx+/ZDDW3NtXhBpyxy5FAjInMNldf4=";

  postPatch = ''
    cp ${./package-lock.json} ./package-lock.json
  '';

  meta = with lib; {
    description = "Linter for Awesome lists";
    homepage = "https://github.com/sindresorhus/awesome-lint";
    license = licenses.mit;
    maintainers = with maintainers; [ tomodachi94 ];
    mainProgram = "awesome-lint";
    platforms = platforms.all;
  };
}
