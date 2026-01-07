return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      vue = { "prettier" },
      svelte = { "prettier" },
      go = { "goimports", "gofumpt" },
      rust = { "rustfmt" },
      toml = { "taplo" },
    },
    -- Format on save (optional, remove if you don't want this)
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
