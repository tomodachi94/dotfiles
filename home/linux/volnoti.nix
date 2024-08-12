{ pkgs, tomopkgs, ... }:
{
  services.volnoti = {
    enable = true;
    package = tomopkgs.${pkgs.system}.volnoti;
  };
}
