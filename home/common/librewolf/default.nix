{ pkgs, lib, tomolib, firefox-addons, config, ... }:
let
  firejailWrappers = tomolib.firejailWrappers { inherit pkgs; };
in
{
  imports = [
    ./bookmarklets
    ./search.nix
  ];

  programs.librewolf = {
    enable = config.local.eagerSetup.enableGraphicalApps;
    # package = firejailWrappers.librewolf;
    settings = {
      "webgl.disabled" = false;
    };
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        # Disable autofill
        "browser.formautofill.enabled" = false;
        "browser.formfill.enable" = false;
        # Keep browser open when the last tab is closed
        "browser.tabs.closeWindowWithLastTab" = false;
      };
      extensions = with firefox-addons.packages.${pkgs.system}; [
        multi-account-containers
        auto-tab-discard
        ublacklist
        violentmonkey
        indie-wiki-buddy
      ];
    };
  };

  home.sessionVariables = lib.mkIf config.programs.librewolf.enable {
    BROWSER = "${config.programs.librewolf.finalPackage}/bin/librewolf";
  };
}
