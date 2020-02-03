"" General-purpose auto-commands

if has("autocmd")
  " Source the vimrc file after saving it
  autocmd BufWritePost .vimrc source $MYVIMRC
endif
