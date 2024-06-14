#!/usr/bin/env just --justfile

git_dir  := `git rev-parse --show-toplevel`

build *args:
  sudo nixos-rebuild switch --flake ".#$(hostname)" {{args}}

update input_name="":
  #!/usr/bin/env sh
  set -euxo pipefail
  if [ -n "{{input_name}}" ]; then
    nix flake lock --update-input "{{input_name}}" --commit-lock-file
  else
    nix flake lock --commit-lock-file
    cd ./pkgs
    nix flake update \
      --override-input nixpkgs \
      github:nixos/nixpkgs/$(nix flake metadata --json '../.#' | jq -r '.locks.nodes.nixpkgs.locked.rev')
    git add ./flake.lock
    git commit --amend --no-edit
  fi

# aliases for legacy habits
home: build
system: build

repl:
  nix repl --expr 'builtins.getFlake "{{git_dir}}"'

format:
  treefmt --config-file ./lib/tooling-config/treefmt.toml --tree-root {{git_dir}}

lint:
  selene --allow-warnings --config ./lib/tooling-config/selene.toml {{git_dir}} --quiet
  statix check --config ./lib/tooling-config/statix.toml

check-flake-outputs:
  #!/usr/bin/env sh
  set -euxo pipefail
  export NIXPKGS_ALLOW_UNFREE=1
  export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1
  nix flake check --all-systems --verbose --impure

check-formatting:
  treefmt --fail-on-change --no-cache --config-file ./lib/tooling-config/treefmt.toml --tree-root {{git_dir}}

ci: check-flake-outputs check-formatting lint
