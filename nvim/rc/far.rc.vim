" far.vim
let g:far#enable_undo=2
set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

" shortcut for far.vim find
nnoremap <silent> <C-f>  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <C-g>  :Farr<cr>

