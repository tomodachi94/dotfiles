{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.neovide;

  settingsFormat = pkgs.formats.toml { };

in {
  meta.maintainers = with hm.maintainers; [ tomodachi94 ];

  options.programs.neovide = {
    enable = mkEnableOption
      "neovide, a simple, no-nonsense, cross-platform graphical user interface for Neovim";

    package = mkPackageOption pkgs "neovide" { };

    settings = mkOption {
      type = settingsFormat.type;
      example = lib.literalExpression ''
        {
          wsl = false;
          no-multigrid = false;
          vsync = true;
          maximized = false;
          srgb = false;
          idle = true;
          neovim-bin = "${pkgs.lib.getExe myCustomNeovimPackage}";
          frame = "full";
          title-hidden = true;
          tabs = true;
          font = {
            normal = [ "MonoLisa Nerd Font" ];
            size = 18;
            features = {
              MonoLisa = [ "+ss01" "+ss07" "+ss11" "-calt" "+ss09" "+ss02" "+ss14" "+ss16" "+ss17" ];
            };
          };
        }
      '';
      default = {
        neovim-bin = lib.mkDefault (lib.getExe config.programs.neovim.package); # Respect the user's programs.neovim configuration
      };
      description = ''
        Neovide configuration, written to {file}`$XDG_CONFIG_HOME/neovide/config.toml`.
        For available settings and default values, see <https://neovide.dev/config-file.html>.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."neovide/config.toml".source =
      settingsFormat.generate "neovide-config.toml" cfg.settings;
  };
}
