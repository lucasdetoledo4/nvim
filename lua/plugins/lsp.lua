return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- LSP keymaps on attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end, opts)
        vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        -- Ruff handles linting, basedpyright handles hover
        if client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end
      end,
    })

    -- Find Python venv
    local function get_python_path()
      local venv = vim.fn.findfile(".venv/bin/python", ".;")
      if venv ~= "" then return vim.fn.fnamemodify(venv, ":p") end
      return nil
    end

    require("mason-lspconfig").setup({
      ensure_installed = { "basedpyright", "ruff", "lua_ls", "clangd", "rust_analyzer" },
      automatic_installation = true,
      handlers = {
        -- Default handler
        function(server_name)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,

        -- basedpyright: Python type checking + semantic highlighting
        ["basedpyright"] = function()
          require("lspconfig").basedpyright.setup({
            capabilities = capabilities,
            settings = {
              basedpyright = {
                analysis = {
                  typeCheckingMode = "basic",
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                  diagnosticMode = "openFilesOnly",
                },
              },
              python = {
                pythonPath = get_python_path(),
              },
            },
          })
        end,

        -- Ruff: Fast linting and formatting
        ["ruff"] = function()
          require("lspconfig").ruff.setup({ capabilities = capabilities })
        end,

        -- Lua
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          })
        end,

        -- Rust
        ["rust_analyzer"] = function()
          require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                check = { command = "clippy" },
                cargo = { allFeatures = true },
                procMacro = { enable = true },
              },
            },
          })
        end,
      },
    })
  end,
}
