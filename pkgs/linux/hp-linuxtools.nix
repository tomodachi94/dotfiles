{ stdenvNoCC, fetchzip, autoPatchelfHook, openssl, kmod, lib }:
stdenvNoCC.mkDerivation rec {
  pname = "hp-flash";
  version = "3.24";
  src = fetchzip {
    url = "https://ftp.hp.com/pub/softpaq/sp150501-151000/sp150953.tgz";
    hash = "sha256-ofzqu5Y2g+QU0myJ4SF39ZJGXH1zXzX1Ys2FhXVTQKE=";
    stripRoot = false;
  };
  nativeBuildInputs = [
    autoPatchelfHook
  ];
  buildInputs = [
    openssl
    kmod
  ];
  installPhase = ''
    tar -xzf non-rpms/hp-flash-${version}_x86_64.tgz
    cd hp-flash-${version}_x86_64
    # Nix builds do not run as root
    # Use Nix paths for the output
    # Use the POSIXy directory for documentation
    # Script attempts to find libcrypto in non-Nix paths, which should never be true
    substituteInPlace ./install.sh \
      --replace-fail "exit" "true" \
      --replace-fail "/opt/hp/hp-flash" "$out" \
      --replace-fail "$out/docs" "$out/share/doc" \
      --replace-fail "$out/bin/hp-" "$out/bin/.hp-" \
      --replace-fail ". ./builds/test-distro.sh" "true"

    substituteInPlace ./hp-flash ./hp-repsetup \
      --replace-fail "/opt/hp/hp-flash" "$out" \
      --replace-fail "/sbin/modprobe" "${kmod}/bin/modprobe" \
      --replace-fail "/sbin/rmmod" "${kmod}/bin/rmmod" \
      --replace-fail "$out/bin/hp-" "$out/bin/.hp-" \
      --replace-fail "/lib/modules" "/run/current-system/kernel-modules/lib/modules"

    mv builds/hp-flash.u2204 bin/hp-flash
    mv builds/hp-repsetup.u2204 bin/hp-repsetup
    ./install.sh
    mv $out/hp-{flash,repsetup} $out/bin
  '';
}
