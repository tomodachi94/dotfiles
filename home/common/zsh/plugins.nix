{ config, pkgs, zsh-craftos-select, ... }:
let
  zshCompletions = with pkgs; runCommandNoCC "vendored-zsh-completions" { } ''
    mkdir -p $out
    ${fd}/bin/fd -t f '^_[^.]+$' \
      ${lib.escapeShellArgs config.home.packages} \
      --exec ${ripgrep}/bin/rg -0l '^#compdef' {} \
        | xargs -0 ln -s -t $out/
  '';

in
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

  programs.zsh.initExtra = with pkgs; ''
    fpath=(
      ${zshCompletions}
      $fpath
     )
  '';

  programs.zsh.sessionVariables = {
    # For nnn-quitcd
    NNN_TMPFILE = "${config.xdg.stateHome}/nnn-quitcd-lastd";
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
