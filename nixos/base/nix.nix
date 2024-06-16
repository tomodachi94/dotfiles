{ pkgs, rawNixpkgs, ... }:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      trusted-substituters = [
        "https://tomodachi94.cachix.org"
        "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "tomodachi94.cachix.org-1:E1WFk+SYPtq3FFO+NvDgsyciIHg8nHxB/z7qNfojxpI="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-old --delete-older-than 14d";
    };
    nixPath = [ "nixpkgs=${pkgs.path}" ];
    registry.nixpkgs.flake = rawNixpkgs;
  };
}
