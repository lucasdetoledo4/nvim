return {
  -- Auto-close and auto-rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html", "javascript", "javascriptreact",
      "typescript", "typescriptreact", "vue", "svelte"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Color highlighter for CSS/HTML
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss", "html", "javascript", "typescript", "jsx", "tsx" },
    config = function()
      require("colorizer").setup({
        "*", -- Enable for all filetypes
        css = { rgb_fn = true, hsl_fn = true },
        html = { names = true },
      })
    end,
  },

  -- Emmet for fast HTML/CSS code expansion
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
    init = function()
      vim.g.user_emmet_leader_key = "<C-Z>"
      vim.g.user_emmet_settings = {
        javascript = {
          extends = "jsx",
        },
        typescript = {
          extends = "tsx",
        },
      }
    end,
  },

  -- Better support for JSX/TSX commenting
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },
}
