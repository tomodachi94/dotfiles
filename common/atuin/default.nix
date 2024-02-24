{ ... }:
{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      update_check = false; # We're using Nix, remember?
      dialect = "us";
      auto_sync = false;
      sync_address = false;
      style = "compact";
    };
  };
}

