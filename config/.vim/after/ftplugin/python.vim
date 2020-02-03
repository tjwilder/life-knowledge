" Formatting for Python (.py) files

setlocal shiftwidth=2 " Number of spaces in an indentation
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab " Expand <tab> to use spaces

" Use regular make
setlocal makeprg=make
" setlocal makeprg=python3 " Could use python3 as well

" Setting up nice folds
setlocal foldmethod=expr
setlocal foldexpr=GetTabFold(v:lnum)

function! s:indentLevel(lnum)
  return indent(a:lnum) / &l:shiftwidth
endfunction

function! s:nextContentLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1

  while current <= numlines
    if getline(current) =~? '\v\S'
      return current
    endif

    let current += 1
  endwhile

  return -2
endfunction

" Only works for 1-line Python comments
function! s:isComment(lnum)
  return getline(a:lnum) =~? '\v^\s*#'
endfunction

" Fold tabs by including the previous line in the fold
function! GetTabFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif

  let this_indent = s:indentLevel(a:lnum)
  let this_comment = s:isComment(a:lnum)
  let next_content_line = s:nextContentLine(a:lnum)
  let next_indent = s:indentLevel(next_content_line)

  if this_comment && this_indent == next_indent
    let next_fold = GetTabFold(next_content_line)
    return next_fold
  endif

  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    if s:isComment(a:lnum - 1)
      return next_indent
    endif
    return '>' . next_indent
  endif
endfunction
