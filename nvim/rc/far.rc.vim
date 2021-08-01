" far.vim
let g:far#enable_undo=2
set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters
nnoremap <C-g> :Far  **/*<Left><Left><Left><Left><Left>
nnoremap <C-f> :F  **/*<Left><Left><Left><Left><Left>
