{ stdenvNoCC, fetchgit, autoPatchelfHook, openssl, libfprint-tod, python3, lib }:
stdenvNoCC.mkDerivation {
  pname = "libfprint-2-tod1-broadcom";
  version = "unstable-2021-10-08";

  src = fetchgit {
    url = "https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-broadcom/+git/libfprint-2-tod1-broadcom";
    rev = "37b75a3a60e868014901c43a98791ba1fc81fb67";
    hash = "sha256-ezjmbyHoop3oNSPRR/q8HKTi8xFDPrTJY1PV5Quyock=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    openssl
    libfprint-tod
  ];

  postPatch = ''
    # Condense everything into a single ./lib directory
    mkdir -p lib/libfprint-2/tod-1
    mv {usr/lib/x86_64-linux-gnu,lib}/libfprint-2/tod-1/libfprint-2-tod-1-broadcom.so
    cp -r var/* .
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,lib}
    cp -r lib/* $out/lib

    runHook postInstall
  '';

  passthru.driverPath = "/lib/libfprint-2/tod-1";

  meta = {
    description = "Driver module for Broadcom fingerprint scanners";
    homepage = "https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-broadcom/+git/libfprint-2-tod1-broadcom";
    # license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ tomodachi94 ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
