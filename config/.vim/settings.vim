" This will automatically load all the separate settings files

let vimsettings = '~/.vim/settings' " Folder for vim settings
let uname = system("uname -s")

" Load keymaps based on mac vs linux
for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  " if (fpath == expand(vimsettings) . "/keymap-mac.vim") && uname[:4] ==? "linux"
  "   continue " skip mac mappings for linux
  " endif

  " if (fpath == expand(vimsettings) . "/keymap-linux.vim") && uname[:4] !=? "linux"
  "   continue " skip linux mappings for mac
  " endif

  exe 'source' fpath
endfor
