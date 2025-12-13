return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          -- rust-analyzer の設定
          ["rust-analyzer"] = {
            checkOnSave = {
              -- 保存時に cargo check ではなく clippy を実行する
              command = "clippy",
            },
          },
        },
      },
    },
  },
}
