return {
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "cool",
        colors = {
          fg = "#dcdfe4",
          -- bg0 = "#202734",
        },
        highlights = {
          -- 検索にヒットしたすべての箇所のハイライト (Tokyonightの青)
          Search = { bg = "#3d59a1", fg = "#c0caf5" },

          -- 現在カーソルがある検索一致箇所のハイライト (Tokyonightのオレンジ)
          CurSearch = { bg = "#ff9e64", fg = "#16161e" },

          -- インクリメンタルサーチ（入力中のハイライト）も現在位置と同じにする
          IncSearch = { bg = "#ff9e64", fg = "#16161e" },

          -- 基本のコメントグループ (従来のSyntax用)
          Comment = { fg = "#8ca6a6", fmt = "none" },

          -- Treesitter用のコメントグループ (C, Lua, Pythonなど用)
          ["@comment"] = { fg = "#8ca6a6", fmt = "none" },

          -- LSP(Semantic Token)用のコメントグループ
          ["@lsp.type.comment"] = { fg = "#8ca6a6", fmt = "none" },

          Visual = { bg = "#344e5c" },
        },
      })
      vim.cmd.colorscheme("onedark")
    end,
  },
}
