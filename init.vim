let g:curdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &rtp.=','.g:curdir

" Set leader key
let mapleader = ','

set guicursor=a:ver25-blinkon0

let g:python3_host_prog = '/opt/homebrew/bin/python3'

" Load configs
for fpath in split(globpath(expand(g:curdir.'/config'), '*.vim'), '\n')
  exe 'source' fpath
endfor
