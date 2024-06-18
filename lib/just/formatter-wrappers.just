#!/usr/bin/env just --justfile

_format-wrapper-statix *files:
  #!/usr/bin/env sh
  set -euxo pipefail
  for file in {{files}}; do
    statix fix --config lib/tooling-config/statix.toml "$file"
  done

