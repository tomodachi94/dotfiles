{ config, pkgs, lib, tomopkgs, ... }:
let
  cfg = config.bios.hpuefi;
in
{
  options = {
    bios.hpuefi = {
      enable = lib.mkEnableOption "the hpuefi kernel module and the associated hp-linuxtools";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ tomopkgs.${pkgs.system}.hp-linuxtools ];
    boot.extraModulePackages = [ config.boot.kernelPackages.hpuefi-mod ];
    boot.kernelModules = [ "hpuefi-mod" ];
    systemd.services.dash = {
      description = "Dash, a bot for the FTB Wiki Discord";
      documentation = [ "https://github.com/tomodachi94/dash2" ];
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = lib.getExe config.services.dash.package;
        EnvironmentFile = config.services.dash.secretsFile;
        DynamicUser = true;
        NoNewPrivileges = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        DevicePolicy = "closed";
        ProtectHome = true;
        ProtectControlGroups = true;
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        MemoryDenyWriteExecute = true;
        LockPersonality = true;
        ProtectHostname = true;
      };
    };

  };
}
