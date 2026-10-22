{ inputs }:
rec {
  mkHMImports = systemType: [
    ../home/common
    (../home + "/${systemType}")
    inputs.stylix.homeManagerModules.stylix

    ({ pkgs, ... }: {
      stylix.image = pkgs.fetchurl {
        url = "https://files.orangc.net/media/walls-catppuccin-mocha/black-hole.png?k=KCrQ";
        # hash = ;
      };
    })
  ];
  mkNixpkgs = { systemType, systemArch }: inputs.nixpkgs.legacyPackages."${systemArch}-${systemType}";

  forAllSystems = function:
    inputs.nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ]
      (system: function inputs.nixpkgs.legacyPackages.${system});

  mkHMConfig = { pkgs, args }: inputs.home-manager.lib.homeManagerConfiguration {
    modules = mkHMImports pkgs.stdenv.hostPlatform.kernel.name;
    # Optionally use extraSpecialArgs
    # to pass through arguments to home.nix
    extraSpecialArgs = args;
  };

  mkNixosConfig = { hostname, args }: inputs.nixpkgs.lib.nixosSystem {
    specialArgs = args;
    modules = [
      (../nixos/hosts + "/${hostname}")
      inputs.home-manager.nixosModules.home-manager
      inputs.stylix.nixosModules.stylix
      inputs.comin.nixosModules.comin
      inputs.disko.nixosModules.disko
      inputs.dash2.nixosModules.default
      inputs.lanzaboote.nixosModules.lanzaboote
    ];
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
