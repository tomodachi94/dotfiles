{ pkgs, tomolib, config, ... }:
let
  firejailWrappers = tomolib.firejailWrappers { inherit pkgs; };
in
{
  programs.librewolf = {
    enable = true;
    package = firejailWrappers.librewolf;
    settings = {
      "webgl.disabled" = false;
    };
  };

  home.sessionVariables = {
    BROWSER = "${firejailWrappers.librewolf}/bin/librewolf";
  };
}
