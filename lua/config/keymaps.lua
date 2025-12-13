-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- 挿入モードでのカーソル移動
map("i", "<C-h>", "<Left>", { desc = "Cursor Left" })
map("i", "<C-j>", "<Down>", { desc = "Cursor Down" })
map("i", "<C-k>", "<Up>", { desc = "Cursor Up" })
map("i", "<C-l>", "<Right>", { desc = "Cursor Right" })

-- コマンドラインモードでのカーソル移動
map("c", "<C-h>", "<Left>", { desc = "Cursor Left" })
map("c", "<C-j>", "<Down>", { desc = "Cursor Down" })
map("c", "<C-k>", "<Up>", { desc = "Cursor Up" })
map("c", "<C-l>", "<Right>", { desc = "Cursor Right" })

-- ノーマルモード
map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "Y", "Vy", { desc = "yank line" })
map("n", "ya", "goVGy<C-o>", { desc = "yank all lines" })
map("n", "S", "Vc", { desc = "vim keybind" })

-- ノーマル・ビジュアルモード: 5行移動
map({ "n", "v" }, "J", "5j", { desc = "Move Down 5 Lines" })
map({ "n", "v" }, "K", "5k", { desc = "Move Up 5 Lines" })
map("n", "H", "H", { desc = "Move top" })
map("n", "L", "L", { desc = "Move bottm" })

-- 挿入モード: <C-c>でEsc
map("i", "<C-c>", "<Esc>", { desc = "Exit Insert Mode" })
map("v", "<C-c>", "<Esc>", { desc = "Exit Visual Mode" })

-- ノーマルモード: ヤンクレジスタ(0)からペースト
map("n", "yp", '"0p', { desc = "Paste from Yank Register (After)" })
map("n", "yP", '"0P', { desc = "Paste from Yank Register (Before)" })

-- 挿入モード: 便利な移動・挿入
map("i", "<C-o>", "<Esc>o", { desc = "New Line Below" })
map("i", "<C-e>", "<Esc>A", { desc = "Go to End of Line (Insert)" })
map("i", "<C-a>", "<Esc>I", { desc = "Go to Start of Line (Insert)" })

-- コマンドラインモード: ヤンクレジスタ(0)からペースト
map("c", "<C-y>", "<C-r>0", { desc = "Paste from Yank Register" })
map("c", "Q", "q!", { desc = "forced quit " })

-- ビジュアルモード: 選択範囲を()で囲む
map("v", "(", "c()<Left><Esc>p", { desc = "Surround selection with ()" })
map("v", "'", "c''<Left><Esc>p", { desc = "Surround selection with ()" })
map("v", '"', 'c""<Left><Esc>p', { desc = "Surround selection with ()" })
-- map("v", "<", "c<><Left><Esc>p", { desc = "Surround selection with ()" })

-- タブ操作
map("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })

-- 行末に;追加
map("n", "<A-;>", "<Esc>A;<Esc>", { desc = "Insert a semicolon at the end of the line" })
map("i", "<A-;>", "<Esc>A;", { desc = "Insert a semicolon at the end of the line" })

-- 作成した runner.lua モジュールを読み込む
local runner = require("runner")

-- <Space>r : コード実行
map("n", "<leader>r", function()
  runner.run()
end, { desc = "Code Runner" })

--  ターミナルを開閉
map({ "n", "t" }, "<C-/>", function()
  local term = get_terminal()
  term:toggle()
end, { desc = "Toggle Terminal" })
