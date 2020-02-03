"" YouCompleteMe configuration

" Don't open preview window (the window seems to bug out)
set completeopt-=preview

" If the preview window does get opened, close it once we finish inserting
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion  = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Disable other syntax checkers in Java
let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0
