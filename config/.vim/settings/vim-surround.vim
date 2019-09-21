"" Surround
"" Custom shortcuts per file type
" Find ASCII with `:echo char2nr("x")
augroup CustomSurround
    autocmd!
    " In PHP, surround `-` surrounds with the below
    autocmd FileType php let b:surround_45 = "<?php \r ?>"
    " In html or js, use `d` as a div with optional id field
    autocmd FileType html,js let b:surround_100 = "<div\1id: \r..*\r id=\"&\"\1>\r</div>"
augroup END

"" Shortcuts
" Surround <motion> with character
nmap <Leader>s <Plug>Ysurround
nmap S <Plug>Ysurround

" Examples (* is cursor)
" cs}{  "{hel*lo}" -> "{ hello }"
" ds(   "(Hel*lo)" -> "Hello"
" ,siw<q> "Hel*lo world" -> "<q>Hello</q> world" (iw is inner word)
