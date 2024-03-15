{ pkgs, lib, ... }:
{
  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # substituters = [ "https://cache.nixos.org" "https://tomodachi94.cachix.org" "https://nix-community.cachix.org" ];
      # trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "tomodachi94.cachix.org-1:E1WFk+SYPtq3FFO+NvDgsyciIHg8nHxB/z7qNfojxpI=" ];
      auto-optimise-store = true;
    };
  };
}
