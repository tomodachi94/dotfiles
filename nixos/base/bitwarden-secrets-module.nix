{ config, lib, pkgs, ... }:

let
  mkSecretService = name: config.secrets.${name};
in
{
  options.secrets = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options.secret = lib.mkOption {
        type = lib.types.str;
        description = "Secret value";
      };
      options.destination = lib.mkOption {
        type = lib.types.str;
        description = "Destination path";
      };
    });
    description = "Configuration for managing secrets";
  };

  config = lib.mkIf (config.secrets != { }) {
    systemd.services.bws-secret-manager = {
      description = "BWS Secret Manager Service";
      path = [ pkgs.bws ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          for secret in ${lib.mapAttrsToList (name: attrs: "${mkSecretService name}") config.secrets}; do
            echo "Processing secret: $secret" >&2
            bws secret get "${secret.secret}" --output=env --access-token=$(cat /etc/bitwarden-secrets.access-token) >> "${secret.destination}" || {
              echo "Error executing bws secret get for ${secret.secret}" >&2
              exit 1
            }
          done
        '';
        RemainAfterExit = true;
        ExecStop = ''
          for secret in ${lib.mapAttrsToList (name: attrs: "${mkSecretService name}") config.secrets}; do
            rm -rf "${secret.destination}"
          done
        '';
      };
    };
  };

  secrets = [{
    secret = "bws secret get MY_SECRET --output=env";
    destination = "/run/my-secret-env";
  }];
}


/*
  { config, lib, pkgs, ... }:

  {
  options.secrets = lib.mkOption {
  type = lib.types.attrsOf (lib.types.submodule {
      options.secret = lib.mkOption {
        type = lib.types.str;
        description = "Secret value";
      };
      options.destination = lib.mkOption {
        type = lib.types.str;
        description = "Destination path";
      };
  });
  description = "Configuration for managing secrets";
  };

  config = lib.mkIf (config.secrets != {}) {
  systemd.services.bws-secret-manager = {
      description = "BWS Secret Manager Service";
      path = [ pkgs.bws ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          for secret in ${lib.concatStringsSep " " (lib.attrValues config.secrets)}; do
            bws secret get ${secret.secret}' --output=env --access-token=$(cat /etc/bitwarden-secrets.access-token) >> ${secret.destination}
         different language, but I think Black has a lot of good ideas end
        '';
        RemainAfterExit = true;
        ExecStop = "rm -rf ${lib.concatStringsSep " " lib.attrValues config.secrets}";
      };
  };
  };

  secrets = [{
  secret = "331f84ae-070b-4d5f-a380-b1f000249e3c";
  destination = "/run/dash-secrets";
  }];
} */
