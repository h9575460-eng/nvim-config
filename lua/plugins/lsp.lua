return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- ['*'] は「すべての言語サーバー」を意味する特殊な指定です
        ["*"] = {
          keys = {
            -- ここで明示的に K を 5k に設定します。
            -- これにより、LSPが起動しているバッファでも確実に 5k が優先されます。
            { "K", "5k", desc = "Up 5 lines" },
            { "<C-k>", false, mode = "i" },

            -- ドキュメント表示は gh に逃がします
            -- { "gh", vim.lsp.buf.hover, desc = "Hover" },
          },
        },
      },
    },

    init = function()
      -- LSPが起動した(Attachした)タイミングで実行
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf

          -- 'gh' をドキュメント表示(Hover)に設定
          vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = buffer, desc = "Hover" })
        end,
      })
    end,
  },
}
