{ pkgs, catppuccin-base16, ... }:
{
  stylix.image = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/Gingeh/wallpapers/2530dba028589bda0ef6743d7960bd8a5b016679/os/nix-black-4k.png";
    hash = "sha256-e1RBd5gTBonG39gYmxCvJuf+qZOiuxeZ9LTjhPQB9vk=";
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
      name = "BlexMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.fonts.sizes = {
    applications = 10;
  };

  stylix.cursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 23;
  };
}
