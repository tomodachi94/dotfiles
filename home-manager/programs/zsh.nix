{ environment, config, pkgs, lib, ... }:
# Let's start migrating Zsh here
let
  zsh_home = ../../zsh;
in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    initExtra = ''
    setopt extendedglob

    #builtins.readFile ../../zsh/path.zsh}
    #builtins.readFile ../../zsh/aliases.zsh}
    #builtins.readFile ../../zsh/functions/init.zsh}

	. ${pkgs.nix-zsh-completions}/share/zsh/site-functions/nix-zsh-completions.plugin.zsh
	. ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh
    ''; # TODO: This has things that haven't been migrated to Nix; we should finish that
    history = {
      ignoreSpace = true;
      ignoreDups = true;
    };

    shellAliases = {
      ls = "exa";
      tree = "exa --tree";
      lsdot = "ls -ad .?* 2>/dev/null'"; # Source: https://github.com/Nekohime/dotfiles/blob/main/.aliases

      # Common typos
      sl = "ls";
    };
  };
}
