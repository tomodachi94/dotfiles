#!/usr/bin/env zsh
echo "Setting up PATH..."

PATH="$HOME/bin:$HOME/.local/bin:$PATH"

if (( $+commands[sdk] )) then
	export SDKMAN_DIR="$HOME/.sdkman"
	source $HOME/.sdkman/bin/sdkman-init.sh
fi

if (( $+commands[rvm] )) then
	export PATH="$HOME/.rvm/bin:$PATH"
fi

if (( $+commands[brew] )) then
	brew shellenv | eval
	PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

if (( $+commands[cargo] )) then
	PATH="$HOME/.cargo/bin:$PATH"
fi

