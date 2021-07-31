" 共通設定
" jjでescと同じ効果を
inoremap <silent> jj <ESC>
set number
set smartindent
set clipboard=unnamed
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
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
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
nnoremap <Leader>. :tabe ~/.config/nvim/init.vim
" gitの差分を表示
let g:gitgutter_highlight_lines = 1
nnoremap sm :DoShowMarks<CR>
" 置換のカーソル位置を調整
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
