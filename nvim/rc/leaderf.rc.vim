" LeaderF
nnoremap <C-p> :Leaderf file<cr>
nnoremap sg :Leaderf rg
let g:Lf_WindowPosition = 'popup'
let g:Lf_CommandMap = {
\   '<C-k>': ['<C-p>'],
\   '<C-j>': ['<C-n>'],
\   '<C-T>': ['<CR>'],
\   '<C-]>': ['<C-v>'],
\}
" 検索ツールをrgに変更
let g:Lf_DefaultExternalTool="rg"

