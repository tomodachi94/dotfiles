{ pkgs, config, ... }:
{
  # A very simple .bashrc for when I need to use nix-shell.
  home.file.".bashrc".text = ''
    eval "$(${pkgs.lib.getExe config.programs.atuin.package} init bash)"
  '';
}
