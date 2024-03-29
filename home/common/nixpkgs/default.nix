{
  nixpkgs = {
    overlays = [
      (import ./overlays/nerdfonts.nix)
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
