return {
  {
    "folke/flash.nvim",
    keys = {
      -- 1. デフォルトの 's' を無効化します (これで s は本来の substitute 機能に戻ります)
      { "s", mode = { "n", "x", "o" }, false },

      -- 2. 新しいキーを設定します (例: S に変更)
      {
        "<C-s>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
}
