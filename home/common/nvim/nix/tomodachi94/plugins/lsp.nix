{ pkgs, ... }:
{
  /* Config necessary for LSP setup */
  home.packages = with pkgs; [
    lua-language-server
	rust-analyzer
	rnix-lsp
	ruff
	stylua
	selene
	proselint
	mypy
	hunspell
  ];
}
