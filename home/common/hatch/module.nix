{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.hatch;

  settingsFormat = pkgs.formats.toml { };

in
{
  meta.maintainers = [ hm.maintainers.tomodachi94 ];

  options.programs.hatch = {
    enable = mkEnableOption "Hatch, a tool for creating and managing Python projects";

    package = mkOption {
      default = null;
      type = types.nullOr package;
    };

    settings = mkOption {
      inherit (settingsFormat) type;
      example = lib.literalExpression ''
        {
          dirs = {
            virtual = "$\{config.home.homeDirectory}/.virtualenvs";
          };
          shell = "fish";
        }
      '';
      description = ''
        Hatch configuration.
        For available settings, see <https://hatch.pypa.io/dev/config/hatch/>.
      '';
      default = {
        dirs = {
          data = "${config.xdg.dataHome}/hatch";
          cache = "${config.xdg.cacheHome}/hatch";
        };
      };
      defaultText = literalExpression ''
        {
          dirs = {
            data = "$\{config.xdg.dataHome}/hatch";
            cache = "$\{config.xdg.cacheHome}/hatch";
          };
        }
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."hatch/config.toml".source =
      settingsFormat.generate "hatch-config.toml" cfg.settings;
  };
}
