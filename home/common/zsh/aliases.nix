{ pkgs, config, ... }:
let
  eza = pkgs.lib.getExe config.programs.eza.package;
in
{
  programs.zsh.shellAliases = {
    ls = "${eza}";
    tree = "${eza} --tree";
    lsdot = "${eza} -ad .?* 2>/dev/null"; # Source: https://github.com/Nekohime/dotfiles/blob/main/.aliases
	c = "clear";

    # Common typos
    sl = "${eza}";
  };
}
