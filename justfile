#!/usr/bin/env just --justfile

set shell := ["bash", "-c"]
set export

python_bin := "/usr/bin/env python3"
pip_bin := python_bin + " -m pip"

default: setup-providers install-coc

setup-providers:
	echo "###### Install Python provider ######"
	$pip_bin install pynvim
	echo "###### Install Ruby provider ######"
	echo "If you don't have superuser privileges, press return three times upon being prompted for the password."
	-sudo gem install neovim
	echo "###### Install Node.js provider ######"
	npm install -g neovim
	echo "###### Install Perl provider ######"
	cpan -n "Ext::Neovim"

install-coc:
	#!/usr/bin/env bash
	set -o nounset    # error when referencing undefined variable
	set -o errexit    # exit when command fails

	# Install extensions
	mkdir -p ~/.config/coc/extensions
	cd ~/.config/coc/extensions
	if [ ! -f package.json ]
	then
		echo '{"dependencies":{}}' > package.json
	fi
	# Change extension names to the extensions you need
	npm install coc-jedi coc-lua coc-ultisnips --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
	# needed by coc-jedi
	$pip_bin install jedi
