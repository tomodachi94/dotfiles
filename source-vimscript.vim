for file in split(glob("~/.config/nvim/vimscript/*.vim"), "\n")
  execute "source" file
endfor