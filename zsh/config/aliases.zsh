if [[ $(file /etc/apt) = "/etc/apt: directory" ]] then
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

# smart editor aliases

if (( $+commands[nvim] )) then
	alias vi="nvim"
	alias vim="nvim"
fi

