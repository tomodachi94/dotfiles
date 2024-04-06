{ pkgs, home-manager, ... }:
{

  default = pkgs.mkShell {
    packages = with pkgs; [
      nixos-rebuild
      just
      stylua
      deadnix
      nixpkgs-fmt
      selene
      statix
      home-manager.packages.${system}.default
    ];
  };
  ci = pkgs.mkShell {
    packages = with pkgs; [
      just
      nixos-rebuild
      jq
    ];
  };
}
