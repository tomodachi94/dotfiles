potentialPaths=(/usr/opt/homebrew ~/.homebrew ~/homebrew ~/.brew ~/brew)

for directory in ${potentialPaths[*]}
do
	if [[ -d $directory ]]
	then
		PATH="$directory/bin:$directory/sbin:$PATH"
	fi
done
