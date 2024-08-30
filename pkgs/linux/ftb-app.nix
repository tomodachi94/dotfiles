{ lib
, appimageTools
, fetchurl
,
}:

let
  version = "1.25.18";
  pname = "ftb-app";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://piston.feed-the-beast.com/app/ftb-app-${version}-x86_64.AppImage";
    hash = "sha256-qqcEovw8SoPzHS3Uz82IxONa/LHr9y9/rt2tIXE/P8g=";
  };

  appimageContents = appimageTools.extractType1 { inherit name src; };
in
appimageTools.wrapType1 {
  inherit name src;

  extraInstallCommands = ''
    ls ${appimageContents}
    mv $out/bin/${name} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';
}
