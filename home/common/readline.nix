{ config, ... }:
{
  programs.readline = {
    enable = config.local.eagerSetup.enableExtendedCli;
    variables = {
      editing-mode = "vi";
      completion-ignore-case = true;
      enable-bracketed-paste = true;
    };
  };
}
