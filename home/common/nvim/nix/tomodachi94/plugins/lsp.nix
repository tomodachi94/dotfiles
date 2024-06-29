{ pkgs, ... }:
{
  /* Config necessary for LSP setup */
  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    nil
    ruff-lsp
    stylua
    selene
    proselint
    mypy
    hunspell
    lexical
  ];
}
