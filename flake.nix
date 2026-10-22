{
  description = "Home Manager configuration of Tomodachi94";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
      inputs = { };
    };

    # keep-sorted start block=yes newline_separated=yes
    bitwarden-dmenu = {
      url = "github:pltanton/bitwarden-dmenu";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-base16 = {
      url = "github:catppuccin/base16";
      flake = false;
    };

    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dash2 = {
      url = "github:tomodachi94/dash2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions/master?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mnw = {
      url = "github:Gerg-L/mnw";
    };

    nix-craftos-pc = {
      url = "github:tomodachi94/nix-craftos-pc";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tomodachi94 = {
      url = "github:tomodachi94/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zsh-craftos-select = {
      url = "git+https://gist.github.com/tomodachi94/aaae79f7cb4e7b2087727fbbfe05eb12";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, disko, mac-app-util, stylix, catppuccin-base16, zsh-craftos-select, bitwarden-dmenu, comin, pre-commit-hooks, dash2, firefox-addons, lanzaboote, ... }@inputs:
    let
      tomolib = import ./lib { inherit inputs; };
      tomopkgs = tomolib.forAllSystems (pkgs:
        import ./pkgs { inherit pkgs inputs; }
      );

      args = { inherit inputs tomolib tomopkgs; };
      args.args = args;
    in
    {
      homeConfigurations = tomolib.forAllSystems (pkgs: tomolib.mkHMConfig {
        inherit pkgs args;
      });

      nixosConfigurations.hp-laptop-df0023 = tomolib.mkNixosConfig {
        hostname = "hp-laptop-df0023";
        inherit args;
      };
      nixosConfigurations.ponyo = tomolib.mkNixosConfig {
        hostname = "ponyo";
        inherit args;
      };
      nixosConfigurations.totoro = tomolib.mkNixosConfig {
        hostname = "totoro";
        inherit args;
      };

      checks = tomolib.forAllSystems (pkgs: import ./lib/checks.nix { inherit pkgs inputs; });

      packages = tomopkgs;

      devShells = tomolib.forAllSystems (pkgs: import ./lib/shells.nix { inherit pkgs inputs; });
    };


  nixConfig = {
    trusted-substituters = [
      "https://cache.nixos.org"
      "https://tomodachi94.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "tomodachi94.cachix.org-1:E1WFk+SYPtq3FFO+NvDgsyciIHg8nHxB/z7qNfojxpI="
    ];
  };
}
