#!/usr/bin/env zsh
git remote show origin | grep https:// | sed 's/Fetch URL: //g' | sed 's/Push  URL: //g' | uniq | xargs -n 1 xdg-open 2> /dev/null # Open Git remote 'origin' in default web browser
