let s:curdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &rtp.=','.s:curdir

" Set leader key
let mapleader = ','

" Load configs
for fpath in split(globpath(expand(s:curdir.'/config'), '*.vim'), '\n')
  exe 'source' fpath
endfor

" Options setup ============================================================={{{

colorscheme onedark
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

" }}}

" Defx setup ================================================================{{{

Plug 'kristijanhusak/defx-git'
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

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
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" }}}

" coc.nvim setup ============================================================{{{

" color for cursor holding highlight
hi default CocHighlightText guibg=#8a8a8a guifg=#211F1C
hi default CocHighlightText ctermbg=#8a8a8a ctermfg=#211F1C

" color for coc-diagnostic
hi link CocErrorSign Error
hi link CocWarningSign ALEWarningSign

" }}}

" lightline setup ==========================================================={{{

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
