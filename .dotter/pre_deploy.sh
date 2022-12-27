#!/usr/bin/env zsh

git submodule update --init --recursive

{{#if dotter.packages.gem}}
cat ruby/gemrc.dhall | dhall-to-yaml-ng > ruby/gemrc.yaml
{{/if}}

{{#if dotter.packages.nvim}}
touch nvim/lua/conf/mediawiki-editor-creds.lua # nvim throws a warning if this file doesn't exist
{{/if}}


{{#if dotter.package.gnome-terminal}}
# TODO: Finish this
{{/if}}
