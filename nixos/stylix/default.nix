{ pkgs, catppuccin-base16, ... }:
{
  stylix.image = ../../home/linux/i3/wallpaper.png;
  stylix.autoEnable = false; # We have some manual theming around the repository, which conflicts with Stylix
  stylix.base16Scheme = "${catppuccin-base16}/base16/mocha.yaml";


  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
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
}
