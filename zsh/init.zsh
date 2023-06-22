#!/usr/bin/env zsh
echo "Loading zsh config..."

export ZSH_HOME=~/.zsh
export ZSH_CACHE=~/.cache/zsh/user

source $ZSH_HOME/path.zsh
source $ZSH_HOME/plugins.zsh
source $ZSH_HOME/aliases.zsh

fpath=( $ZSH_HOME/functions "${fpath[@]}" )

clear
