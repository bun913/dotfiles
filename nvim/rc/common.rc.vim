" 共通設定
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
" 段落の移動
nnoremap <C-j> }
nnoremap <C-k> {
" シンタックスハイライトは重くなったりするので一旦無効化
" syntax disable
" Tab系
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
" vimgrep検索後、自動でQuickfixが起動する
autocmd QuickFixCmdPost *grep* cwindow

" C+sで保存ができるようにする
nnoremap <C-s> :w<CR>

" init.vimを開くショートカット
nnoremap <Leader>. :tabe ~/.config/nvim/init.vim

