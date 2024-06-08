{ lib
, fetchFromGitHub
, buildNpmPackage
}:

buildNpmPackage rec {
  pname = "awesome-lint";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "sindresorhus";
    repo = "awesome-lint";
    rev = "v${version}";
    hash = "sha256-yiH2HiW3MQEYkwC5D09Vs43pdUiKl2D3lIhlOdZ6fMY=";
  };

  dontNpmBuild = true;

  dontNpmPrune = true;

  npmDepsHash = "sha256-CVOOkCID9gLYqyrfV8Vgwper6vW79R3ru12MaTolB4I=";

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
