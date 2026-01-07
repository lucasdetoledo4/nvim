return {
    -- Gruvbox Material
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1001,
        config = function()
            vim.g.gruvbox_material_background = "medium"   -- 'soft', 'medium', 'hard'
            vim.g.gruvbox_material_foreground = "material" -- 'mix', 'original', 'material'
            vim.g.gruvbox_material_enable_italic = 1       -- enable italics
            vim.g.gruvbox_material_better_performance = 1  -- improves performance

            -- Set as default colorscheme
            vim.cmd.colorscheme("gruvbox-material")
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
