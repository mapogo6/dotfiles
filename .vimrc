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

" asynccompmlete tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" vim-lsp
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gD <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	"noremap <buffer> <expr><c-f> lsp#scroll(+4)
	"noremap <buffer> <expr><c-d> lsp#scroll(-4)

	"let g:lsp_format_sync_timeout = 1000
	"autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

	" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

function s:setupPath()
	if has('mac')
		let l:sdkPath = systemlist("xcrun --sdk macosx --show-sdk-path")[0]
		let &path = &path . ',' . l:sdkPath . '/usr/include'
	endif
endfunction

call s:setupPath()

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

set tags+=~/.ctags/systemtags,~/.ctags/homebrewtags

" Enable status line
set laststatus=2
set noshowmode
