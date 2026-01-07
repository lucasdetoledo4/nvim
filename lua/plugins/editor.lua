return {
  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  -- Folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup({
        close_fold_kinds_for_ft = {
          default = {}  -- Don't auto-close any folds
        },
        open_fold_hl_timeout = 0,  -- Disable fold closing after timeout
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      })
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99  -- High value = don't auto-fold
      vim.o.foldlevelstart = 1  -- Start with top level open, rest folded
      vim.o.foldenable = true

      -- Disable automatic fold updating on specific events
      vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged", "TextChangedI"}, {
        pattern = "*",
        callback = function()
          -- Prevent foldlevel from being reset
          vim.opt_local.foldlevel = 99
        end,
      })
    end,
  },

  -- Zen Mode
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
}
