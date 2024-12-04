{ config, lib, ... }:
{
  programs.starship = {
    enable = config.local.eagerSetup.enableExtendedCli;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      directory.substitutions = lib.mkIf config.fonts.fontconfig.enable {
        "git" = " ";
      };
    };
  };
}
