{ pkgs, home-manager, ... }:
let
  treefmt-deps = with pkgs; [
    treefmt
    stylua
    statix
    deadnix
    nixpkgs-fmt
  ];
in
{

  default = pkgs.mkShell {
    packages = with pkgs; [
      nixos-rebuild
      just
      selene
      home-manager.packages.${system}.default
    ] ++ treefmt-deps;
  };
  ci = pkgs.mkShell {
    packages = with pkgs; [
      just
      nixos-rebuild
      jq      
    ] ++ treefmt-deps;
  };
}
