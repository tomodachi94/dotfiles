{ pkgs, mkFirejailWrapper }:
{
  librewolf = mkFirejailWrapper {
    inherit pkgs;
    executable = "${pkgs.lib.getExe pkgs.librewolf}";
    profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
    extraArgs = [
      # Enforce dark mode
      "--env=GTK_THEME=Adwaita:dark"
      # Enable system notifications
      "--dbus-user.talk=org.freedesktop.Notifications"
    ];
  };
}
