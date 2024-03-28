{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    includes = [
      {
        path = "~/.git-identities";
      }
    ];
    aliases = {
      s = "status";
      unadd = "reset HEAD --";
	  nvim = "!${pkgs.lib.getExe pkgs.neovim} +:G +':bd 1'"; # Open vim-fugitive
      c = "commit";
      last = "log -1 HEAD";
      xdg-open = "!${pkgs.git}/bin/git remote show origin | ${pkgs.gnugrep}/bin/grep https:// | ${pkgs.gnused}/bin/sed 's/Fetch URL: //g' | ${pkgs.gnused}/bin/sed 's/Push  URL: //g' | ${pkgs.coreutils}/bin/uniq | ${pkgs.findutils}/bin/xargs -n 1 ${pkgs.xdg-utils}/bin/xdg-open"; # Open Git remote 'origin' in default web browser"
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "${pkgs.lib.getExe pkgs.neovim}";
      };
      color = {
        ui = "auto";
      };
	  diff = {
        algorithm = "histogram";
        tool = "${pkgs.lib.getExe pkgs.neovim} -d";
	  };
	  # Guesses what I mean when I make a mistake
      help = {
        autocorrect = "prompt";
      };
	  # Reduce mistakes
      url = {
        "https://github.com/" = {
          insteadOf = "git://github.com";
        };
      };
	  # Show full diff when running `git commit`
	  commit = {
        verbose = true;
	  };
	  # Push to branch origin/whatever_my_current_branch_is if no upstream branch is set
	  push = {
        default = "current";
	  };
	  # Always `git pull --rebase`.
	  pull = {
        rebase = true;
	  };
	  # Better diff style
	  merge = {
        conflictstyle = "zdiff3";
	  };
	  # Helpful for rebases
	  rebase = {
        autosquash = true;
		autostash = true;
	  };
	  # Run some validation on Git objects to prevent weirdness from occuring
	  transfer = {
	    fsckobjects = true;
      };
      fetch = {
	    fsckobjects = true;
	  };
      receive = {
	    fsckObjects = true;
	  };
	  # Cache git logins
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
