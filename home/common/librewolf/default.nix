{ pkgs, tomolib, firefox-addons, config, ... }:
let
  firejailWrappers = tomolib.firejailWrappers { inherit pkgs; };
in
{
  imports = [
    ./search.nix
  ];

  programs.librewolf = {
    enable = true;
    # package = firejailWrappers.librewolf;
    settings = {
      "webgl.disabled" = false;
    };
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      extensions = with firefox-addons.packages.${pkgs.system}; [
        bitwarden
        multi-account-containers
        auto-tab-discard
        ublacklist
        indie-wiki-buddy
      ];
    };
  };

  home.sessionVariables = {
    BROWSER = "${config.programs.librewolf.finalPackage}/bin/librewolf";
  };
}
