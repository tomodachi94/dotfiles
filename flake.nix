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

    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nur, tomodachi94, mac-app-util, ...}:
    let
      forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system: function nixpkgs.legacyPackages.${system});
  inherit nur;
    in {
      homeConfigurations.darwin-aarch64 = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home/common
          ./home/darwin
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit nur tomodachi94 mac-app-util;
        };
      };

      homeConfigurations.linux-x86_64 = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home/common
          ./home/linux
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit nur tomodachi94;
        };
      };

      nixosConfigurations = {
        hp-laptop-df0023 = nixpkgs.lib.nixosSystem {
          specialArgs = { };
          modules = [
		    home-manager.nixosModules.home-manager
		    ./hosts/hp-laptop-df0023
          ];
        };
        hp-laptop-df0023-iso = nixpkgs.lib.nixosSystem {
          specialArgs = { };
          modules = [
            (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
		    home-manager.nixosModules.home-manager
		    ./hosts/hp-laptop-df0023
          ];
        };
      };

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
            packages = [ pkgs.home-manager pkgs.nixos-rebuild pkgs.just pkgs.stylua pkgs.deadnix pkgs.selene ];
          };
        }); 
    };
}
