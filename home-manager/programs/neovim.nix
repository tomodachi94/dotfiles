{ environment, config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    rnix-lsp
    lua-language-server
    stylua
    vale
    rubyPackages_3_2.solargraph
  ];
}
