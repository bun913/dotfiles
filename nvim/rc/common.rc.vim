" 共通設定
" jjでescと同じ効果を
inoremap <silent> jj <ESC>
set number
set smartindent
set clipboard=unnamed
set tabstop=2
set cursorline
set expandtab
set shiftwidth=2
" インデントはスマートインデント
set smartindent
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 行頭・行末の移動
nnoremap H ^
nnoremap L $
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" syntax disable
set synmaxcol=300
" 不可視文字を可視化(タブが「▸-」と表示される)
set list
set listchars=tab:»-
" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" LeaderKeyをスペースに設定
let mapleader = "\<Space>"
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" undoの永続
set undofile
" init.vimを開くショートカット
nnoremap <Leader>. :tabe ~/.config/nvim/rc/common.rc.vim
" gitの差分を表示
let g:gitgutter_highlight_lines = 1
nnoremap sm :DoShowMarks<CR>
" 置換のカーソル位置を調整
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
" 置換コマンドをrgにして.gitignoreも無視
if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif
" nnoremap <C-g> :%s###g<Left><Left>
" タブを移動させる
nnoremap <Tab>l :+tabmove<CR>
nnoremap <Tab>h :-tabmove<CR>
" ファイルタイプごとのタブ設定など

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal et tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal et tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal et tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.ts setlocal et tabstop=2 softtabstop=2 shiftwidth=2
    " 現行プロジェクトのPHPの設定に準拠
    autocmd BufNewFile,BufRead *.php setlocal noet tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.go  setlocal noet tabstop=4 softtabstop=4 shiftwidth=4
    " terraformの場合 coc#refreshを呼ぶ
    autocmd BufNewFile,BufRead *.tf :call coc#refresh()
augroup END

" タブを移動させる
nnoremap <Leader><Leader>1 1gt
nnoremap <Leader><Leader>2 2gt
nnoremap <Leader><Leader>3 3gt
nnoremap <Leader><Leader>4 4gt
nnoremap <Leader><Leader>5 5gt
nnoremap <Leader><Leader>6 6gt
nnoremap <Leader><Leader>7 7gt
nnoremap <Leader><Leader>8 8gt
nnoremap <Leader><Leader>9 9gt
