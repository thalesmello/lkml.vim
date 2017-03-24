if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

let b:undo_indent = ''

setlocal indentexpr=LkmlIndent()

function! LkmlIndent()
  " Indent is zero if first line
  if v:lnum == 1
    return 0
  endif

  " If inside SQL statement, don't change indentation
  if index(s:get_highlight_stack(v:lnum), 'lkmlSqlBody') >= 0
    return indent(v:lnum)
  endif

  " Default previous line indent of previous line
  echom string(prevnonblank(v:lnum - 1))
  let indent_to = indent(prevnonblank(v:lnum - 1))

  let current_line = getline(v:lnum)
  let previous_line = getline(prevnonblank(v:lnum - 1))

  " If previous line ends with an open bracket, increase indent
  if previous_line =~# '^.*{$'
    let indent_to = indent_to + &shiftwidth
  endif

  " If current line ends with a close bracket, decrease indent
  if current_line =~# '^.*}$'
    let indent_to = indent_to - &shiftwidth
  endif



  let previous_line = getline(prevnonblank(v:lnum - 1))
  let currentLine = getline(v:lnum)

  " Don't indent after an annotation
  if previous_line =~# '^\s*@.*$'
    let indent_to = indent(v:lnum - 1)
  endif

  " Indent after opening List literal
  if previous_line =~# '\[$' && !(currentLine =~# '^\s*\]')
    let indent_to = indent(v:lnum - 1) + &shiftwidth
  endif

  return indent_to
endfunction

function! s:get_highlight_stack(line)
  return map(synstack(a:line, 1), 'synIDattr(v:val, "name")')
endfunction
