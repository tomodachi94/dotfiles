{ pkgs, pre-commit-hooks, ... }:
{
  pre-commit-check = pre-commit-hooks.lib.${pkgs.system}.run {
    src = ./.;
    hooks = {
      ci = {
        enable = true;
        name = "just ci: check formatting";
        entry = "${pkgs.just}/bin/just check-formatting";
        pass_filenames = false;
      };
    };
  };
}
