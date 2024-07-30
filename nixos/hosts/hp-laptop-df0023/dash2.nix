{ config, lib, ... }:
{
  services.dash = {
    enable = true;
    secretsFile = "/home/me/git/github.com/tomodachi94/dash2/.env";
  };

  systemd.services.dash.wantedBy = lib.mkForce [ "network-online.target" ];
}
