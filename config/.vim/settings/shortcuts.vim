"" Vim general
" Leave insert mode with jk < 500ms apart
inoremap jk <ESC>
" Scroll viewport 3xfaster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Navigate across splits with ctrl-direction
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

" To jump to tag in a vertical split
nnoremap <silent> <leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
" Go-to File (under cursor) in a vertical split
nnoremap <silent> <leader>gf :vertical botright wincmd f<CR>

" Clear search highlights until next search. TODO: automate?
:noh
nnoremap <silent> <leader>/ :noh<ESC>

" :filter /slash-search-filter/ nmap
