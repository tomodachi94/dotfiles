{ config, pkgs, vars, ... }:
let
  inherit (config.lib.stylix) colors;
  hexToRgb = name:
    let
      hex = colors."${name}";
      r = pkgs.lib.toInt (pkgs.lib.substring 1 3 hex);
      g = pkgs.lib.toInt (pkgs.lib.substring 3 5 hex);
      b = pkgs.lib.toInt (pkgs.lib.substring 5 7 hex);
    in
    "rgb(${r},${g},${b})";
  mkRgb = name: "rgb(${colors."${name}-rgb-r"},${colors."${name}-rgb-g"},${colors."${name}-rgb-b"})";
in
{
  programs.gnome-terminal = {
    enable = true;
    profile."b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      default = true;
      loginShell = true;
      customCommand = null;
      font = "${config.stylix.fonts.monospace.name} weight=453 ${builtins.toString config.stylix.fonts.sizes.terminal}";
      visibleName = "tomodachi94";
      colors.palette = [
        # NOTE: Order DOES matter here! Edit with caution.
        (mkRgb "base00") # Black
        (hexToRgb "red") # Red
        (hexToRgb "green") # Green
        (hexToRgb "yellow") # Yellow
        (hexToRgb "blue") # Blue
        (hexToRgb "magenta") # Magenta
        (hexToRgb "cyan") # Cyan
        "rgb(211,215,207)" # White
        "rgb(85,87,83)" # Bright black (gray)
        (hexToRgb "bright-red") # Bright red
        (hexToRgb "bright-green") # Bright green (lime)
        (hexToRgb "bright-yellow") # Bright yellow
        (hexToRgb "bright-blue") # Bright blue
        (hexToRgb "bright-magenta") # Bright magenta
        (hexToRgb "bright-cyan") # Bright cyan
        "rgb(238,238,236)" # Bright white
      ];
      colors.backgroundColor = mkRgb "base00";
      colors.foregroundColor = mkRgb "base05";
    };
  };

  # These files are created by GNOME Terminal.
  # https://floss.social/@tomodachi94/112260860433948002
  xdg.configFile."xdg-terminals.list".text = "org.gnome.Terminal.desktop";
  xdg.configFile."none+i3-xdg-terminals.list".text = "org.gnome.Terminal.desktop";
}
