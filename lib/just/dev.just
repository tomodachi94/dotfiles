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
  jj new
  echo "flake.lock: update

  $(nix flake update)" | jj describe --stdin
  if jj log -r 'empty() & @' -T 'commit_id' | grep -q .; then
    jj abandon
  else
    just sync-pkgs-subflake
    jj new
  fi

format *args:
  treefmt --config-file ./lib/tooling-config/treefmt.toml --tree-root {{git_dir}} {{args}}

generate-hardware-config host:
  mkdir nixos/hosts/{{host}}
  cp lib/templates/new-host.nix nixos/hosts/{{host}}/default.nix
  nixos-generate-config --show-hardware-config > nixos/hosts/{{host}}/hardware-configuration.nix

disko-install disk:
  sudo disko-install \
    --flake '.#' \
    --write-efi-boot-entries \
    --disk main {{disk}}
