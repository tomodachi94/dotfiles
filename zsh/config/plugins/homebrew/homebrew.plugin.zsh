# Title: Setup Homebrew environment
# Author: Tomodachi94
# URL: https://brew.sh

# Find Homebrew if it's installed
potentialPaths=(/usr/opt/homebrew ~/.homebrew ~/homebrew ~/.brew ~/brew ~/.linuxbrew)

for directory in ${potentialPaths[*]}
do
	if [[ -d $directory ]]
	then
		eval $($directory/bin/brew shellenv) # Let Homebrew manage its own $PATH and other variables
	fi
done

# Add nodebrew stuff to $PATH
if [[ -d $HOME/.nodebrew ]]
then
	PATH="$HOME/.nodebrew/current/bin:$PATH"
fi
