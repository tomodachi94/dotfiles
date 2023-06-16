{ environment, config, pkgs, lib, tomodachi94, ... }:
{
  programs.git = {
    enable = true;
    includes = [
      /* {
        path = ../../git/config;
      } */
      {
        path = "~/.git-identities";
      }
    ];
    aliases = {
      s = "status";
      unadd = "reset HEAD --";
      visual = "!gitk";
      c = "commit";
      last = "log -1 HEAD";
      cif = "commit --fixup";
      ri = "rebase -i --autosquash";
      xdg-open = "!${pkgs.git}/bin/git remote show origin | ${pkgs.gnugrep}/bin/grep https:// | ${pkgs.gnused}/bin/sed 's/Fetch URL: //g' | ${pkgs.gnused}/bin/sed 's/Push  URL: //g' | ${pkgs.coreutils}/bin/uniq | ${pkgs.findutils}/bin/xargs -n 1 ${pkgs.xdg-utils}/bin/xdg-open"; # Open Git remote 'origin' in default web browser"
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "${pkgs.neovim}/bin/nvim";
      };
      color = {
        ui = "auto";
      };
      help = {
        autocorrect = 20;
      };
      url = {
        "https://github.com/" = {
          insteadOf = "git://github.com";
        };
      };
      credential = {
        helper = [ "cache --timeout 14440" ];
      };
    };
  };

  programs.git.lfs = {
      enable = true;
  };

  programs.git-credential-oauth = {
      enable = true;
  };
}
