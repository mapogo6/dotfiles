set number
set relativenumber
set nowrap
syntax enable
filetype plugin indent on
" set background=dark
" colorscheme solarized

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*\\tmp\\*,*.swp,*.exe

let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/].(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$'
	\ }

let g:lsp_settings = {
	\ 'clangd': {'cmd': ['clangd']},
	\ 'efm-langserver': {'disabled': v:false}
	\ }

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"
