{ environment, config, pkgs, lib, ... }:

let
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs; };
in
{
  imports = [./home_files.nix];

  home.username = "me";
  home.homeDirectory = "/home/me";
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    VISUAL = "${pkgs.neovim}/bin/nvim";
  };

  targets.genericLinux.enable = true;
  
  home.packages = [
    pkgs.coreutils # Duh
    pkgs.zsh # Shell
    pkgs.git # Version control
    pkgs.neovim # Text editor
    pkgs.vivaldi # Web browser
    pkgs.exa # Better ls
    pkgs.ripgrep # Better grep
    pkgs.bat # Better cat
    pkgs.renameutils # Do repetitive stuff faster
    # pkgs.nnn # File manager
    pkgs.starship # Shell prompt
    pkgs.gnome.gnome-terminal
    pkgs.atuin # Better shell history

    pkgs.nerdfonts # Monospaced font with icons

    pkgs.vscodium-fhs # GUI IDE

    # Chat
    pkgs.discord
    pkgs.element-desktop

    # Notes
    pkgs.obsidian
    pkgs.jot

    # Process management
    pkgs.lxqt.qps

    # Recording
    pkgs.kazam
    pkgs.audacity

	  # Development
	  pkgs.direnv
    pkgs.virtualbox

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

  gtk = {
    enable = true;
    cursorTheme.package = pkgs.vanilla-dmz;
    cursorTheme.name = "Vanilla-DMZ";
    cursorTheme.size = 23;
    font.package = pkgs.ibm-plex;
    font.name = "IBM Plex Sans";
    font.size = 10;
    theme.package = pkgs.gnome.adwaita-icon-theme;
    theme.name = "Adwaita-dark";
    iconTheme.package = pkgs.cinnamon.mint-y-icons;
    iconTheme.name = "Mint-Y-Dark-Grey";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-button-images = 0;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = 1;
      gtk-enable-event-sounds = 0;
      gtk-enable-input-feedback-sounds = 0;
      gtk-menu-images = 1;
      gtk-primary-button-warps-slider = 0;
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk3.extraCss = ''
    style "cs-scrollbar-style" {
      GtkScrollbar::slider-width = 10
    }

    class "GtkScrollbar" style "cs-scrollbar-style"
    '' + builtins.readFile ../gtk-3.0/colors.css;
  };

  # Let's start migrating Zsh here
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    initExtra = ". ~/.zsh/init.zsh"; # TODO: This has things that haven't been migrated to Nix; we should finish that
    history = {
      ignoreSpace = true;
      ignoreDups = true;
    };

    plugins = [
      {
        name = "completions-nix";
        src = pkgs.nix-zsh-completions.src;
      }
      {
        name = "zsh-nix-shell";
        src = pkgs.zsh-nix-shell.src;
      }
      {
        name = "nnn-quitcd";
        src = pkgs.fetchFromGitHub {
            owner = "jarun";
            repo = "nnn";
            rev = "efd5bc9db100d0489cfb3d982a69b04dacaff852";
            sha256 = "sha256-A0XxC8/DNb2GuIxPVUiWNsfaq+UysVRYHG8fl/Iyaaw=";
        };
      }
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
  services.dunst = {
      enable = false; # Only works on NixOS; TODO: reenable this when we switch
      configFile = "/home/me/.config/dunst/config";
  };
}
