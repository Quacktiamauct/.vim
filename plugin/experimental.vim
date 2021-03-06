" Experimental.vim
" ----------------
" Plugins that are new and exciting but not a staple yet
"
Plug 'zdcthomas/medit'
Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
" let g:animate#distribute_space = 0
" let g:lens#disabled = 1
" let g:animate#easing_func = 'animate#ease_out_quad'
" let g:animate#duration = 500.0
" let g:lens#animate = 0

Plug 'wfxr/minimap.vim'

Plug 'Konfekt/vim-sentence-chopper'
let g:latexindent = 0

let g:lens#disabled_filetypes = ['nerdtree',
            \ '',
            \ 'fzf',
            \ 'coc-explorer',
            \ 'coc-finder',
            \ 'vista',
            \ 'GV',
            \ 'voomtree',
            \ 'vista_kind',
            \ 'peekaboo',
            \ 'markbar' ]

Plug 'lambdalisue/suda.vim'

Plug 'markonm/traces.vim'
" not only the / but :s and :g too

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

Plug 'wellle/context.vim'
let g:context_enabled = 0
let g:context_highlight_normal = 'Opaque'




Plug 'j5shi/CommandlineComplete.vim'
" Plug 'danilamihailov/beacon.nvim'
" let g:beacon_timeout = 200
" let g:beacon_size = 80
Plug 'norcalli/nvim-colorizer.lua'

Plug 'szymonmaszke/vimpyter' "vim-plug



if has("nvim-0.5")
    Plug 'dstein64/nvim-scrollview'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    hi link TSError Normal
    Plug 'romgrk/nvim-treesitter-context'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'voldikss/vim-skylight'
    nnoremap <silent>       gp    :Skylight file<CR>
    vnoremap <silent>       gp    :Skylight file<CR>
    nnoremap <silent>       go    :Skylight! file<CR>
    vnoremap <silent>       go    :Skylight! file<CR>
endif
