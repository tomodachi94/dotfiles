{ vars, homeInputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];

  home-manager.users.me = { pkgs, vars, ... }: {
    imports = [ ../../home/common ../../home/linux ];
  };

  home-manager.extraSpecialArgs = homeInputs;

  home-manager.useUserPackages = true;

  networking.hostName = "hp-laptop-df0023"; # Define your hostname.
}
