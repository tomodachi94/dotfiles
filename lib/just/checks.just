#!/usr/bin/env just --justfile

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

ci: check-formatting lint
