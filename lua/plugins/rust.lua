return {
  -- Crates.nvim: Manage Cargo.toml dependencies
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        cmp = { enabled = true },
      },
    },
  },

  -- Rustaceanvim: Enhanced Rust tooling (successor to rust-tools.nvim)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = { replace_builtin_hover = false },
        },
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              check = { command = "clippy" },
              cargo = { allFeatures = true },
              procMacro = { enable = true },
              -- Useful for Anchor/Solana macro-heavy code
              diagnostics = {
                disabled = { "unresolved-proc-macro" },
              },
            },
          },
        },
      }
    end,
  },
}
