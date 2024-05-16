{ config, lib, pkgs, ... }:

let

  cfg = config.programs.iamb;
  tomlFormat = pkgs.formats.toml { };

in
{
  meta.maintainers = [ lib.maintainers.tomodachi94 ];

  options.programs.iamb = {
    enable = lib.mkEnableOption "iamb";

    package = lib.mkPackageOption pkgs "iamb" { };

    settings = lib.mkOption {
      inherit (tomlFormat) type;
      default = { };
      example = lib.literalExpression ''
        {
          default_profile = "example.com";

          profiles."example.org" = {
            user_id = "@user:example.org";
          };

          profiles."matrix.example.com" = {
            url = "https://matrix.example.com";
            user_id = "@jdoe10:example.com";
          };
        }
      '';
      description = ''
        Configuration written to {file}`$XDG_CONFIG_HOME/iamb/config.toml`.

        See <https://iamb.chat/configure.html> for available options and
        documentation.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."iamb/config.toml" = lib.mkIf (cfg.settings != { }) {
      source = tomlFormat.generate "config.toml" cfg.settings;
    };
  };
}
