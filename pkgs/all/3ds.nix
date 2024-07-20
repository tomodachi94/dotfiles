{ stdenvNoCC, fetchzip, lib }:
let

  super-skaterhax = fetchzip {
    url = "https://github.com/zoogie/super-skaterhax/releases/download/v1.1/release_new3ds_v1.1.zip";
    hash = "sha256-hrxFiK9czO3ek68E5eFa/4nyBszpU/i3aLlxSPojWpI=";
    stripRoot = false;
  };
  safeb9sinstaller = fetchzip {
    url = "https://github.com/d0k3/SafeB9SInstaller/releases/download/v0.0.7/SafeB9SInstaller-20170605-122940.zip";
    hash = "sha256-wSQf/7ksQekjzKb50Qt3CMLkCA7QrsJMQdEwRIcYqbY=";
    stripRoot = false;
  };
  boot9strap = fetchzip {
    url = "https://github.com/SciresM/boot9strap/releases/download/1.4/boot9strap-1.4.zip";
    hash = "sha256-8/aHab9XNcwzPTAdw7Ydw9SFh2QgIoxxWb0kNikn9LM=";
    stripRoot = false;
  };
  nimdsphax = fetchzip {
    url = "https://github.com/luigoalma/nimdsphax/releases/download/v1.0/nimdsphax_v1.0.zip";
    hash = "sha256-YAIbTh6QtqGBb79UeeAN6neQ7PEpZlsnO9kxbtgI19Y=";
    stripRoot = false;
  };
  luma3ds = fetchzip {
    url = "https://github.com/LumaTeam/Luma3DS/releases/download/v13.1.2/Luma3DSv13.1.2.zip";
    hash = "sha256-fsGpM1vssmj1aq88NC+QqP7hLVpLyIe+VK95t/X8ekA=";
    stripRoot = false;
  };
  mkNewDS = attrs: stdenvNoCC.mkDerivation {
    inherit (attrs) name;
    src = null;
    dontUnpack = true;
    nativeBuildInputs = [
      boot9strap
      luma3ds
      nimdsphax
      safeb9sinstaller
      super-skaterhax
    ];
    installPhase = ''
      mkdir -p $out/3ds/nimdsphax $out/boot9strap
      cp ${luma3ds}/boot.{firm,3dsx} $out/
      cp ${super-skaterhax}/${attrs.region}\ \(*${attrs.systemVersion}*\)/*.bin $out/
      cp ${boot9strap}/boot9strap.* $out/boot9strap
      cp ${safeb9sinstaller}/SafeB9SInstaller.bin $out/
      cp ${nimdsphax}/* $out/3ds/nimdsphax
    '';
  };
in
mkNewDS {
  name = "new-2ds-xl";
  region = "USA";
  systemVersion = "11.16.0-49U";
}
