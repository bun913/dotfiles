vim.api.nvim_create_user_command('ConvertTask', function()
  -- 現在の行を取得
  local line = vim.api.nvim_get_current_line()

  -- タスクのタイトルを抽出
  local task_title = line:match '%- %[[ x]%] (.+)'
  if not task_title then
    print 'No valid task found on the current line.'
    return
  end

  -- ファイル名をインタラクティブに取得
  local file_name = vim.fn.input 'What is your file name: '
  if file_name == '' then
    print 'File name cannot be empty.'
    return
  end

  -- ディレクトリが存在しない場合は作成
  local dir_path = './tasks/'
  vim.fn.mkdir(dir_path, 'p')

  -- 新しいファイルを作成
  local file_path = dir_path .. file_name .. '.md'
  local file = io.open(file_path, 'w')
  if file then
    file:write('# ' .. task_title .. '\n\n')
    file:write '## Reference\n\n'
    file:write '## Artifact\n\n'
    file:close()
    print('File created: ' .. file_path)
  else
    print('Failed to create file: ' .. file_path)
    return
  end

  -- 現在の行をリンク付きの形式に更新
  local new_line = line:gsub(task_title, '[' .. task_title .. '](' .. file_path .. ')')
  vim.api.nvim_set_current_line(new_line)
end, {})

-- Neovim Lua APIを使用して新しいコマンドを定義
vim.api.nvim_create_user_command('OpenTask', function()
  -- 現在の行を取得
  local line = vim.api.nvim_get_current_line()

  -- リンクのファイルパスを抽出
  local file_path = line:match '%((.-)%)'
  if file_path then
    -- ファイルを開く
    vim.cmd('edit ' .. file_path)
  else
    print 'No valid link found on the current line.'
  end
end, {})

-- Neovim Lua APIを使用して新しいコマンドを定義
vim.api.nvim_create_user_command('ArchiveTask', function()
  -- 現在の行を取得
  local line = vim.api.nvim_get_current_line()
  local current_line_num = vim.api.nvim_win_get_cursor(0)[1]

  -- 今日の日付を取得 (YYYYMMDD形式)
  local date = os.date '%Y%m%d'
  local archive_dir = './archives/' .. date

  -- ディレクトリが存在しない場合は作成
  vim.fn.mkdir(archive_dir, 'p')

  -- リンクのファイルパスを抽出
  local file_path = line:match '%((.-)%)'

  if file_path then
    -- リンク付きタスクの場合
    -- ファイル名を抽出
    local file_name = file_path:match '([^/]+)$'
    if not file_name then
      print 'Failed to extract file name from path.'
      return
    end

    -- 新しいファイルパスを作成
    local new_file_path = archive_dir .. '/' .. file_name

    -- ファイルを移動
    local success = os.rename(file_path, new_file_path)
    if success then
      print('File moved to: ' .. new_file_path)

      -- 現在の行のリンクを新しいパスに更新して完了状態にする
      local new_line = line:gsub('%((.-)%)', '(' .. new_file_path .. ')')
      new_line = new_line:gsub('%- %[ ?%]', '- [x]')

      -- 行を更新（リンク付きタスクの場合は行を残す）
      vim.api.nvim_set_current_line(new_line)
      print 'Task archived and link updated'
    else
      print 'Failed to move file.'
    end
  else
    -- リンクなしタスクの場合（新しい処理）
    -- タスクのテキストを抽出（3つのパターンに対応）
    local task_text = line:match '%- %[x%] (.+)' or line:match '%- %[ %] (.+)' or line:match '%- %[%] (.+)'
    if not task_text then
      print 'No valid task found on the current line.'
      return
    end

    -- misc.mdのパスを作成
    local misc_file_path = archive_dir .. '/misc.md'

    -- misc.mdが存在するかチェック
    local misc_file_exists = vim.fn.filereadable(misc_file_path) == 1

    -- misc.mdを開く（存在しない場合は新規作成）
    local misc_file = io.open(misc_file_path, 'a+')
    if not misc_file then
      print('Failed to open or create file: ' .. misc_file_path)
      return
    end

    -- ファイルが新規作成された場合はヘッダーを追加
    if not misc_file_exists then
      misc_file:write('# ' .. date .. ' misc tasks\n\n')
    end

    -- ファイルの最後にタスクを追加（常に完了状態で追加）
    misc_file:write('- [x] ' .. task_text .. '\n')
    misc_file:close()

    -- 現在のバッファから行を直接削除（完了状態への更新なし）
    vim.api.nvim_buf_set_lines(0, current_line_num - 1, current_line_num, false, {})
    print('Task archived to: ' .. misc_file_path .. ' and removed from original file')
  end
end, {})
