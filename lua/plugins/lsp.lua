return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
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

        -- ty handles hover/type checking; ruff and basedpyright should not compete
        if client.name == "ruff" or client.name == "basedpyright" then
          client.server_capabilities.hoverProvider = false
        end

        -- basedpyright is only used for semantic tokens; suppress all its diagnostics
        if client.name == "basedpyright" then
          local ns = vim.lsp.diagnostic.get_namespace(client.id)
          vim.diagnostic.enable(false, { bufnr = bufnr, ns_id = ns })
        end
      end,
    })

    -- ty: Astral's Python type checker (not in Mason, install via: uv tool install ty)
    vim.lsp.config("ty", {
      capabilities = capabilities,
      settings = {
        ty = {},
      },
    })
    vim.lsp.enable("ty")

    require("mason-lspconfig").setup({
      -- Note: rust_analyzer is handled by rustaceanvim plugin
      ensure_installed = { "ruff", "lua_ls", "clangd", "ts_ls", "basedpyright" },
      automatic_installation = true,
      handlers = {
        -- Default handler
        function(server_name)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,

        -- basedpyright: diagnostics disabled, only used for semantic token colors
        -- ty handles all type checking; basedpyright provides richer highlights
        -- until ty gains semantic token support
        ["basedpyright"] = function()
          require("lspconfig").basedpyright.setup({
            capabilities = capabilities,
            settings = {
              basedpyright = {
                disableOrganizeImports = true,
                analysis = {
                  diagnosticMode = "off",
                  typeCheckingMode = "off",
                },
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
      },
    })
  end,
}
