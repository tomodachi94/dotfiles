#!/usr/bin/env zsh
source ~/.zplug/init.zsh

if [[ -f ~/.zsh/platform/init.zsh ]]; then
zplug "~/.zsh/platform/init.zsh", from:"local", use:init.zsh # Platform-specific things go into ./platform
fi

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "themes/robbyrussell", from:oh-my-zsh, as:theme

# Play nice with the nnn file manager
zplug "jarun/nnn", use:"misc/quitcd/quitcd.bash_zsh", if:"which nnn"

# Play nice with Nix/NixOS
zplug "chisui/zsh-nix-shell", if:"which nix-shell"

# Setup ripgrep config if present
zplug "~/.zsh/plugins/ripgrep", from:"local", use:"ripgrep.plugin.zsh", if:"which rg"

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
