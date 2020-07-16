let g:curdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &rtp.=','.g:curdir

" Set leader key
let mapleader = ','

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Load configs
for fpath in split(globpath(expand(g:curdir.'/config'), '*.vim'), '\n')
  exe 'source' fpath
endfor
