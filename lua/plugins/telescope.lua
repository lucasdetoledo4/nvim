return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "__pycache__", "%.pyc", "libs/tool%-factory" },
      },
    })

    -- Helper function for search and replace across files
    vim.keymap.set("n", "<leader>sr", function()
      vim.ui.input({ prompt = "Search for: " }, function(search_term)
        if not search_term or search_term == "" then return end

        vim.ui.input({ prompt = "Replace with: " }, function(replace_term)
          if not replace_term then return end

          -- Use Telescope to search and send to quickfix
          require("telescope.builtin").grep_string({
            search = search_term,
            use_regex = false,
            attach_mappings = function(_, map)
              map("i", "<CR>", function(prompt_bufnr)
                require("telescope.actions").send_to_qflist(prompt_bufnr)
                require("telescope.actions").open_qflist(prompt_bufnr)

                -- Perform replacement
                vim.cmd(string.format("cfdo %%s/%s/%s/g | update",
                  vim.fn.escape(search_term, "/\\"),
                  vim.fn.escape(replace_term, "/\\")))

                print(string.format("Replaced '%s' with '%s'", search_term, replace_term))
              end)
              return true
            end,
          })
        end)
      end)
    end, { desc = "Search and replace in files" })
  end,
}
