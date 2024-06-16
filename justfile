#!/usr/bin/env just --justfile

git_dir  := `git rev-parse --show-toplevel`

build *args:
  sudo nixos-rebuild switch --flake ".#$(hostname)" {{args}}

# aliases for legacy habits
home: build
system: build

repl:
  nix repl --expr 'builtins.getFlake "{{git_dir}}"'

sync-pkgs-subflake:
  cd ./pkgs && nix flake update \
  --override-input nixpkgs \
    github:nixos/nixpkgs/$(nix flake metadata --json '..#' | jq -r '.locks.nodes.unstable.locked.rev') \
  --commit-lock-file

update-all:
  #!/usr/bin/env sh
  set -euxo pipefail
  nix flake update --commit-lock-file
  if git show HEAD | grep 'flake.lock: Update'; then
    just sync-pkgs-subflake
    git add ./pkgs/flake.lock && git commit --amend --no-edit
  fi

format:
  treefmt --config-file ./lib/tooling-config/treefmt.toml --tree-root {{git_dir}}

_format-wrapper-statix *files:
  #!/usr/bin/env sh
  set -euxo pipefail
  for file in {{files}}; do
    statix fix --config lib/tooling-config/statix.toml "$file"
  done

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
