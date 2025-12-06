-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.number = true

-- デフォルトのターミナルをmsys2のbashにする
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "C:\\msys64\\usr\\bin\\bash.exe"

  -- シェルに渡すフラグ（bashの場合は -c）
  vim.opt.shellcmdflag = "-c"

  -- クォート設定（Windowsでの挙動を安定させるため空にする）
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end
