{
  programs.zsh.shellAliases = {
    ls = "eza";
    tree = "eza --tree";
    lsdot = "ls -ad .?* 2>/dev/null"; # Source: https://github.com/Nekohime/dotfiles/blob/main/.aliases

    # Common typos
    sl = "ls";
  };
}
