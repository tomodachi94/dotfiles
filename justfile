#!/usr/bin/env just --justfile

darwin-aarch64:
  home-manager switch --flake .#darwin-aarch64

linux-x86_64:
  home-manager switch --flake .#nixos-x86_64 -b backup

format:
  stylua $(git ls-files '*.lua')
  deadnix -eq $(git ls-files '*.nix')
