" vim-arilines
let g:airline_theme = 'violet'               " テーマの指定
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示
"let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1            " Powerline Fontsを利用
let g:airline#extensions#tabline#tab_nr_type = 1
" タブに表示する名前（fnamemodifyの第二引数）
let g:airline#extensions#tabline#fnamemod = ':t'
