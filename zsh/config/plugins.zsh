#!/usr/bin/env zsh
source ~/.zplug/init.zsh

if [[ -f ~/.zsh/platform/init.zsh ]]; then
zplug "~/.zsh/platform/init.zsh", from:"local", use:init.zsh # Platform-specific things go into ./platform
fi

# Completions
# Only load these if the executable is present
# zplug "casey/just", use:"completions/just.zsh", if:"which just"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install plugins with zplug? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose
