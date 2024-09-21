{ pkgs, lib, config, options, ... }:
let
  cfg = config.bitwarden-secrets;
  mkService: { name, secrets ? [] } = lib.mkOption {
    path = [ cfg.package ];
    before = [ "bitwarden-secrets-teardown.service" ];
    unitConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      DynamicUser = true;
      Exec = lib.map
        (secret_id: ''
          bws secret get ${secret_id} \
            --output=env \
            --access-token=$(cat /etc/bitwarden-secrets.access-token) \
            >> /run/bitwarden-secrets/${name}
        '')
        secrets;
    };
  };
in
{
  options.bitwarden-secrets = {
    enable = lib.mkEnableOption "bitwarden-secrets";
    package = lib.mkPackageOption pkgs "bws";
  };

  config = lib.mkIf cfg.enable {
    systemd = {
      slices.bitwarden-secrets = {
        description = "Slice for Secrets from Bitwarden Secrets";
      };

      tmpfiles.rules = [
        "d /run/bitwarden-secrets"
      ]

        services = {
      bitwarden-secrets-teardown = {
      description = "Service which deletes all secrets in /run/bitwarden-secrets, executed when the system is shutting down";
      unitConfig = {
        Type = "oneshot";
        ExecStart = "true";
        RemainAfterExit = true;
        ExecStop = ''
          rm -rf /run/bitwarden-secrets
        '';
      };
    };
  };
};
}
}
