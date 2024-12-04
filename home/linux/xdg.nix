# NOTE: DO NOT INCLUDE XDG.CONFIGFILE SETTINGS HERE :)
{ pkgs, lib, config, ... }:
{
  xdg = {
    userDirs = {
      enable = config.local.system.linux;
    };
    mimeApps = {
      enable = config.local.system.linux;
      defaultApplications = {
        # TODO: Split into modules and conditionally enable these rules if the application is enabled
        "x-scheme-handler/https" = "/etc/profiles/per-user/me/share/applications/librewolf.desktop";
        "x-scheme-handler/http" = "/etc/profiles/per-user/me/share/applications/librewolf.desktop";
        "application/rss+xml" = "${pkgs.liferea}/share/applications/net.sourceforge.liferea.desktop";
        "application/atom+xml" = "${pkgs.liferea}/share/applications/net.sourceforge.liferea.desktop";
        "application/rdf+xml" = "${pkgs.liferea}/share/applications/net.sourceforge.liferea.desktop";
        "x-scheme-handler/feed" = "${pkgs.liferea}/share/applications/net.sourceforge.liferea.desktop";
      };
    };
    configFile."user-dirs.locale" = lib.mkIf config.local.system.linux {
      text = "en_US";
    };
  };
}
