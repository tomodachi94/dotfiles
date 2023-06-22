{
  description = "Home Manager configuration of Tomodachi94";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
      inputs = { };
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tomodachi94 = {
      url = "github:tomodachi94/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-ruby = {
      url = "github:bobvanderlinden/nixpkgs-ruby";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, nur, tomodachi94, nixpkgs-ruby, ...}@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      inherit nur;
    in {
      homeConfigurations.me = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home-manager/home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit nur tomodachi94 nixpkgs-ruby;
        };


      overlays = [
        (import ./nixpkgs/overlays/nerdfonts.nix)
      ];

      };
    };
}
