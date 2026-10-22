{ pkgs, args, ... }:
{
  users.users.me = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "input" # Enable brightness control for the user, e.g. with brightnessctl
    ];
    shell = pkgs.zsh;
  };

  home-manager.extraSpecialArgs = args;
  home-manager.useUserPackages = true;

  home-manager.users.me = { ... }: {
    imports = [ ../../home/common ../../home/linux ];
  };
}
