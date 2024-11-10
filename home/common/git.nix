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
      xdg-open = "!${pkgs.lib.getExe pkgs.github-cli} browse";
      sync-upstream = "!${pkgs.git}/bin/git fetch upstream master && ${pkgs.git}/bin/git rebase upstream/master && ${pkgs.git}/bin/git push origin master";
    };
    ignores = [
      ".direnv/"
      "/tags" # Neovim
    ];
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
      commit = {
        # Show full diff when running `git commit`
        verbose = true;
        # Sign commits automatically
        gpgsign = true;
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

  home.packages = with pkgs; [
    git-absorb
  ];
}
