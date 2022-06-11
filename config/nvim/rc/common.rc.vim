" 共通設定
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

" バッファの移動をメタキーで
nnoremap <silent> <M-h> :bprev<CR>
nnoremap <silent> <M-l> :bnext<CR>
nnoremap <silent> <M-w> :bd<CR>

" MarkdownPreviw
command MP MarkdownPreview


"""""""""""""
" バッファを閉じる系のUtil
"""""""""""""
cnoremap <silent>wq w<bar>call CloseBuffer()<CR>
cnoremap <silent>q call CloseBuffer()<CR>
cnoremap <silent>q! call CloseBuffer()<CR>

function! BufferNum() abort
   return  len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function! CloseBuffer() abort
  let l:bufnum = BufferNum()
  if l:bufnum > 1
    :bd!
  else
    :q!
  endif
endfunction

