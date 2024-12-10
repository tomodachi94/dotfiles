{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      showDerivationWarnings = [ "maintainerless" ];
    };
  };
}
