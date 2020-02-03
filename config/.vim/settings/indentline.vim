"" Config for indentline plugin

" Vim
let g:indentLine_color_term = 239

" GVim
" let g:indentLine_color_gui = '#A4E57E'

" none X terminal
" let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 2 " (default: 2)

" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'
"
" Indent Char (Vim, GVim)
let g:indentLine_char = '┊'
    " let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Whenever we source this file, reset the indentLines to use shiftwidth
autocmd VimEnter * IndentLinesReset
