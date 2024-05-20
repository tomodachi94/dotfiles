{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
  };

  outputs = { nixpkgs, ... }:
    let
      home-manager = { };
      stylix = { };
      comin = { };
      tomolib = import ../lib { inherit nixpkgs home-manager stylix comin; };
    in
    {
      packages = tomolib.forAllSystems (pkgs:
        import ./default.nix { inherit pkgs; });
    };
}
