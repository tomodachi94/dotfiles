{ vars, config, ... }:
{
  programs.gnome-terminal = {
    enable = config.local.system.linux && config.local.eagerSetup.enableGraphicalApps;
    profile."b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      default = true;
      loginShell = true;
      customCommand = null;
      font = "${vars.font.monospace} weight=453 12";
      visibleName = "tomodachi94";
      colors.palette = [
        "rgb(46,52,54)"
        "rgb(204,0,0)"
        "rgb(78,154,6)"
        "rgb(196,160,0)"
        "rgb(52,101,164)"
        "rgb(117,80,123)"
        "rgb(6,152,154)"
        "rgb(211,215,207)"
        "rgb(85,87,83)"
        "rgb(239,41,41)"
        "rgb(138,226,52)"
        "rgb(252,233,79)"
        "rgb(114,159,207)"
        "rgb(173,127,168)"
        "rgb(52,226,226)"
        "rgb(238,238,236)"
      ];
      colors.backgroundColor = "rgb(46,52,54)";
      colors.foregroundColor = "rgb(207,214,193)";
    };
  };

  # These files are created by GNOME Terminal.
  # https://floss.social/@tomodachi94/112260860433948002
  xdg.configFile."xdg-terminals.list".text = "org.gnome.Terminal.desktop";
  xdg.configFile."none+i3-xdg-terminals.list".text = "org.gnome.Terminal.desktop";
}
