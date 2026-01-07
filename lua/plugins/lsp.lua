return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Mason setup
    require("mason").setup()

    -- Capabilities for autocompletion
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup keymaps on LSP attach using autocmd (Neovim 0.11+ recommended approach)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        local opts = { buffer = bufnr, silent = true }

        -- LSP navigation with Telescope
        vim.keymap.set("n", "gd", function()
          require("telescope.builtin").lsp_definitions()
        end, opts)

        vim.keymap.set("n", "gr", function()
          require("telescope.builtin").lsp_references()
        end, opts)

        -- Other LSP functions
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        -- Special: disable Ruff hover (Pyright does it better)
        if client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end
      end,
    })

    -- Helper function to find Python venv path
    local function find_python_path()
      -- Search upward from current directory for .venv
      local venv_python = vim.fn.findfile(".venv/bin/python", ".;")
      if venv_python ~= "" then
        return vim.fn.fnamemodify(venv_python, ":p")
      end
      -- Fallback: let Pyright auto-detect
      return nil
    end

    -- Helper function to find venv directory
    local function find_venv_path()
      local venv_dir = vim.fn.finddir(".venv", ".;")
      if venv_dir ~= "" then
        return vim.fn.fnamemodify(venv_dir, ":p:h")
      end
      return nil
    end

    -- Setup mason-lspconfig with handlers
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright", "ruff", "lua_ls", "clangd", "ts_ls", "eslint", "gopls", "rust_analyzer" },
      automatic_installation = true,
      handlers = {
        -- Default handler for all servers
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- Custom handler for pyright
        ["pyright"] = function()
          require("lspconfig").pyright.setup({
            capabilities = capabilities,
            settings = {
              python = {
                pythonPath = find_python_path(),
                venvPath = find_venv_path(),
                venv = ".venv",
                analysis = {
                  typeCheckingMode = "basic",
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                  importFormat = "absolute",
                  stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
                  diagnosticSeverityOverrides = {
                    reportCallIssue = "none",
                    reportAssignmentType = "none",
                    reportArgumentType = "none",
                    reportUndefinedVariable = "warning",
                    reportMissingImports = "warning",
                  },
                  indexing = true,
                  logLevel = "Information",
                },
              },
            },
          })
        end,

        -- Custom handler for ruff
        ["ruff"] = function()
          require("lspconfig").ruff.setup({
            capabilities = capabilities,
          })
        end,

        -- Custom handler for lua_ls
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

        -- Custom handler for ts_ls
        ["ts_ls"] = function()
          require("lspconfig").ts_ls.setup({
            capabilities = capabilities,
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          })
        end,

        -- Custom handler for gopls
        ["gopls"] = function()
          require("lspconfig").gopls.setup({
            capabilities = capabilities,
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                  shadow = true,
                },
                staticcheck = true,
                gofumpt = true,
              },
            },
          })
        end,

        -- Custom handler for rust_analyzer
        ["rust_analyzer"] = function()
          require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                check = {
                  command = "clippy",
                },
                cargo = {
                  allFeatures = true,
                },
                procMacro = {
                  enable = true,
                },
              },
            },
          })
        end,
      },
    })
  end,
}
