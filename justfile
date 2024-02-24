#!/usr/bin/env just --justfile

darwin-aarch64:
  home-manager switch --flake .#darwin-aarch64

linux-x86_64:
  home-manager switch --flake .#darwin-aarch64

format:
  stylua ./common/nvim/lua ./common/nvim/init.lua
  deadnix -eq ./common ./nixos ./darwin ./flake.nix
