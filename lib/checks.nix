{ pkgs, inputs, ... }:
{
  pre-commit-check = inputs.pre-commit-hooks.lib.${pkgs.stdenvNoCC.hostPlatform.system}.run {
    src = ./.;
    hooks = {
      ci-check-formatting = {
        enable = true;
        name = "just ci: check formatting";
        entry = "${pkgs.just}/bin/just check-formatting";
        pass_filenames = false;
      };
      ci-linting = {
        enable = true;
        name = "just ci: lint";
        entry = "${pkgs.just}/bin/just lint";
        pass_filenames = false;
      };
    };
  };
}
