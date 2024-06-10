{ lib
, buildNpmPackage
, fetchFromGitHub
}:

buildNpmPackage rec {
  pname = "doctoc";
  version = "2.2.0";

  src = fetchFromGitHub {
    owner = "thlorenz";
    repo = "doctoc";
    rev = "v${version}";
    hash = "sha256-LYVxW8bZ4M87CmBvPyp4y0IeL9UFawwAKnUWHEWB5Gs=";
  };

  npmDepsHash = "sha256-TbAnFpiN/v6xjQQznL/B180f0W48HPRqW21cO9XZhYA=";

  dontNpmBuild = true;

  meta = with lib; {
    description = "Generates table of contents for markdown files inside local git repository. Links are compatible with anchors generated by github or other sites";
    homepage = "https://github.com/thlorenz/doctoc";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "doctoc";
    platforms = platforms.all;
  };
}
