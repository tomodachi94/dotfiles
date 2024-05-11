{ pkgs, ... }:
let
  packages = {
    sound = with pkgs; stdenv.mkDerivation {
      src = pkgs.fetchFromGitHub {
        owner = "MCJack123";
        repo = "craftos2-plugins";
        rev = "c623e9d2054a4e77835327536a46440c6f62735c";
        hash = "sha256-gKei1DrK9ULFR2vdr7osO+0RHf2ADw8T0YeJx4/ZkjQ=";
      };
      buildInputs = with pkgs; [ craftos-pc ];
      buildPhase = ''
                make sound
        		tree
        	  '';
    };
  };
in
{
  inherit (packages) sound;
}
