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

if (( $+commands[cargo] )) then
	PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -z $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]] then
	source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi
