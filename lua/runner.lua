local M = {}

-- モジュール内でターミナル状態を保持（グローバル変数汚染を防ぐ）
local term = nil

local executors = {
  python = "python %",
  javascript = "node %",
  c = "gcc % -o %:r && ./%:r",
  cpp = "g++ -std=c++17 % -o %:r && ./%:r",
  rust = "rustc % -o %:r && ./%:r",
  fortran = "gfortran % -o %:r && ./%:r",
  sh = "bash %",
}

-- 内部関数: ターミナルの取得・作成
local function get_terminal()
  if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) then
    return term
  end

  term = Snacks.terminal(nil, {
    win = {
      position = "bottom",
      height = 0.4,
      border = "rounded",
    },
    interactive = true,
    cwd = vim.fn.getcwd(),
  })
  return term
end

-- 公開関数: 実行処理
function M.run()
  if vim.bo.buftype ~= "" then
    vim.notify("実行するにはコードのファイルを選択してください", vim.log.levels.WARN)
    return
  end

  vim.cmd("w")

  local ft = vim.bo.filetype
  local cmd_template = executors[ft]

  if not cmd_template then
    vim.notify("No executor for " .. ft, vim.log.levels.WARN)
    return
  end

  local dir = vim.fn.expand("%:p:h") -- ディレクトリ (例: C:/Users/Docs)
  local file = vim.fn.expand("%:t") -- ファイル名 (例: test.f90)
  local root = vim.fn.expand("%:t:r") -- 拡張子なし (例: test)

  -- Windowsのバックスラッシュをスラッシュに変換（Bash用）
  dir = dir:gsub("\\", "/")

  -- コマンドを組み立てる
  -- テンプレート内の % をファイル名に置き換え
  local body = cmd_template:gsub("%%:r", root):gsub("%%", file)

  -- 「ディレクトリに移動 && コマンド実行」の形にする
  -- ディレクトリ名にスペースが含まれていても動くように " で囲む
  local cmd = 'cd "' .. dir .. '" && ' .. body
  local t = get_terminal()

  -- 閉じていれば開く
  if not (t.win and vim.api.nvim_win_is_valid(t.win)) then
    t:toggle()
  end

  -- 実行（非同期タイミング調整込み）
  vim.schedule(function()
    local job_id = nil
    if t.job_id then
      job_id = t.job_id
    elseif t.buf then
      local ok, id = pcall(vim.api.nvim_buf_get_var, t.buf, "terminal_job_id")
      if ok then
        job_id = id
      end
    end

    if job_id then
      vim.api.nvim_chan_send(job_id, cmd .. "\n")
      vim.cmd("wincmd p") -- エディタにフォーカスを戻す
    end
  end)
end

-- 公開関数: ターミナルの表示切替
function M.toggle()
  get_terminal():toggle()
end

return M
