return {
  -- 1. Masonの起動時チェックを無効化
  "mason-org/mason.nvim",
  opts = {
    ui = {
      check_outdated_packages_on_open = false, -- 起動時の更新チェックを無効化
      border = "none",
    },
  },
  -- 2. Lazy.nvim自体の更新チェックを無効化
  -- (プラグインの更新があるか起動時に見に行くのを止める)
  {
    "folke/lazy.nvim",
    version = false, -- 常に最新を使う
    opts = {
      checker = { enabled = false }, -- 自動更新チェックを無効化
      change_detection = { enabled = false }, -- 設定ファイルの変更検知を無効化（Windowsでは重い原因になりうる）
    },
  },
}
