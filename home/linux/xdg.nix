# NOTE: DO NOT INCLUDE XDG.CONFIGFILE SETTINGS HERE :)
{ pkgs, config, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
    };
    mimeApps = {
      enable = true;
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
    configFile."user-dirs.locale".text = "en_US";
  };
}
