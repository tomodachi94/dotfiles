{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    inotify-tools
  ];
  systemd.user.services.dunstifyOnConfigChange = {
    Unit = {
      Description = "Notify on config file changes";
      After = [ "dunst.service" ];
    };
    Service = {
      ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.inotify-tools}/bin/inotifywait --monitor --recursive --event create --format \"%w%f\" ${config.xdg.configHome} | while read file; do ${pkgs.dunst}/bin/dunstify \"File created in ~/.config\" \"$file\"; done'";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
