{ pkgs, config, lib, ... }:
{
  /* Config necessary for LSP setup */
  home.packages = lib.optionals config.local.eagerSetup.enableHeavyDevelop (with pkgs; [
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
  ]);
}
