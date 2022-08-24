"""""""""""""
" 基本的な設定・キーバーインドなど
"""""""""""""
set number
set smartindent
set clipboard=unnamed
set tabstop=2
set cursorline
set expandtab
set shiftwidth=2
set smartindent
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
set synmaxcol=300
" 不可視文字を可視化(タブが「▸-」と表示される)
set list
set listchars=tab:»-
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
nnoremap sm :DoShowMarks<CR>
" 置換のカーソル位置を調整
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
" 置換コマンドをrgにして.gitignoreも無視
if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif

" VSCodeと同様の動きをするためにバッファの移動をメタキーで
nnoremap <silent> <M-h> :bprev<CR>
nnoremap <silent> <M-l> :bnext<CR>
nnoremap <silent> <M-w> :bd<CR>
" vim独自の動きでバッファを移動
nnoremap <nowait> <Leader>l :bnext<CR>
nnoremap <nowait> <Leader>h :bprev<CR>
" MarkdownPreviw
command MP MarkdownPreview
" jjでインサートモードを抜ける
inoremap <silent> jj <ESC>

"""""""""""""
" バッファで開いているファイルのディレクトリをクリップボードに送る
"""""""""""""
" 共通設定ファイル
if exists('g:vscode')
  nnoremap <silent><Leader>yy :call v:lua.GetDirPath()<CR>
" /Users/imaizumi.taiki/workspace/blog/articles/cdk/__vscode_neovim__-file:///Users/imaizumi.taiki/workspace/blog/articles/cdk/workshop/lambda
else
  nnoremap <silent><Leader>yy :let @* = expand('%:p:h')<CR>
endif


lua << EOF
function GetDirPath()
  local all_path = vim.fn.expand("%:p:h")
  local dir_path = vim.fn.split(all_path, '-file://')
  local cmd_str = "let @* = "..'"'..dir_path[2]..'"'
  vim.cmd(cmd_str)
end
EOF
