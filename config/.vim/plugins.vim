
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
Plug 'ervandew/supertab'    " Improved tab support

"" Appearance
Plug 'altercation/vim-colors-solarized' " Color-scheme
Plug 'chrisbra/Colorizer' " Highlight css colors
Plug 'luochen1990/rainbow' " Rainbow (for matching parens)
Plug 'Yggdroot/indentLine' " Indent line

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
Plug 'tpope/vim-projectionist' " Filesystem projections
Plug 'vim-scripts/YankRing.vim' " Use previous pastes with Ctrl-p and Ctrl-n

"" Command line stuff
Plug 'tpope/vim-eunuch' " Command line cmds to native vim
Plug 'tpope/vim-fugitive' " Git commands in native vim
Plug 'tpope/vim-rhubarb' " GitHub specialization for fugitive uses `hub`
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
Plug 'tpope/vim-afterimage' " Image editing support
Plug 'tpope/vim-endwise' " Improves ending structures (like ifs)
Plug 'tpope/vim-unimpaired' " Paired commands for things like next/previous

"" Snippets TODO: Examples
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Automation
Plug 'tpope/vim-dispatch'

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

"" Tmux
Plug 'tmux-plugins/vim-tmux' " Adds convenvience to manipulating .tmux.conf
Plug 'christoomey/vim-tmux-navigator' " Navigate between vim and tmux with <C-hjkl>
Plug 'tmux-plugins/vim-tmux-focus-events' " Fixes refocus events in terminal Vim

""" Language specific
"" Transpiling
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'

"" Python
Plug 'nvie/vim-flake8'
Plug 'vim-syntastic/syntastic'

"" Databases
Plug 'tpope/vim-dadbod' " Database interface with :DB

"" Latex
Plug 'vim-latex/vim-latex' " General latex plugin

" Set DevIcons to load after the things that use it
Plug 'ryanoasis/vim-devicons'

call plug#end()

