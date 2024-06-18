#!/usr/bin/env just --justfile

_format-wrapper-statix *files:
    #!/usr/bin/env sh
    set -euxo pipefail
    for file in {{ files }}; do
        statix fix --config lib/tooling-config/statix.toml "$file"
    done

_format-wrapper-just *files:
    #!/usr/bin/env sh
    set -euxo pipefail
    for file in {{ files }}; do
        if ! just --unstable --fmt --check --justfile "$file"; then
            just --unstable --fmt --justfile "$file"
        fi
    done
