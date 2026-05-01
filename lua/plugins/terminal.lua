return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<c-/>",
        function()
          Snacks.terminal("C:\\msys64\\usr\\bin\\bash.exe --login", {
            win = {
              position = "bottom",
              height = 0.4,
              border = "rounded",
            },
          })
        end,
        desc = "Toggle Terminal (Bash Bottom)",
        mode = { "n", "t" },
      },
      {
        "<c-_>",
        function()
          Snacks.terminal("C:\\msys64\\usr\\bin\\bash.exe --login", {
            win = {
              position = "bottom",
              height = 0.4,
              border = "rounded",
            },
          })
        end,
        desc = "Toggle Terminal (Bash Bottom)",
        mode = { "n", "t" },
      },
    },
  },
}
