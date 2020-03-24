" Status line =============================================================0={{{
" Airline
"# Plug 'bling/vim-airline'
"# Plug 'vim-airline/vim-airline-themes'
"# if !exists('g:airline_symbols')
"#     let g:airline_symbols = {}
"# endif
"# let g:airline_theme='one'
"# let g:airline#extensions#ale#enabled = 1

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
set laststatus=2
set noshowmode

" Show readonly
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

" Show git branch
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

" Git blame message
function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" Get current funtion symbol
function! CocCurrentFunction()
  let currentFunctionSymbol = get(b:, 'coc_current_function', '')
  return currentFunctionSymbol !=# '' ? " " .currentFunctionSymbol : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch'],
      \             [ 'readonly', 'relativepath', 'modified' ],
      \             ['cocstatus', 'currentfunction' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ], ['blame'] ]
      \ },
      \ 'component_function': {
		  \   'readonly': 'LightlineReadonly',
		  \   'gitbranch': 'LightlineFugitive',
      \   'cocstatus': 'coc#status',
      \   'blame': 'LightlineGitBlame',
      \   'currentfunction': 'CocCurrentFunction',
      \ },
      \ }

" seperator
" let g:lightline.separator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '', 'right': '' }

" ALE linter info
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ }


" tabline
set showtabline=2  " Show tabline
let g:lightline.tabline = {
    \   'left': [ ['tabs'] ],
    \   'right': [ ['close'] ]
    \ }
let g:lightline.tab_component_function = {
      \   'shortpath': 'ShortPath',
      \}
let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'shortpath', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

function! ShortPath(n) abort
  " Partly copied from powerline code:
  " https://github.com/admc/dotfiles/blob/master/.vim/autoload/Powerline/Functions.vim#L25
  " Display a short path where the first directory is displayed with its
  " full name, and the subsequent directories are shortened to their
  " first letter, i.e. "/home/user/foo/foo/bar/baz.vim" becomes
  " "~/foo/f/b/baz.vim"

  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let filename = expand('#'.buflist[winnr - 1].':t')
  if filename ==# ''
    return '[未命名]'
  endif

  let exclude_files = ['gitcommit', 'defx']
  for ft in exclude_files
    if ft ==# &filetype
      return filename
    endif
  endfor

  " Check if buffer is a terminal
  if &buftype ==# 'terminal'
    return filename
  endif

  let dirsep = has('win32') && ! &shellslash ? '\' : '/'
	let filepath = expand('%:p')
  if empty(filepath)
    return filename
  endif
  " This displays the shortest possible path, relative to ~ or the
  " current directory.
  let mod = (exists('+acd') && &acd) ? ':~:h' : ':~:.:h'
  let fpath = split(fnamemodify(filepath, mod), dirsep)
  let fpath_shortparts = map(fpath[1:], 'v:val[0]')
  let short_path = join(extend([fpath[0]], fpath_shortparts), dirsep) . dirsep
  if short_path == ('.' . dirsep)
		let short_path = ''
	endif
  return short_path . filename
endfunction

" }}}