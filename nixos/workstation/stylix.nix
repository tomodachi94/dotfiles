{ pkgs, catppuccin-base16, ... }:
{
  stylix.enable = true;
  stylix.image = pkgs.fetchurl {
    url = "https://files.orangc.net/media/walls-catppuccin-mocha/black-hole.png?k=KCrQ";
    hash = "sha256-rjJgxf45d6lIkw5tBFe9gnprVpKZ2YbYt3XrjAotuFk=";
  };
  stylix.autoEnable = false; # We have some manual theming around the repository, which conflicts with Stylix
  stylix.base16Scheme = "${catppuccin-base16}/base16/mocha.yaml";


  stylix.fonts = {
    serif = {
      package = pkgs.ibm-plex;
      name = "IBM Plex Serif";
    };

    sansSerif = {
      package = pkgs.ibm-plex;
      name = "IBM Plex Sans Serif";
    };

    monospace = {
      package = pkgs.nerdfonts.override (old: { fonts = [ "IBMPlexMono" ]; });
      name = "BlexMono Nerd Font Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.fonts.sizes = {
    terminal = 12;
    applications = 10;
  };

  stylix.cursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 23;
  };
}
