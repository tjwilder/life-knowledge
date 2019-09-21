" If you need to load anything before .vimrc, use this
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" Load plugins
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif


" Main configuration
set encoding=UTF-8
set t_Co=256                   " Terminal colors
syntax enable
set backspace=indent,eol,start " Allow backspace in insert mode
set history=1000               " Store lots of :cmdline history
set showcmd                    " Show incomplete cmds down the bottom
set showmode                   " Show current mode down the bottom
set gcr=a:blinkon0             " Disable cursor blink
set visualbell                 " No sounds
set autoread                   " Reload files changed outside vim
set mouse=a                    " Enable mouse control
set hidden                     " Allows background buffers to stay alive
let mapleader=","              " Remap default command leader from \ to ,
set relativenumber

" Smart case searching
set title                      " Name for the terminal
set shortmess=atI              " Shorten/remove some annoying prompts

" Search
set hlsearch                   " Highlight search terms...
set incsearch                  " ...dynamically as they are typed.
set ignorecase                 " Ingore case when searching...
set smartcase                  " unless we use a capital letter

" Tags
" set tags=./tags,tags;$HOME

colorscheme solarized " Colorscheme with solarized plugin
set background=dark " solarized also supports light

" Tabs as tabs
set tabstop=2 " Length of a tab (in spaces)
set shiftwidth=2 " Number of spaces in an indentation
set expandtab " Expand tabs to spaces
set autoindent " Automatically use indentation
set smartindent " Smart indents
set softtabstop=2

" Folds
set foldmethod=indent " By default, fold on indents
set nofoldenable      " Folds are created but not folded on file open
set foldlevel=2       " Max auto-fold level

" Scrolling
set scrolloff=5       " Start scrolling when we're 5 lines away from margins
set sidescrolloff=15  " Give us more space when side scrolling
set sidescroll=1      " Used if wrapping is disabled

" Enable plguns & indent files based on file type
filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

"" Persistent undo history across sessions
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

""" All shortcut reconfigurations and examples
" Start interactive EasyAlign in visual mode (e.g. vip,a)
xmap <Leader>a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. ,aip)
nmap <Leader>a <Plug>(EasyAlign)

"" Snippets
let g:UltiSnipsExpandTrigger       = "<C-CR>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

"" Comments
" This actually works on <C-/>
nnoremap <C-_> :Commentary<CR>
" In insert mode, activate the command in normal mode
inoremap <C-_> <C-o>:Commentary<CR>
" gv redoes the last visual block
vnoremap <C-_> :Commentary<CR>gv

"" Tagbar
nmap <F8> :TagbarToggle<CR>


""" Plugin options
"" YouCompleteMe options
let g:ycm_confirm_extra_conf = 0

"" Colorizer
" What file types should we color in css colors for
let g:colorizer_auto_filetype = 'css,html,js,md'

"" Rainbow
" Auto open on start
let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

"" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 1
augroup IndentGuides
	autocmd!
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=102
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=24
augroup END

"" Markdown preview
let vim_markdown_preview_github=1

" Resourcing fixes
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Load extra custom configuration from the ~/.vim/settings directory
if filereadable(expand("~/.vim/settings.vim"))
  source ~/.vim/settings.vim
endif
