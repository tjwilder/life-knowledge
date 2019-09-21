
" Plugged manages vim plugins for us
" If it's not installed, automatically install it, and install all plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List of all our plugins
" To add more, add it here and run :PlugInstall
call plug#begin('~/.vim/plugged')
"" Auto-complete
Plug 'Valloric/YouCompleteMe' " TODO: Audit this
Plug 'sheerun/vim-polyglot' " TODO: explain

"" Appearance
Plug 'altercation/vim-colors-solarized' " Color-scheme
Plug 'chrisbra/Colorizer' " Highlight css colors
Plug 'luochen1990/rainbow' " Rainbow (for matching parens)
Plug 'nathanaelkane/vim-indent-guides' " TODO: Get this good
" Airline bottom status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fuzzy file search
Plug 'henrik/vim-indexed-search' " Adds 'out of' to searches
Plug 'bronson/vim-visual-star-search' " In visual mode, search with *

"" Navigation
Plug 'reedes/vim-wheel' " Scroll wheel support
Plug 'easymotion/vim-easymotion' " Extra vim motions
Plug 'spiiph/vim-space' " Allows <Space> to repeat motions
Plug 'junegunn/vim-easy-align' " Align things
Plug 'tpope/vim-repeat' " Utitility to repeat plugin cmds
Plug 'vim-scripts/YankRing.vim' " TODO

"" Command line stuff
Plug 'tpope/vim-eunuch' " Command line cmds to native vim
Plug 'tpope/vim-fugitive' " Git commands in native vim
Plug 'tpope/vim-commentary' " Comment things
Plug 'tpope/vim-abolish' " Magic with names

"" Auto-stuff and gutters
Plug 'vim-scripts/restore_view.vim' " Automatically save and reload views
Plug 'scrooloose/nerdtree' " Tree file browser
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nerd syntax
Plug 'Xuyuanp/nerdtree-git-plugin' " Nerd git status for files
Plug 'airblade/vim-gitgutter' " Git gutter
Plug 'jeetsukumaran/vim-markology' " Marks in gutter
Plug 'Raimondi/delimitMate' " Insert-mode delimiters
Plug 'JamshedVesuna/vim-markdown-preview' " ctrl+p to preview markdown

" Snippets TODO: Examples
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Tags (ctags stuff)
Plug 'majutsushi/tagbar' " Tagbar
Plug 'vim-scripts/TagHighlight' " TagHighlight highlights ctags
Plug 'ludovicchabant/vim-gutentags' " Handles automatic file tagging
Plug 'skywind3000/gutentags_plus' " Cleans up some of the automatic tags by project

"" Text Objects
Plug 'kana/vim-textobj-user' " Prereq for other text objects
Plug 'tpope/vim-surround' " Change surroundings
Plug 'michaeljsmith/vim-indent-object' " Indent objects (ai, ii, aI)
Plug 'kana/vim-textobj-function' " Function (if, af)
Plug 'thinca/vim-textobj-function-javascript' " ^ adds support for JS
Plug 'vim-scripts/argtextobj.vim' " Function arg (ia, aa)
Plug 'coderifous/textobj-word-column.vim' " Columns (ic, ac, iC, aC)
Plug 'lucapette/vim-textobj-underscore' " Underscores (i_, a_)

"" Syntax & Indentation
Plug 'pangloss/vim-javascript' " Better JS indentation & syntax


" Set DevIcons to load after the things that use it
Plug 'ryanoasis/vim-devicons'

call plug#end()

