" File type specific configs

" Vim ======================================================================={{{
autocmd FileType vim set tabstop=2 shiftwidth=2 expandtab ai
" }}}

" Python ===================================================================={{{
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
" set colorcolumn
function! ColorColumn()
    if(&colorcolumn == 80)
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunc
autocmd FileType python nnoremap <leader>b :call ColorColumn()<cr>
" }}}

" JS ===================================================================={{{
autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab ai
autocmd FileType typescript set tabstop=2 shiftwidth=2 expandtab ai
" }}}

" Ruby ======================================================================{{{
if v:version >= 703
  " Note: Relative number is quite slow with Ruby, so is cursorline
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 ai expandtab nocursorline nocursorcolumn
else
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 ai expandtab
endif
" }}}

" Golang ===================================================================={{{
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" }}}

" Text ======================================================================{{{
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
autocmd FileType yaml set sw=2 sts=2 et
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType puppet set sw=2 sts=2 et
" }}}

" vim: set fdl=0 fdm=marker:
