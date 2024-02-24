{ environment, config, pkgs, lib, nur, ... }:
{
  nixpkgs = {
    overlays = [
      nur.overlay
      (import ./overlays/nerdfonts.nix)
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
