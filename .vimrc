set number
set relativenumber
set nowrap
syntax enable
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
	\ 'clangd': {'cmd': ['clangd11']},
	\ 'efm-langserver': {'disabled': v:false}
	\ }
