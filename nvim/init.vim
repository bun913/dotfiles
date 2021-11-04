if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" vimとnvimの設定分け
if has('nvim')
    let g:vim_home = expand('~/.config/nvim')
    let g:rc_dir = expand('~/.config/nvim/rc')
else
    let g:vim_home = expand('~/.vim')
    let g:rc_dir = expand('~/.vim/rc')
endif

" rcファイル読み込み関数
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

" 共通設定ファイル
if exists('g:vscode')
    " VSCode extension
    call s:source_rc('common.rc.vim')
    " deinの設定ファイル
    call s:source_rc('dein.rc.vim')
    " leaderfの設定ファイル
    call dein#add('asvetliakov/vim-easymotion')
else
    " ordinary neovim
    call s:source_rc('common.rc.vim')
    " deinの設定ファイル
    call s:source_rc('dein.rc.vim')
    " defxの設定ファイル
    call s:source_rc('defx.rc.vim')
    " vim-arilinesの設定ファイル
    call s:source_rc('airline.rc.vim')
    " vim-cheatsheetの設定ファイル
    call s:source_rc('cheatsheet.rc.vim')
    " coc.nvimの設定ファイル
    call s:source_rc('coc.rc.vim')
    " far.vimの設定ファイル
    call s:source_rc('far.rc.vim')
    " leaderfの設定ファイル
    call s:source_rc('leaderf.rc.vim')
endif


" MarkdownPreviw
command MP MarkdownPreview "MPでプレビューを開く

