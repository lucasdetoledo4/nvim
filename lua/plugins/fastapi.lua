-- fastapi-nvim: Neovim port of the FastAPI VSCode extension
-- Features:
--   :FastAPIRoutes  / <leader>fa  — browse all routes via Telescope
--   :FastAPIRefresh / <leader>fA  — refresh the route cache
--   Virtual text: shows METHOD + path at the end of each @decorator line

return {
  {
    "lucasdetoledo4/fastapi-nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- Declare keys here so lazy registers them immediately (not just on ft=python)
    -- and loads the plugin on first use
    keys = {
      { "<leader>fa", function() require("fastapi-nvim").routes() end,  desc = "FastAPI: browse routes" },
      { "<leader>fA", function() require("fastapi-nvim").refresh() end, desc = "FastAPI: refresh routes" },
    },
    -- Still activate virtual text when a Python file opens
    ft = "python",
    config = function()
      require("fastapi-nvim").setup({
        virtual_text = true,
        -- keymaps handled by lazy `keys` above, disable internal registration
        keymaps = {
          routes  = false,
          refresh = false,
        },
      })
    end,
  },
}
