{ ... }:
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
    initExtra = ". ~/.zsh/init.zsh"; # TODO: This has things that haven't been migrated to Nix; we should finish that
	initExtraBeforeCompInit = ''
    fpath+=${./functions}
    fpath+=${./completions}
	'';
    history = {
      ignoreSpace = true;
      ignoreDups = true;
    };
  };
}
