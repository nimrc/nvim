" Golang ===================================================================={{{
Plug 'fatih/vim-go', { 'for': 'go' }
" enrich highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" let g:go_def_reuse_buffer = 1
" let g:go_def_mode = 'gopls'

" let g:go_info_mode = 'gopls'
let g:go_fmt_command = 'goimports'
let g:go_metalinter_command = 'golangci-lint'
let g:syntastic_go_checkers = ['golint', 'govet', 'golangci-lint']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_auto_sameids = 0           " auto highlight same vars
let g:go_def_mapping_enabled = 0    " toggle the default go def mappings

" Turn on auto typeinfo and K mapping if floating window is not supported
" FIXME: remove this block after neovim stable version 4.0 comes
if !exists('*nvim_open_win')
  let g:go_auto_type_info = 1         " auto show the type info of cusor
  let g:go_doc_keywordprg_enabled = 1 " map K to :GoDoc, use coc-action-doHover instead
else
  let g:go_auto_type_info = 0         " auto show the type info of cusor
  let g:go_doc_keywordprg_enabled = 0 " map K to :GoDoc, use coc-action-doHover instead
endif

autocmd FileType go noremap <buffer> <silent> <leader>ga :GoAlternate<cr>
autocmd FileType go noremap <buffer> <silent> <leader>gi :GoInfo<cr>
autocmd FileType go noremap <buffer> <silent> <leader>bt :GoDecls<cr>
autocmd FileType go noremap <buffer> <silent> <leader>gt :GoDeclsDir<cr>
autocmd FileType go noremap <buffer> <silent> <leader>gb :GoBuild<cr>
autocmd FileType go noremap <buffer> <silent> <leader>r :GoRun<cr>
autocmd FileType go noremap <buffer> <silent> <leader>d :GoDef<cr>

autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" }}}