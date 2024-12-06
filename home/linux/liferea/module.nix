{ pkgs, lib, config, ... }:
let
  cfg = config.programs.liferea;
in
{

  options.programs.liferea = {
    enable = lib.mkEnableOption "Liferea, a Linux feed reader";
    package = lib.mkPackageOption pkgs "liferea" { };

    style = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "Text to be written to {file}`$XDG_CONFIG_DIR/liferea/style.css`.";
    };

    settings = lib.mkOption {
      type = lib.types.submodule {
        freeformType = lib.types.attrsOf lib.types.anything;
        options = {};
      };
      default = {};
      description = ''
        Liferea settings.

        These values are passed directly to the dconf `/org/gnome/liferea`
        subkey.

        Canonical list of settings:
        https://github.com/lwindolf/liferea/blob/master/net.sf.liferea.gschema.xml.in
      '';
    };

    plugins = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = ''
        A list of packages containing Liferea plugins.

        The packages will be combined into one directory and placed
        into {file}`$XDG_DATA_DIR/liferea/plugins/`.

        Each package should have a file with the .plugin extension
        at its root, following the default format.

        More information:
        https://github.com/lwindolf/liferea/blob/master/plugins/README.md
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.mimeApps.defaultAssociations = {
      # FIXME: Is the absolute path necessary when we append to home.packages?
      # Also: Is this too eager?
      "application/rss+xml" = "${cfg.package}/share/applications/net.sourceforge.liferea.desktop";
      "application/atom+xml" = "${cfg.package}/share/applications/net.sourceforge.liferea.desktop";
      "application/rdf+xml" = "${cfg.package}/share/applications/net.sourceforge.liferea.desktop";
      "x-scheme-handler/feed" = "${cfg.package}/share/applications/net.sourceforge.liferea.desktop";
    };

    dconf.settings."org/gnome/liferea" = cfg.settings;

    xdg.configFile."liferea/style.css" = lib.mkIf (cfg.style != "") {
      text = cfg.style;
    };

    xdg.dataFile."liferea/plugins" = lib.mkIf (cfg.plugins != [ ]) {
      source = pkgs.symlinkJoin {
        name = "liferea-plugins";
        paths = cfg.plugins;
      };
    };
  };
}
