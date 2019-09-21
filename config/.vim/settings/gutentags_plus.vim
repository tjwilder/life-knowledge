"" GutenTags Plus

" enable gtags module
let g:gutentags_modules = ['ctags']

" config project root markers.
let g:gutentags_project_root = ['.root', '.git']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" Enable debuggings w/ :GutentagsToggleTrace
" and :GutentagsUpdate
" and :messages
" let g:gutentags_define_advanced_commands = 1
