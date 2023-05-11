{ environment, config, pkgs, lib, ... }:

let
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs; };
in
{
  home.username = "me";
  home.homeDirectory = "/home/me";
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  targets.genericLinux.enable = true;
  
  home.packages = [
    # pkgs.home-manager
    pkgs.zsh # Shell
    pkgs.git # Version control
    pkgs.neovim # Text editor
    pkgs.vivaldi # Web browser
    pkgs.exa # Better ls
    pkgs.ripgrep # Better grep
    pkgs.bat # Better cat
    # pkgs.nnn # File manager
    pkgs.starship # Shell prompt
    pkgs.kitty # Terminal
    pkgs.atuin # Better shell history

    pkgs.nerdfonts # Monospaced font with icons

    pkgs.vscodium-fhs # GUI IDE

    # Chat
    pkgs.discord
    pkgs.element-desktop

    # Notes
    pkgs.obsidian
    pkgs.jot

	  # Development
	  pkgs.direnv

    # Specialized tools: FTB Wiki
    nur.repos.ftbwiki.ftb-rs
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  # I don't have a need for module news
  news.display = "silent";

  # Let Home Manager manage Nix and Nixpkgs for us
  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs; };
      };
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://cache.nixos.org" "https://tomodachi94.cachix.org" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "tomodachi94.cachix.org-1:E1WFk+SYPtq3FFO+NvDgsyciIHg8nHxB/z7qNfojxpI=" ];
    };
  };
  
  # Let HM manage fonts
  fonts.fontconfig.enable = true;

  programs.dircolors.enable = true;
  
  # Setup default browser (Vivaldi)
  xdg.mimeApps = {
    enable = false;
    defaultApplications = {
      "x-scheme-handler/http" = ["vivaldi-stable.desktop"];
      "x-scheme-handler/https" = ["vivaldi-stable.desktop"];
      "x-scheme-handler/chrome" = ["vivaldi-stable.desktop"];
      "text/html" = ["vivaldi-stable.desktop"];
      "application/x-extension-htm" = ["vivaldi-stable.desktop"];
      "application/x-extension-html" = ["vivaldi-stable.desktop"];
      "application/x-extension-shtml" = ["vivaldi-stable.desktop"];
      "application/xhtml+xml" = ["vivaldi-stable.desktop"];
      "application/x-extension-xhtml" = ["vivaldi-stable.desktop"];
      "application/x-extension-xht" = ["vivaldi-stable.desktop"];
    };
  };

  xresources.properties = {
    "Xft.dpi" = 115;
  };

  # Let's start migrating Zsh here
  programs.zsh = {
    enable = true;
    zplug.enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    initExtra = ". ~/.zsh/init.zsh"; # TODO: This has things that haven't been migrated to Nix; we should finish that
    history = {
      ignoreSpace = true;
      ignoreDups = true;
    };
    zplug.plugins = [
      { name = "jarun/nnn"; tags = [ ''use:"misc/quitcd/quitcd.bash_zsh"'' ]; }
      { name = "chisui/zsh-nix-shell"; tags = [ ''if:"[[ -d /nix ]]"'' ]; } # Integrate cleanly with Nix
      { name = "spwhitt/nix-zsh-completions"; } # Nix shell completion

    ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
	  directory.substitutions = {
        "git" = " ";
	  };
    };
  };

  programs.nnn = {
    enable = true;
    plugins = {
      src = "${pkgs.nnn.src}/plugins";
      mappings = {
        d = "diffs";
      };
    };
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      update_check = false; # We're using Nix, remember?
      dialect = "us";
      auto_sync = false;
      sync_address = false;
      style = "compact";
    };
  };

  programs.direnv = {
    enable = true;
	nix-direnv.enable = true;
	enableZshIntegration = true;
  };

/* TODO: Fix colors.palette
  programs.gnome-terminal = {
    enable = true;
    profile.b1dcc9dd-5262-4d8d-a863-c897e6d979b9 = {
      loginShell = true;
      customCommand = null;
      font = "BlexMono Nerd Font weight=453 12";
      visibleName = "tomodachi94";
      colors = {
        palette = [
          ''rgb(46,52,54)''
          ''rgb(204,0,0)''
          ''rgb(78,154,6)''
          ''rgb(196,160,0)''
          ''rgb(52,101,164)''
          ''rgb(117,80,123)''
          ''rgb(6,152,154)''
          ''rgb(211,215,207)''
          ''rgb(85,87,83)''
          ''rgb(239,41,41)''
          ''rgb(138,226,52)''
          ''rgb(252,233,79)''
          ''rgb(114,159,207)''
          ''rgb(173,127,168)''
          ''rgb(52,226,226)''
          ''rgb(238,238,236)''
        ];
      };
    };
  }; */
}
