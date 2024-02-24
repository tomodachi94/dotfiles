{ config, nur, ... }:
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
