function! LightlineMode()
    return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
                \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
                \ &filetype ==# 'unite' ? 'Unite' :
                \ &filetype ==# 'vimfiler' ? 'VimFiler' :
                \ &filetype ==# 'vimshell' ? 'VimShell' :
                \ &filetype ==# 'voomtree' ? 'VOOM' :
                \ &filetype ==# 'vista_kind' ? 'Vista' :
                \ lightline#mode()
endfunction


function! LightlineModified()
    return &ft =~ 'help' ? '' : &modified ? '' : &modifiable ? '' : ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction


function! LightlineFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ &ft == 'vimshell' ? vimshell#get_status_string() :
                \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

let g:lightline = {
            \ 'colorscheme': 'molokai',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'method' ] ]
            \ },
            \ 
            \ 'component_function': {
            \   'mode': 'LightlineMode',
            \   'readonly': 'LightlineReadonly',
            \   'filename': 'LightlineFilename',
            \   'gitbranch': 'LightlineFugitive',
            \   'fileformat': 'LightlineFileformat',
            \   'filetype': 'LightlineFiletype',
            \   'method': 'NearestMethodOrFunction',
            \ },
            \ 'component': {
            \   'lineinfo': ' %3l:%-2v',
            \   'buffers': 'tabsel',
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel'
            \ },
            \ 'component_expand': {
            \   'buffers': 'lightline#bufferline#buffers'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'tabline': {'left': [['buffers']], 'right': [['close']]}
            \ }

" Tabline
" let g:lightline#bufferline#read_only = ''
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#unnamed = ' '
let g:lightline#bufferline#min_buffer_count = 2

let g:lightline#bufferline#number_map = {
    \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
    \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'
    \ }
let g:lightline#bufferline#show_number = 2
nmap <space>1 <Plug>lightline#bufferline#go(1)
nmap <space>2 <Plug>lightline#bufferline#go(2)
nmap <space>3 <Plug>lightline#bufferline#go(3)
nmap <space>4 <Plug>lightline#bufferline#go(4)
nmap <space>5 <Plug>lightline#bufferline#go(5)
nmap <space>6 <Plug>lightline#bufferline#go(6)
nmap <space>7 <Plug>lightline#bufferline#go(7)
nmap <space>8 <Plug>lightline#bufferline#go(8)
nmap <space>9 <Plug>lightline#bufferline#go(9)
nmap <space>0 <Plug>lightline#bufferline#go(10)