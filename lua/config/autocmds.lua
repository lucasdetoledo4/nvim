-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- Note: Auto-format on save is now handled by conform.nvim (lua/plugins/formatting.lua)
-- This autocmd is no longer needed and would cause double-formatting

-- Python-specific settings and keymaps
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  group = vim.api.nvim_create_augroup("python-settings", { clear = true }),
  callback = function()
    -- Indentation
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true

    -- Keymaps
    local opts = { buffer = true, silent = true }
    vim.keymap.set("n", "<leader>rr", ":w<CR>:!python %<CR>", vim.tbl_extend("force", opts, { desc = "Run Python file" }))
    vim.keymap.set("n", "<leader>ru", ":w<CR>:!uv run python %<CR>", vim.tbl_extend("force", opts, { desc = "Run with uv" }))
    vim.keymap.set("n", "<leader>rf", ":!ruff format %<CR>", vim.tbl_extend("force", opts, { desc = "Format with ruff" }))
    vim.keymap.set("n", "<leader>ri", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = { only = { "source.organizeImports" } },
      })
    end, vim.tbl_extend("force", opts, { desc = "Organize imports" }))
  end,
})

-- Rust-specific settings and keymaps
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  group = vim.api.nvim_create_augroup("rust-settings", { clear = true }),
  callback = function()
    local opts = { buffer = true, silent = true }
    -- Cargo commands
    vim.keymap.set("n", "<leader>rr", ":w<CR>:!cargo run<CR>", vim.tbl_extend("force", opts, { desc = "Cargo run" }))
    vim.keymap.set("n", "<leader>rb", ":!cargo build<CR>", vim.tbl_extend("force", opts, { desc = "Cargo build" }))
    vim.keymap.set("n", "<leader>rt", ":!cargo test<CR>", vim.tbl_extend("force", opts, { desc = "Cargo test" }))
    vim.keymap.set("n", "<leader>rc", ":!cargo clippy<CR>", vim.tbl_extend("force", opts, { desc = "Cargo clippy" }))
    vim.keymap.set("n", "<leader>rd", ":!cargo doc --open<CR>", vim.tbl_extend("force", opts, { desc = "Cargo doc" }))
    -- Anchor/Solana commands
    vim.keymap.set("n", "<leader>ab", ":!anchor build<CR>", vim.tbl_extend("force", opts, { desc = "Anchor build" }))
    vim.keymap.set("n", "<leader>at", ":!anchor test<CR>", vim.tbl_extend("force", opts, { desc = "Anchor test" }))
    vim.keymap.set("n", "<leader>ad", ":!anchor deploy<CR>", vim.tbl_extend("force", opts, { desc = "Anchor deploy" }))
  end,
})

-- Close some filetypes with q
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "lspinfo",
    "man",
    "qf",
    "checkhealth",
    "Trouble",
    "trouble",
  },
  group = vim.api.nvim_create_augroup("close-with-q", { clear = true }),
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Enable semantic tokens after LSP attaches (this ensures it works properly)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-semantic-tokens", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.semanticTokensProvider then
      vim.lsp.semantic_tokens.start(args.buf, client.id)
    end
  end,
})
