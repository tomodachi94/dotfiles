source ~/.zplug/init.zsh

zplug "plugins/command-not-found", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "themes/robbyrussell", from:oh-my-zsh, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install plugins with zplug? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose
