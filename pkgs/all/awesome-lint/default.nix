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

  npmDepsHash = "sha256-/Nhb1GwHl61H6T7wKjgG/dINpneHXOt8hzzw+7C0i3o=";

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
    broken = true;
  };
}
