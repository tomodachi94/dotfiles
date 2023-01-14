#!/usr/bin/env zsh
if [[ -d "/etc/apt" ]] then
	alias aptin="sudo aptitude install"
	alias aptrm="sudo aptitude uninstall"
else
	alias aptin="echo 'This is not a Debian machine, silly.'"
	alias aptrm="echo 'This is not a Debian machine, silly.'"
fi

# Use exa if it's available, otherwise use ls with color
if (( $+commands[exa] )) then
	alias ls="exa"
	alias tree="exa --tree --level 2"
else
	alias ls="ls --color"
fi

alias sl=ls # get rid of the train (see sl.6)

# Source: https://github.com/Nekohime/dotfiles/blob/main/.aliases
# This works with ls.1 or exa.1, so we apply it always
alias lsdot='ls -ad .?* 2>/dev/null'

# Move up and down a little quicker
alias ..="cd .."
alias ..."=cd ../.."
alias ....="cd ../../.."
alias .....="cd../../../.."
alias --="cd -"

# smart editor aliases

if (( $+commands[nvim] )) then
	alias vi="nvim"
	alias vim="nvim"
fi

if (( $+commands[craftos] )) then
	alias craftos-project="craftos --computers-dir ./.craftos-project/"
fi
