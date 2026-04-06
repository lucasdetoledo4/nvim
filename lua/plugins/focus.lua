return {
  -- Zen Mode (distraction-free editing)
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 150,
        options = {
          number = true,
          relativenumber = true,
          signcolumn = "yes",
          cursorline = false,
        },
      },
    },
    keys = { { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- Twilight (dims inactive code)
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    opts = {},
    keys = { { "<leader>zt", "<cmd>Twilight<cr>", desc = "Toggle Twilight" } },
  },
}
