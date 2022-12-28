#!/usr/bin/env zsh

git submodule update --init --recursive --depth 1

{{#if dotter.package.gnome-terminal}}
cat {{dotter.current_dir}}/gnome-terminal/gnome-terminal.dconf | dconf load /org/gnome/terminal
{{/if}}
