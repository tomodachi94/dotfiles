#!/usr/bin/env just --justfile

set shell := ["bash", "-c"]
set export

python_bin := "/usr/bin/env python3"
pip_bin := python_bin + " -m pip"

default: install

install:
	nix-shell --run "dotter deploy"

# TODO: Migrate this to Nix
nvim-setup-providers: install
	echo "###### Install Python provider ######"
	$pip_bin install pynvim
	echo "###### Install Ruby provider ######"
	echo "If you don't have superuser privileges, press return three times upon being prompted for the password."
	-sudo gem install neovim
	echo "###### Install Node.js provider ######"
	npm install -g neovim
	echo "###### Install Perl provider ######"
	cpan -n "Ext::Neovim"
