#!/usr/bin/env just --justfile

git_dir  := `git rev-parse --show-toplevel`

import 'lib/just/dev.just'
import 'lib/just/checks.just'
import 'lib/just/formatter-wrappers.just'
import 'lib/just/aliases.just'

build *args:
  sudo nixos-rebuild switch --flake ".#$(hostname)" {{args}}
