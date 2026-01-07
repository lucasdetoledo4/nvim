-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- Note: Auto-format on save is now handled by conform.nvim (lua/plugins/formatting.lua)
-- This autocmd is no longer needed and would cause double-formatting
