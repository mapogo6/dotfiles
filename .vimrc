set number
set relativenumber
set nowrap
syntax enable

set rtp+=/opt/homebrew/opt/fzf

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_vim = {}
let g:fzf_vim.preview_window = []

nnoremap <silent> <C-p> :GFiles<CR>

let g:netrw_dirhistmax=0

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

set wildignore+=*\\tmp\\*,*.swp,*.exe

" asyncomplete tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" vim-lsp
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-declaration)
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

if exists('$BASE16_THEME')
	\ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
	let base16colorspace=256
	colorscheme base16-$BASE16_THEME
else
	colorscheme base16-ocean
endif

" Enable status line
set laststatus=2
set noshowmode
