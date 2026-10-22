{ pkgs, inputs, ... }:
let
  treefmt-deps = with pkgs; [
    treefmt
    taplo
    stylua
    statix
    deadnix
    yamlfmt
    keep-sorted
    nixpkgs-fmt
    python3Packages.mdformat
    python3Packages.mdformat-gfm
    python3Packages.mdformat-frontmatter
    python3Packages.mdformat-footnote
  ];
in
{

  default = pkgs.mkShellNoCC {
    packages = with pkgs; [
      nixos-rebuild
      just
      selene
      jq
      inputs.home-manager.packages.${system}.default
    ] ++ (lib.optional stdenv.hostPlatform.isLinux [ inputs.disko.packages.${system}.disko ])
    ++ treefmt-deps;
    inherit (inputs.self.checks.${pkgs.stdenvNoCC.hostPlatform.system}.pre-commit-check) shellHook;
  };
  ci = pkgs.mkShellNoCC {
    packages = with pkgs; [
      just
      nixos-rebuild
      jq
      selene
    ] ++ treefmt-deps;
  };
}
