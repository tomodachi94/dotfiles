{ nixpkgs, home-manager, stylix, comin }:
rec {
  mkHMImports = systemType: [ ../home/common (../. + "home/${systemType}") ];
  mkNixpkgs = { systemType, systemArch }: nixpkgs.legacyPackages."${systemArch}-${systemType}";

  forAllSystems = function:
    nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ]
      (system: function nixpkgs.legacyPackages.${system});

  mkHMConfig = { systemType, systemArch, args }: home-manager.lib.homeManagerConfiguration {
    pkgs = mkNixpkgs { inherit systemType systemArch; };

    # Specify your home configuration modules here, for example,
    # the path to your home.nix.
    modules = mkHMImports systemType;

    # Optionally use extraSpecialArgs
    # to pass through arguments to home.nix
    extraSpecialArgs = args;
  };

  mkNixosConfig = { hostname, extraModules, args }: nixpkgs.lib.nixosSystem {
    specialArgs = args;
    modules = [
      (../nixos/hosts + "/${hostname}")
      home-manager.nixosModules.home-manager
      stylix.nixosModules.stylix
      comin.nixosModules.comin
    ] ++ extraModules;
  };

}
