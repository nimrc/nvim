Plug 'rust-lang/rust.vim'

let g:rustfmt_autosave = 1

autocmd FileType rust noremap <buffer> <silent> <leader>r :RustRun<cr>