{ pkgs, xdg, ... }:
{
  imports = [ ./nix ];
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    VISUAL = "${pkgs.neovim}/bin/nvim";
  };
  xdg.configFile."nvim".source = ./.;
}
