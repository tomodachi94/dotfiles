# NOTE: DO NOT INCLUDE XDG.CONFIGFILE SETTINGS HERE :)
{
  xdg = {
    userDirs = {
      enable = true;
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/https" = "/etc/profiles/per-user/me/share/applications/librewolf.desktop";
        "x-scheme-handler/http" = "/etc/profiles/per-user/me/share/applications/librewolf.desktop";
      };
    };
    configFile."user-dirs.locale".text = "en_US";
  };
}
