" far.vim
let g:far#enable_undo=2
" farの検索をrgに変換
let g:far#source="rgnvim"
set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters
nnoremap <F1> :Far  **/*<Left><Left><Left><Left><Left>
nnoremap <F2> :F  **/*<Left><Left><Left><Left><Left>
let g:far#window_layout="right"
