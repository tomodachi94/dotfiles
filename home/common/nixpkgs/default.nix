{ pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      # FIXME: might be broken?
      # showDerivationWarnings = [ "maintainerless" ];
      permittedInsecurePackages = [
        "firefox-esr-140-bin-unwrapped-140.17.0esr"
      ];
    };
  };
  assertions =
    [ { assertion = pkgs.zotero.version == "10.0.4";
        message = "Remove the permittedInsecurePackages setting";
      }
    ];
}
