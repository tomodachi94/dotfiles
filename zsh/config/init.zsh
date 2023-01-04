#!/usr/bin/env zsh
echo "Loading zsh config..."

export ZSH_HOME=~/.zsh
export ZSH_CACHE=~/.cache/zsh/user

source $ZSH_HOME/path.zsh
source $ZSH_HOME/options.zsh
source $ZSH_HOME/plugins.zsh
source $ZSH_HOME/aliases.zsh

if [[ -z ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]] then
	source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
fi

export PATH=~/.nix-profile/bin:$PATH

clear
