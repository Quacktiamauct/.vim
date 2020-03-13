setlocal foldmethod=expr
setlocal foldexpr=vimtex#fold#level(v:lnum)
setlocal foldtext=vimtex#fold#text()
setlocal wrap
" nnoremap <buffer> <leader>v :VoomToggle<cr>
" nnoremap <silent><M-tab> :Vista focus<cr>
nnoremap <silent><buffer> <leader>v :VimtexTocToggle<cr>
nnoremap <silent><buffer> <M-tab> :VimtexTocOpen<cr>

nnoremap <buffer> <localleader>wc :VimtexCountWords<cr>
xnoremap <buffer> <localleader>wc :VimtexCountWords<cr>

nnoremap <buffer> K <Plug>(vimtex-doc-package)
nnoremap <buffer> <F7> <Plug>(vimtex-cmd-create)
