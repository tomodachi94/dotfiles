#!/usr/bin/env just --justfile

git_dir  := `git rev-parse --show-toplevel`

home hm_args="":
  #!/usr/bin/env sh
  OS_NAME="$(uname -s | tr '[:upper:]' '[:lower:]')"
  OS_ARCH="$(uname -m)"
  home-manager switch --flake ".#$OS_NAME-$OS_ARCH" {{hm_args}}

system nixos_args="":
  sudo nixos-rebuild switch --flake ".#$(hostname)" {{nixos_args}}

repl:
  nix repl --expr 'builtins.getFlake "{{git_dir}}"'

format:
  stylua $(git ls-files '*.lua')
  deadnix -eq $(git ls-files '*.nix')
