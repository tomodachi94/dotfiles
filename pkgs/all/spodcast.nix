{ python3Packages, fetchFromGitHub }:
let
  pybase62 = python3Packages.buildPythonPackage {
    pname = "pybase62";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "suminb";
      repo = "base62";
      rev = "f68d449cc3e9f3c4826fb8fa51dcdbec389e343c";
      hash = "sha256-7N/SGJAVwJOy1ObijA2s9XMrqMMb2SUMJaN72ITUrOM=";
    };
  };
in
python3Packages.buildPythonApplication {
  pname = "spodcast";
  version = "unstable-2024-02-06";
  src = fetchFromGitHub {
    owner = "Yetangitu";
    repo = "Spodcast";
    rev = "be7bc5cbb872d107be998114cfee8a67a6d53d7b";
    hash = "sha256-YTbVQIyYYUECFCwl3BUeJBAlxMhZSVzqKxrl+dvdRoY=";
  };
  dependencies = with python3Packages; [
    setuptools
    librespot
    ffmpeg-python
    pybase62
  ];
}
