{ nixpkgs, home-manager, stylix, comin, disko }:
rec {
  mkHMImports = systemType: [
    ../home/common
    (../home + "/${systemType}")
    stylix.homeManagerModules.stylix

    ({ pkgs, ... }: {
      stylix.image = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/Gingeh/wallpapers/2530dba028589bda0ef6743d7960bd8a5b016679/os/nix-black-4k.png";
        hash = "sha256-e1RBd5gTBonG39gYmxCvJuf+qZOiuxeZ9LTjhPQB9vk=";
      };
    })
  ];
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
      disko.nixosModules.disko
    ] ++ extraModules;
  };

  # Source: https://www.reddit.com/r/NixOS/comments/1b56jdx/simple_nix_function_for_wrapping_executables_with/, by u/stelcodes
  mkFirejailWrapper = { pkgs, executable, desktop ? null, profile ? null, extraArgs ? [ ] }: pkgs.runCommand "firejail-wrap"
    {
      preferLocalBuild = true;
      allowSubstitutes = false;
      meta.priority = -1; # take precedence over non-firejailed versions
    }
    (
      let
        firejailArgs = pkgs.lib.concatStringsSep " " (
          extraArgs ++ (pkgs.lib.optional (profile != null) "--profile=${toString profile}")
        );
      in
      ''
        command_path="$out/bin/$(basename ${executable})"
        mkdir -p $out/bin
        mkdir -p $out/share/applications
        cat <<'_EOF' >"$command_path"
        #! ${pkgs.runtimeShell} -e
        exec /run/wrappers/bin/firejail ${firejailArgs} -- ${toString executable} "$@"
        _EOF
        chmod 0755 "$command_path"
      '' + pkgs.lib.optionalString (desktop != null) ''
        substitute ${desktop} $out/share/applications/$(basename ${desktop}) \
          --replace ${executable} "$command_path"
      ''
    );

  firejailWrappers = { pkgs }: (import ./firejail-wrappers.nix { inherit pkgs mkFirejailWrapper; });

}
