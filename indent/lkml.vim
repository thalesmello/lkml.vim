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
  let indent_to = indent(prevnonblank(v:lnum - 1))

  let current_line = getline(v:lnum)
  let previous_line = getline(prevnonblank(v:lnum - 1))

  " If previous line ends with an open bracket, increase indent
  if previous_line =~# '^.*{$'
    let indent_to = indent_to + &shiftwidth
  endif

  " If current line ends with a close bracket, decrease indent
  if current_line =~# '^.*}$'
    let current_pos = getpos('.')
    let bracket_col = matchstr(current_line, "}$") + 1
    let bracket_pos = getpos('.')
    bracket_pos[1] = v:lnum
    bracket_pos[2] = bracket_col
    setpos(bracket_pos)
    let s_flags = 'nbW'
    let s_skip ='synIDattr(synID(line("."), col("."), 0), "name") ' .
      \ '=~? "lkmlSqlBody\\|string"'
    let [m_lnum, m_col] = searchpairpos('{', '', '}', s_flags, s_skip)
    setpos(current_pos)

    let indent_to = indent(m_lnum)
  endif

  return indent_to
endfunction

function! s:get_highlight_stack(line)
  return map(synstack(a:line, 1), 'synIDattr(v:val, "name")')
endfunction
