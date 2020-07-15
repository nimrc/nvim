" Load plugins configs
call plug#begin('~/.config/nvim/bundle')

for fpath in split(globpath(expand(g:curdir.'/config/plugins'), '*.vim'), '\n')
  exe 'source' fpath
endfor

call plug#end()

" vim: set fdl=0 fdm=marker:


" Options setup ============================================================={{{
" colorscheme onedark
"
"colorscheme spacegray
colorscheme atom-dark
"
set mouse=a
set nocompatible
set hidden
set encoding=UTF-8
set termguicolors
" Highlight curcur
set cursorcolumn
set cursorline
" Max pattern match memory
set maxmempattern=5000
set lazyredraw
set autoread
set hlsearch
set showmode
" Code fold
set foldmethod=indent
set foldlevel=99
" Default tab width = 4 space
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
" backspace
set backspace=indent,eol,start " backspace over everything in insert mode
" time in milliseconds to wait for a mapped sequence to complete
set timeoutlen=700
set number
" }}}

" Defx setup ================================================================{{{
Plug 'kristijanhusak/defx-icons'
" disbale syntax highlighting to prevent performence issue
let g:defx_icons_enable_syntax_highlight = 1

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('filename', {
      \ 'min_width': 40,
      \ 'max_width': 40,
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })
call defx#custom#option('_', {
      \ 'winwidth': 35,
      \ 'columns': 'git:mark:indent:icons:filename:type',
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '目录',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" }}}

"" lightline setup ==========================================================={{{

" wombat tabline colorscheme customization
let s:palette = g:lightline#colorscheme#wombat#palette
let s:palette.tabline.tabsel = [ [ '#242424', '#8ac6f2', 235, 117, 'bold' ] ]
unlet s:palette

" }}}

"
" vim: set fdl=0 fdm=marker:
if $TERM_PROGRAM =~ "iTerm"
  " reset cursor when vim exits
  au VimLeave * set guicursor=a:ver25-blinkon0
endif

nnoremap <C-t> :terminal<CR>

function! TerminalQuit()
    let bid = get(t:, '__terminal_bid__', -1)
    if bid < 0
        return
    endif
    let name = bufname(bid)
    if name == ''
        return
    endif
    exec "bw! ". name
endfunc

au TermClose * call TerminalQuit()
