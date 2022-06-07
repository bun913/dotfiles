" TODO: ファイラーの設定 + タブではなくWindoでうまいこと開発する方法
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

call s:source_rc('common.rc.vim')
call s:source_rc('dein.rc.vim')

" 共通設定ファイル
 if exists('g:vscode')
     " VSCode extension
 else
     " vim-arilinesの設定ファイル
     call s:source_rc('airline.rc.vim')
     call s:source_rc('defx.rc.vim')
 endif

" qでバッファを閉じる
cnoremap <silent>wq w<bar>call CloseBuffer(0)<CR>
cnoremap <silent>q call CloseBuffer(0)<CR>
cnoremap <silent>q! call CloseBuffer(1)<CR>

function! BufferNum() abort
   return  len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function! CloseBuffer(force) abort
  let l:bufnum = BufferNum()
  if l:bufnum > 1
    if a:force > 0
      :bd!@2022-06-07 11:01:57
    endif
    :bd
  else
    if a:force > 0
      :q!
    endif
    :q
  endif
endfunction

