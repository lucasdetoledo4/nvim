return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                    ]],
      [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
      [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
      [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
      [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
      [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
      [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
      [[                                                    ]],
      [[              github.com/lucasdetoledo4             ]],
      [[                                                    ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", "  New File", "<cmd>ene<CR>"),
      dashboard.button("e", "  Explorer", "<cmd>Oil<CR>"),
      dashboard.button("f", "  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("g", "  Find Text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("v", "  Select Venv", "<cmd>VenvSelect<CR>"),
      dashboard.button("c", "  Config", "<cmd>e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("l", "  Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return "  " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
    end

    dashboard.section.footer.val = footer()

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Custom highlights
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#a6e3a1" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#6c7086", italic = true })
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#f9e2af" })

    alpha.setup(dashboard.config)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt_local.foldenable = false
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.cursorline = false
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
