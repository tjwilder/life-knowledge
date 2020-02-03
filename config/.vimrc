set nocompatible

" Load plugins
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

syntax enable
filetype plugin on
filetype indent on

" Main configuration
set encoding=UTF-8
set t_Co=256                   " Terminal colors
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
set relativenumber   " Relative instead of absolute line numbers

" Conceal
set conceallevel=2 " Conceal everything specified
set concealcursor=""  " Stop concealing on the cursor

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
set foldmethod=syntax " By default, fold on syntax
set foldignore=false  " Include # comments in the folds
set nofoldenable      " Folds are created but not folded on file open
set foldlevel=2       " Max auto-fold level
" set foldlevelstart=3  " ??

" Scrolling
set scrolloff=5       " Start scrolling when we're 5 lines away from margins
set sidescrolloff=15  " Give us more space when side scrolling
set sidescroll=1      " Used if wrapping is disabled

let g:tex_flavor = "latex"
let g:tex_conceal = "abmg" " conceal for accents/bold/math/greek
let g:pandoc#syntax#conceal#use = 0

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

"" Persistent undo history across sessions
set noswapfile " Disable .swp
" Only works all the time.
if has('persistent_undo')" && isdirectory(expand('~').'/.vim/backups')
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

" Resourcing fixes
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Load extra custom configuration from the ~/.vim/settings directory
if filereadable(expand("~/.vim/settings.vim"))
  source ~/.vim/settings.vim
endif
