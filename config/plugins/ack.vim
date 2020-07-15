Plug 'mileszs/ack.vim'

map <S-f> :Ack<space>

map <c-e> :cclose <CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

