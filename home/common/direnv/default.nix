{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    config = {
      global = {
        hide_env_diff = true;
        warn_timeout = "1m";
      };
    };
  };
}
