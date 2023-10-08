set number
set relativenumber
set nowrap
syntax enable

let g:netrw_dirhistmax=0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*\\tmp\\*,*.swp,*.exe

let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/].(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$'
\ }
let g:ctrlp_open_new_file = 'r'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

function SetupPath()
	if has('mac')
		let l:sdkPath = systemlist("xcrun --sdk macosx --show-sdk-path")[0]
		let &path = &path . ',' . l:sdkPath . '/usr/include'
	endif
endfunction

call SetupPath()

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

set tags+=~/.ctags/systemtags,~/.ctags/homebrewtags

" Enable status line
set laststatus=2
set noshowmode
