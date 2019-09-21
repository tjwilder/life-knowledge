"" NerdTree config

" We want slightly different settings in our NERDTree buffer, so we'll do that with autocommands
augroup NERDTree
	autocmd!
	" If vim is empty or open with a directory startup, open NerdTree
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

	" Disable line numbers on the NerdTree buffer
	autocmd BufWinEnter * if exists("b:NERDTreeType") | setlocal nonumber | endif
	" Force enable line numbers on non-NerdTree
	" autocmd BufWinEnter * if !exists("b:NERDTreeType") | setlocal number | endif

	" Disable markology Markings on the NerdTree buffer
	autocmd BufWinEnter * if exists("b:NERDTreeType") | exe 'MarkologyDisable' | endif
	" Force enable Markology on non-NerdTree
	" autocmd BufWinEnter * if !exists("b:NERDTreeType") | silent exe 'MarkologyEnable' | endif
augroup END
" Arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NerdTree addons " Necessary if the terminal doesn't do this for you
" set guifont=Font\ Awesome\ 5\ Free-Solid-900:h11


"" Shortcuts
map <Leader>o :NERDTreeToggle<CR>

