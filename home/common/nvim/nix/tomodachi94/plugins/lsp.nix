{ pkgs, ... }:
{
  /* Config necessary for LSP setup */
  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    nil
    ruff
    stylua
    selene
    proselint
    mypy
    hunspell
    lexical
  ];
}
