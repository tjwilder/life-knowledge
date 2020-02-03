setlocal shiftwidth=4
setlocal softtabstop=4

let g:syntastic_java_javac_args = ""

function! s:setLocalFilepath() abort
    let l:curDir = system('pwd')
    let g:syntastic_java_javac_classpath = curDir . ":" . curDir . "/deps"
endfunction

call s:setLocalFilepath()
