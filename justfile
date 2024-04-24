#!/usr/bin/env just --justfile

git_dir  := `git rev-parse --show-toplevel`

configure_git:
  git config user.name "Tomo"
  git config user.email "68489118+Tomodachi94@users.noreply.github.com"

develop: configure_git

build *args:
  sudo nixos-rebuild switch --flake ".#$(hostname)" {{args}}

update input_name="":
  #!/usr/bin/env sh
  if [ -n "{{input_name}}" ]; then
    nix flake lock --update-input "{{input_name}}"
  else
    nix flake lock
  fi

# aliases for legacy habits
home: build
system: build

repl:
  nix repl --expr 'builtins.getFlake "{{git_dir}}"'

format:
  stylua $(git ls-files '*.lua')
  deadnix -eq $(git ls-files '*.nix')
  statix fix
  nixpkgs-fmt $(git ls-files '*.nix')

check-flake-outputs:
  nix flake check --all-systems --verbose

ci: check-flake-outputs
