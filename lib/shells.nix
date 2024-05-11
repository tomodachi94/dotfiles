{ pkgs, home-manager, ... }:
let
  treefmt-deps = with pkgs; [
    treefmt
    stylua
    statix
    deadnix
    nixpkgs-fmt
    python3Packages.mdformat
    python3Packages.mdformat-gfm
    python3Packages.mdformat-frontmatter
    python3Packages.mdformat-footnote
  ];
in
{

  default = pkgs.mkShell {
    packages = with pkgs; [
      nixos-rebuild
      just
      selene
      jq
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
