{ pkgs, ... }:
{
  users.users.me = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "input" # Enable brightness control for the user, e.g. with brightnessctl
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      neovim
      gnome-terminal
      networkmanagerapplet
    ];
  };
}
