let g:curdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &rtp.=','.g:curdir

" Set leader key
let mapleader = ','

" Load configs
for fpath in split(globpath(expand(g:curdir.'/config'), '*.vim'), '\n')
  exe 'source' fpath
endfor