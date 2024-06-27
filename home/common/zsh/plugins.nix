{ config, pkgs, tomopkgs, zsh-craftos-select, ... }:
{
  programs.zsh.plugins = [
    {
      name = "nix-zsh-completions";
      src = "${pkgs.nix-zsh-completions}/share/zsh/site-functions";
    }
    {
      name = "nix-shell";
      src = "${pkgs.zsh-nix-shell}/share/zsh/site-functions";
    }
    {
      name = "nnn-quitcd";
      file = "share/quitcd/quitcd.bash_sh_zsh";
      src = pkgs.nnn;
    }
    {
      name = "craftos-select";
      src = "${zsh-craftos-select.packages.${pkgs.system}.default}";
    }
    {
      name = "vi-mode";
      src = pkgs.zsh-vi-mode;
      file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
    }
    rec {
      name = "you-should-use";
      src = pkgs.zsh-you-should-use;
      file = "share/zsh/plugins/${name}/${name}.plugin.zsh";
    }
    rec {
      name = "bd";
      src = pkgs.zsh-bd;
      file = "share/zsh-${name}/${name}.plugin.zsh";
    }
    rec {
      name = "window-title";
      src = tomopkgs.${pkgs.system}.zsh-window-title;
      file = "share/zsh/plugins/zsh-${name}/zsh-${name}.plugin.zsh";
    }
    {
      name = "auto-notify";
      src = pkgs.fetchFromGitHub {
        owner = "MichaelAquilina";
        repo = "zsh-auto-notify";
        rev = "837b81de92cbf12d45d638b77f1ecd6a942266fe";
        hash = "sha256-U4XJymu2SDzBAXTp88utcQRwYnOUY4RVXYrtGFbh3dM=";
      };
    }
    {
      src = ./functions;
      name = "init.zsh";
    }
  ];

  programs.zsh.sessionVariables =
    let
      zsh-auto-notify-ignore-default = [
        "vim"
        "nvim"
        "less"
        "more"
        "man"
        "tig"
        "watch"
        "git commit"
        "top"
        "htop"
        "ssh"
        "nano"
      ];
    in
    {
      # For nnn-quitcd
      NNN_TMPFILE = config.xdg.stateHome;
      # For vi-mode
      ZVM_LINE_INIT_MODE = "i"; # Default to insert mode
      # For you-should-use
      YSU_MESSAGE_POSITION = "after";
      # For auto-notify
      AUTO_NOTIFY_IGNORE = zsh-auto-notify-ignore-default ++ [
        "zsh"
        "bash"
        "nix-shell"
        "nix develop"
      ];
    };

  home.packages = [
    # TODO: Patch the craftos-select plugin to properly set its dependencies
    pkgs.fzf
    pkgs.jq
    pkgs.craftos-pc
  ];
}
