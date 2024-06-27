{ lib
, stdenvNoCC
, fetchFromGitHub
, zsh
, installShellFiles
}:

stdenvNoCC.mkDerivation rec {
  pname = "zsh-window-title";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "olets";
    repo = "zsh-window-title";
    rev = "v${version}";
    hash = "sha256-RqJmb+XYK35o+FjUyqGZHD6r1Ku1lmckX41aXtVIUJQ=";
  };

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/share/zsh/plugins/zsh-window-title $out/share/doc/zsh-window-title
    cp *.zsh $out/share/zsh/plugins/zsh-window-title
    cp *.md LICENSE $out/share/doc/zsh-window-title
    installManPage ./man/man1/zwt.1
  '';

  meta = with lib; {
    description = "A zsh plugin for informative terminal window titles. 1000+ unique cloners as of May '24";
    homepage = "https://github.com/olets/zsh-window-title";
    changelog = "https://github.com/olets/zsh-window-title/blob/${src.rev}/CHANGELOG.md";
    # license = licenses.cc-by-nc-sa-40;
    license = licenses.free;
    maintainers = with maintainers; [ tomodachi94 ];
    mainProgram = "zsh-window-title";
    inherit (zsh.meta) platforms;
  };
}
