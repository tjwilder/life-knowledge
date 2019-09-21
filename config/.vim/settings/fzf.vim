"" fzf options

" Default fzf layout
" What does the fzf window look like?
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_command_prefix = 'Fzf'

" Use ag file search as the default command, it ignores .gitignore and .ignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"" Shortcuts
" ,ff to open up fuzzy file search
nnoremap <Leader>ff :FzfFiles<CR>
" ,fg to open up fuzzy git file search, searching only files in git
nnoremap <Leader>fg :FzfGitFiles<CR>
" ,fb to open up fuzzy buffer search
nnoremap <Leader>fb :FzfBuffers<CR>
" ,fa to open up fuzzy text search
nnoremap <Leader>fa :FzfAg<CR>


" alt-j, alt-k to scroll through results

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Commands:
" All should be prefixed by fzf_command_prefix
" :Files (to search by file name)
" :Buffers (to search by open buffers)
" :Ag (to search all files in the directory)
" :Maps (to search keymaps)
" :Commands (to search commands)
" :Snippets (to search UltiSnips snippets)
" :[B]Tags (to search tags in project/[buffer])
" :[B]Commits (to search commits with fugitive.vim)
" :Marks (to search marks)
" Others on GitHub
