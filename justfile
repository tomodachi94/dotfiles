#!/usr/bin/env just --justfile

git_dir  := `git rev-parse --show-toplevel`

import 'lib/just/dev.just'
import 'lib/just/checks.just'
import 'lib/just/formatter-wrappers.just'
import 'lib/just/aliases.just'

build *args:
  nixos-rebuild switch \
    --flake ".#$(hostname)" \
    --use-remote-sudo \
    --option experminetal-features 'nix-command flakes' \
    {{args}}
