#!/usr/bin/env just --justfile

git_dir  := `git rev-parse --show-toplevel`

home hm_args="":
  #!/usr/bin/env sh
  OS_NAME="$(uname -s | tr '[:upper:]' '[:lower:]')"
  OS_ARCH="$(uname -m)"
  home-manager switch --flake ".#$OS_NAME-$OS_ARCH" {{hm_args}}

system nixos_args="":
  sudo nixos-rebuild switch --flake ".#$(hostname)" {{nixos_args}}

update input_name="":
  #!/usr/bin/env sh
  if [ -n "{{input_name}}" ]; then
    nix flake lock --update-input "{{input_name}}"
  else
    nix flake lock
  fi

repl:
  nix repl --expr 'builtins.getFlake "{{git_dir}}"'

format:
  stylua $(git ls-files '*.lua')
  deadnix -eq $(git ls-files '*.nix')
