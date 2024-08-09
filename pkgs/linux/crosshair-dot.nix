{ writeShellApplication, callPackage }:
writeShellApplication {
  name = "crosshair-dot";
  text = ''
    hudkit file://${../../tools/crosshair-dot}/index.html
  '';
  runtimeInputs = [ (callPackage ./hudkit.nix { }) ];
}
