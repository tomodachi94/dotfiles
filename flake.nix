{
  description = "Home Manager configuration of Tomodachi94";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
      inputs = { };
    };

    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
    };

    home-manager = {
      url = "github:chayleaf/home-manager/librewolf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tomodachi94 = {
      url = "github:tomodachi94/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    catppuccin-base16 = {
      url = "github:catppuccin/base16";
      flake = false;
    };

    nix-craftos-pc = {
      url = "github:tomodachi94/nix-craftos-pc";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    zsh-craftos-select = {
      url = "git+https://gist.github.com/tomodachi94/aaae79f7cb4e7b2087727fbbfe05eb12";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bitwarden-dmenu = {
      url = "github:pltanton/bitwarden-dmenu";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    dash2 = {
      url = "github:tomodachi94/dash2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions/master?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, disko, mac-app-util, stylix, catppuccin-base16, zsh-craftos-select, bitwarden-dmenu, comin, pre-commit-hooks, dash2, firefox-addons, lanzaboote, ... }:
    let
      tomolib = import ./lib { inherit nixpkgs home-manager stylix comin disko; };
      tomopkgs = tomolib.forAllSystems (pkgs:
        import ./pkgs { inherit pkgs; }
      );

      vars = import ./lib/vars.nix;

      commonInputs = { inherit vars tomopkgs tomolib; rawNixpkgs = nixpkgs; };

      homeCommonInputs = commonInputs // { inherit zsh-craftos-select stylix bitwarden-dmenu firefox-addons; };
      homeDarwinInputs = homeCommonInputs // { inherit mac-app-util; };

      systemCommonInputs = commonInputs // { };
      systemLinuxInputs = systemCommonInputs // { nixos-hardware = nixos-hardware.nixosModules; homeInputs = homeCommonInputs; inherit catppuccin-base16 comin dash2 lanzaboote disko; };

    in
    rec {
      homeConfigurations.darwin-aarch64 = tomolib.mkHMConfig { systemType = "darwin"; systemArch = "aarch64"; args = homeDarwinInputs; };
      homeConfigurations.darwin-x86_64 = tomolib.mkHMConfig { systemType = "darwin"; systemArch = "x86_64"; args = homeDarwinInputs; };
      homeConfigurations.linux-aarch64 = tomolib.mkHMConfig { systemType = "linux"; systemArch = "aarch64"; args = homeDarwinInputs; };
      homeConfigurations.linux-x86_64 = tomolib.mkHMConfig { systemType = "linux"; systemArch = "x86_64"; args = homeDarwinInputs; };

      nixosConfigurations.hp-laptop-df0023 = tomolib.mkNixosConfig {
        hostname = "hp-laptop-df0023";
        args = systemLinuxInputs;
        extraModules = let hw = nixos-hardware.nixosModules; in [
          hw.common-cpu-intel
          hw.common-gpu-intel-kaby-lake
          hw.common-pc
          hw.common-pc-laptop
          # Note: This laptop had its HDD replaced with an SSD
          hw.common-pc-laptop-ssd
          dash2.nixosModules.default
        ];
      };

      nixosConfigurations.ponyo = tomolib.mkNixosConfig {
        hostname = "ponyo";
        args = systemLinuxInputs;
        extraModules = let hw = nixos-hardware.nixosModules; in [
          hw.common-cpu-intel
          hw.common-pc
          hw.common-pc-laptop
          hw.common-pc-laptop-ssd
          dash2.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
        ];
      };

      checks = tomolib.forAllSystems (pkgs: import ./lib/checks.nix { inherit pkgs pre-commit-hooks; });

      packages = tomopkgs;
      /* legacyPackages = tomolib.forAllSystems (system: (packages.${system} // { lib = tomolib; })); */

      devShells = tomolib.forAllSystems (pkgs: import ./lib/shells.nix { inherit pkgs home-manager disko checks; });

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
