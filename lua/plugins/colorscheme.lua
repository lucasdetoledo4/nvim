return {
    -- Gruvbox Material
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1001,
        config = function()
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_enable_italic = 1
            vim.g.gruvbox_material_better_performance = 1
            vim.g.gruvbox_material_diagnostic_text_highlight = 1
            vim.g.gruvbox_material_diagnostic_line_highlight = 1
            vim.g.gruvbox_material_enable_bold = 1

            vim.cmd.colorscheme("gruvbox-material")

            -- Enhance semantic highlighting for Python
            vim.api.nvim_set_hl(0, "@lsp.type.class.python", { link = "GruvboxYellow" })
            vim.api.nvim_set_hl(0, "@lsp.type.decorator.python", { link = "GruvboxAqua" })
            vim.api.nvim_set_hl(0, "@lsp.type.parameter.python", { link = "GruvboxOrange" })
            vim.api.nvim_set_hl(0, "@lsp.type.variable.python", { link = "GruvboxFg1" })
            vim.api.nvim_set_hl(0, "@lsp.type.property.python", { link = "GruvboxBlue" })
            vim.api.nvim_set_hl(0, "@lsp.type.method.python", { link = "GruvboxGreen" })
            vim.api.nvim_set_hl(0, "@lsp.type.function.python", { link = "GruvboxGreenBold" })
        end,
    },

    -- VSCode Theme
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vscode").setup({
                transparent = true,
                italic_comments = true,
                disable_nvimtree_bg = true,
            })
        end,
    },

    -- Nightfox
    --     {
    --         "EdenEast/nightfox.nvim",
    --         lazy = false,
    --         priority = 1000,
    --         config = function()
    --             require("nightfox").setup({
    --                 options = {
    --                     transparent = true,
    --                     terminal_colors = true,
    --                     styles = {
    --                         comments = "italic",
    --                         keywords = "italic",
    --                         types = "bold",
    --                     },
    --                 },
    --             })
    --         end,
    --     },
    --
    -- Tokyo Night
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night", -- storm, moon, night, day
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
            })
        end,
    },
}
