#!/usr/bin/env just --justfile

parent_flake_nixpkgs_hash := `nix flake metadata --json | jq -r .locks.nodes.nixpkgs.locked.rev`

repl:
  nix repl --expr 'builtins.getFlake "{{git_dir}}"'

sync-pkgs-subflake:
  cd ./pkgs && nix flake update \
  --override-input nixpkgs \
    github:nixos/nixpkgs/{{parent_flake_nixpkgs_hash}}

update-all:
  #!/usr/bin/env sh
  set -euxo pipefail
  nix flake update --commit-lock-file
  if git show HEAD | grep 'flake.lock: Update'; then
    just sync-pkgs-subflake
    git add ./pkgs/flake.lock && git commit --amend --no-edit
  fi

update-lazy:
  #!/usr/bin/env sh
  set -euxo pipefail
  if [ -f $HOME/.config/nvim/lazy-lock.json ]; then
    nvim --headless +"Lazy! update" +"qa"
  else
    echo "error: $HOME/.config/nvim/lazy-lock.json missing. Did you install with the instructions in /README.md?"
    exit 1
  fi

format:
  treefmt --config-file ./lib/tooling-config/treefmt.toml --tree-root {{git_dir}}
