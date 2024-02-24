{ pkgs, ... }:
# Let's start migrating Zsh here
{
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

    shellAliases = {
      ls = "eza";
      tree = "eza --tree";
      lsdot = "ls -ad .?* 2>/dev/null'"; # Source: https://github.com/Nekohime/dotfiles/blob/main/.aliases

      # Common typos
      sl = "ls";
    };

    plugins = [
      {
        name = "nix-zsh-completions";
        src = "${pkgs.nix-zsh-completions}/share/zsh/site-functions";
      }
      /* {
                   name = "nix-shell";
                   src = "${pkgs.zsh-nix-shell}/share/zsh/site-functions";
                   } */
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

    ];
  };
}
