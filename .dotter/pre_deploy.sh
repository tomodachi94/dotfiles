#!/usr/bin/env zsh

git submodule update --init --recursive

{{#if dotter.packages.nvim}}
touch {{dotter.current_dir}}/nvim/lua/conf/mediawiki-editor-creds.lua # nvim throws a warning if this file doesn't exist
{{/if}}


{{#if dotter.package.gnome-terminal}}
cat {{dotter.current_dir}}/gnome-terminal/gnome-terminal.dconf | dconf load /org/gnome/terminal
{{/if}}
