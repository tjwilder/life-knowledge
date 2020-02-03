"" Filesystem projections for nesting folders or matching files (like code/test)

" Do everything we can to force an absolute path
let s:all_dots = "../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../"

"" Global projections for vim settings (:Evim, :Eplug, :Evims, and learning file with :Elearn)
let g:projectionist_heuristics = {
  \   "*": {
  \     $HOME . "/.vimrc": {
  \       "type": "vim",
  \       "path": [s:all_dots]
  \     },
  \     $HOME . "/.vim/plugins.vim": {
  \       "type": "plug",
  \       "path": [s:all_dots]
  \     },
  \     $HOME . "/.vim/settings/*.vim": {
  \       "type": "vims",
  \       "template": ["\" Settings for *"],
  \       "path": [s:all_dots]
  \     },
  \     $HOME . "/.vim/after/ftplugin/*.vim": {
  \       "type": "ft",
  \       "template": ["\" Filetype settings for *"],
  \       "path": [s:all_dots]
  \     },
  \     $HOME . "/.vim/settings/learning.md": {
  \       "type": "learn",
  \       "path": [s:all_dots]
  \     },
  \     $HOME . "/.vim/plugged/vim-snippets/UltiSnips/*.snippets": {
  \       "type": "snip",
  \       "path": [s:all_dots]
  \     }
  \   }
  \ }
