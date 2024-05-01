{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonApplication {
  pname = "ultisnips-vscode";
  version = "unstable-2022-06-04";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "erietz";
    repo = "ultisnips-vscode";
    rev = "e59ba44087765b61d55d81d53bdd8f34b54db704";
    hash = "sha256-Mru8oypy3zBvA3587nQ74BZ1gtCM3X9xkuV2E9FLW6w=";
  };

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
  ];

  pythonImportChecks = [ "ultisnips2vscode" ];

  meta = with lib; {
    description = "Mass convert UltiSnips snippets to JSON for VSCode";
    homepage = "https://github.com/erietz/ultisnips-vscode";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ tomodachi94 ];
    mainProgram = "ultisnips-vscode";
  };
}
