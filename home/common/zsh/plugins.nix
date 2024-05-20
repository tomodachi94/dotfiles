{ pkgs, zsh-craftos-select, ... }:
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
      file = "misc/quitcd/quitcd.bash_sh_zsh";
      src = pkgs.fetchFromGitHub {
        owner = "jarun";
        repo = "nnn";
        rev = "efd5bc9db100d0489cfb3d982a69b04dacaff852";
        sha256 = "sha256-A0XxC8/DNb2GuIxPVUiWNsfaq+UysVRYHG8fl/Iyaaw=";
      };
    }
    {
      name = "craftos-select";
      src = "${zsh-craftos-select.packages.${pkgs.system}.default}";
    }
    {
      name = "vi-mode";
      src = pkgs.zsh-vi-mode;
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
    {
      src = ./functions;
      name = "init.zsh";
    }
  ];

  programs.zsh.sessionVariables = {
    # For vi-mode
    ZVM_LINE_INIT_MODE = "i"; # Default to insert mode
    # For you-should-use
    YSU_MESSAGE_POSITION = "after";
  };

  home.packages = [
    # TODO: Patch the craftos-select plugin to properly set its dependencies
    pkgs.fzf
    pkgs.jq
    pkgs.craftos-pc
  ];
}
