echo "Setting up PATH..."

PATH="~/bin:~/.local/bin:$PATH"

if (( $+commands[sdk] )) then
	export SDKMAN_DIR="~/.sdkman"
	source ~/.sdkman/bin/sdkman-init.sh
fi

if (( $+commands[rvm] )) then
	export PATH="~/.rvm/bin:$PATH"
fi

if (( $+commands[brew] )) then
	brew shellenv | eval
	PATH="~/.nodebrew/current/bin:$PATH"
fi

if (( $+commands[cargo] )) then
	PATH="~/.cargo/bin:$PATH"
fi

