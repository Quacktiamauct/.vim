" Modified from http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

Plug 'Konfekt/FastFold' " Faster folding
" New stuff

Plug 'arecarn/vim-clean-fold'
" set foldtext=clean_fold#fold_text('_')
set foldmethod=expr
set foldexpr=clean_fold#fold_expr(v:lnum)



" Indent Guides
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'
" let g:indent_blankline_char = '¦'
" let g:indent_blankline_indent_level = 4
" let g:indentLine_fileTypeExclude = ['help', 'startify', 'tex']
" let g:indent_blankline_filetype_exclude = ['help', 'startify', 'tex']
