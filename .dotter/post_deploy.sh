#!/usr/bin/env zsh

{{#if dotter.packages.albert}}
echo "---- Restart Albert ----"
albert restart
{{/if}}

{{#if dotter.packages.nvim}}
echo "---- Sync nvim packages ----"
nvim --headless -c "Lazy! sync" -c 'qa!'
{{/if}}
