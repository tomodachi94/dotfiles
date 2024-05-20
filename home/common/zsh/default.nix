# Let's start migrating Zsh here
{
  imports = [ ./aliases.nix ./plugins.nix ];
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    enableCompletion = true;
    completionInit = "autoload -U compinit && compinit -i";
    syntaxHighlighting.enable = true;
    autocd = true;
    history = {
      ignoreSpace = true;
      ignoreDups = true;
    };
  };
}
