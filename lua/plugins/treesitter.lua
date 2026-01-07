return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      modules = {},
      ensure_installed = {
        "python", "lua", "vim", "markdown", "c", "cpp",
        "javascript", "typescript", "tsx", "html", "css", "json",
        "go", "gomod", "gowork", "gosum", "rust", "toml"
      },
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}
