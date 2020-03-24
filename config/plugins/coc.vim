" coc.nvim =================================================================={{{
" Installed extensions:
" coc-lists
" coc-snippets
" coc-highlight
" coc-yaml
" coc-python
" coc-json
" coc-html
" coc-css
" coc-vimlsp
" coc-tsserver
" coc-tslint-plugin
" coc-pairs
" coc-git
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" some key map conflicts with other plugins(e.g. vim-go), so skip specific
" type of files
" let s:exclude_files = ['go']
" function! s:nonGoFile()
"   for ft in s:exclude_files
"     if ft ==# &filetype | return 0 | endif
"   endfor
"   return 1
" endfunction
" autocmd BufRead,BufNew * if <SID>nonGoFile() |
"       \ nmap <silent> <C-LeftMouse> <LeftMouse><Plug>(coc-definition)| endif
" autocmd BufRead,BufNew * if <SID>nonGoFile() |
"       \ nmap <silent> g<LeftMouse> <LeftMouse><Plug>(coc-definition)| endif
" autocmd BufRead,BufNew * if <SID>nonGoFile() | nmap <silent> gd <Plug>(coc-definition)| endif

nmap <buffer> <silent> <C-s><C-]> :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <buffer> <silent> <C-s>] :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <buffer> <silent> <C-t><C-]> :<C-u>call CocAction('jumpDefinition', 'tabe')<CR>
nmap <buffer> <silent> <C-t>] :<C-u>call CocAction('jumpDefinition', 'tabe')<CR>
nmap <buffer> <silent> <C-w><C-]> :<C-u>call CocAction('jumpDefinition', 'split')<CR>
nmap <buffer> <silent> <C-w>] :<C-u>call CocAction('jumpDefinition', 'split')<CR>

nmap <silent> g<LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <silent> <C-LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <silent> <M-LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>jd :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
nmap <leader>f  <Plug>(coc-format)
xmap <leader>f  <Plug>(coc-format)

" Use C to open coc config
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <s-tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <S-TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader><space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader><space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader><space>p  :<C-u>CocListResume<CR>
" Yank list
nnoremap <silent> <leader><space>y  :<C-u>CocList -A --normal yank<cr>

" coc-snippets extension config
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc-vimlsp extension config
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" }}}