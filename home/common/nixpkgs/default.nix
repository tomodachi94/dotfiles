{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      # FIXME: might be broken?
      # showDerivationWarnings = [ "maintainerless" ];
    };
  };
}
