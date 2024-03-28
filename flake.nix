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

    tomodachi94 = {
      url = "github:tomodachi94/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-craftos-pc = {
      url = "github:tomodachi94/nix-craftos-pc";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, nur, tomodachi94, mac-app-util, nix-craftos-pc, ... }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ]
          (system: function nixpkgs.legacyPackages.${system});

	  vars = (import ./vars);

	  bases.hp-laptop-df0023 = [
	    home-manager.nixosModules.home-manager
        ./hosts/hp-laptop-df0023
        {
          home-manager.users.me = { pkgs, vars, ... }: {
            imports = [ ./home/common ./home/linux ];
          };
		  home-manager.extraSpecialArgs = { inherit vars; };
        }
      ];

    in
    {
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

      nixosConfigurations = {
        /* hp-laptop-df0023-iso = nixpkgs.lib.nixosSystem {
          specialArgs = {  };
          modules = bases.hp-laptop-df0023 ++ [ "${nixpkgs.outPath}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix" ];
        }; */
        hp-laptop-df0023 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit vars; };
          modules = bases.hp-laptop-df0023;
        };
      };

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [ 
		    nixos-rebuild
			just
			stylua
			deadnix
			nixpkgs-fmt
			selene
            home-manager.packages.${system}.default 
		 ];
        };
	    ci = pkgs.mkShell {
          packages = with pkgs; [
            nixos-rebuild
			jq
		  ];
		};
      });
    };
}
