"|||||||||||||||||||||||||||||||||||||||||||||||||||||||
"Q: How to make grep easier?
"A: Create custom command like:
" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
" nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
" grep word under cursor
"
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||


"|||||||||||||||||||||||||||||||||||||||||||||||||||||||
"Q: How to grep by motion?
"A: Create custom keymappings like:
" vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
" nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||


"|||||||||||||||||||||||||||||||||||||||||||||||||||||||
"Q: How to grep current word in current buffer?
"A: Create kep-mapping like:
nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||
