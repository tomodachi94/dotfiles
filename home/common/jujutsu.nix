{ config, ... }:
{
  programs.jujutsu = {
    enable = config.local.eagerSetup.enableExtendedCli;
    settings = {
      ui.default-command = "status";
      ui.editor = "nvim";
    };
  };
}
