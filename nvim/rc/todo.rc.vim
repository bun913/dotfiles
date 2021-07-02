" TODOの設定
command Todo :tabe ~/todo.md
let g:simple_todo_map_keys = 0
imap <C-b> <Plug>(simple-todo-new)

 
function DoneTask()
  " マークダウンのチェックボックスをチェック済みに
  let row = getline(".")
  let replaced = substitute(row, '\[ \]', "\[x\]", "g")
  call setline(".", replaced)
  " 末尾にタイムスタンプを押す
  let nowPos = getpos(".")
  let now = "@". strftime("%Y-%m-%d %H:%M:%S")
  let col = col("$")
  call cursor(".", col)
  execute ":normal a" . now
  " 元のポジションに戻る
  call setpos(".", nowPos)
endfunction

function UndoTask()
  " マークダウンのチェクボックスを戻す
  let row = getline(".")
  let replaced = substitute(row, '\[x\]', '\[ \]', 'g')
  call setline(".", replaced)
  " " 末尾タイムスタンプを削除
  let row = getline(".")
  let deleted = substitute(row, '@.*$', '', 'g')
  call setline(".", deleted)
endfunction

nnoremap <leader>a :call DoneTask()<cr>
nnoremap <leader>u :call UndoTask()<cr>

