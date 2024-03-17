#!/usr/bin/env just --justfile

home:
  #!/usr/bin/env sh
  OS_NAME="$(uname -s | tr '[:upper:]' '[:lower:]')"
  OS_ARCH="$(uname -m)"
  home-manager switch --flake ".#$OS_NAME-$OS_ARCH"

system:
  sudo nixos-rebuild switch --flake ".#$(hostname)"

format:
  stylua $(git ls-files '*.lua')
  deadnix -eq $(git ls-files '*.nix')
