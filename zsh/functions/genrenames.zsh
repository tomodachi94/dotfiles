#!/usr/bin/env zsh

function genrenames {
	ls $1 | grep '.png' | output=`grep '_'` && echo $output | sed 's/.png/\=/g' > $1/renames.txt; [ -f $1/renames.txt ] && $EDITOR $1/renames.txt 
}
