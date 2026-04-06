return {
  "kawre/leetcode.nvim",
  build = function()
    require("nvim-treesitter").install({ "html" })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  lazy = "leetcode.nvim" ~= vim.fn.argv(0),
  opts = {
    lang = "python3",
    picker = { provider = "telescope" },
    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
    },
    injector = {},
    hooks = {},
    cookie = "csrftoken=6hiluxdmTMvRFZfnHZkFEK7C5CXQl8eh;LEETCODE_SESSION=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfYXV0aF91c2VyX2lkIjoiNzU4MzEwMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZhNWUxZTc2MjQ3NzljMTdiOTc5MTlmY2JmMTJjYjRhNmU2YzM0Yjc4OGI5MTk4YjAxNTgxNmNmZjE3OGJiNjIiLCJzZXNzaW9uX3V1aWQiOiI3NzE5Yzc5YyIsImlkIjo3NTgzMTAyLCJlbWFpbCI6Imx1Y2FzZGV0b2xlZG80QGdtYWlsLmNvbSIsInVzZXJuYW1lIjoibHVjYXNkZXRvbGVkbzQiLCJ1c2VyX3NsdWciOiJsdWNhc2RldG9sZWRvNCIsImF2YXRhciI6Imh0dHBzOi8vYXNzZXRzLmxlZXRjb2RlLmNvbS91c2Vycy9hdmF0YXJzL2F2YXRhcl8xNjY0NTQ3NDIyLnBuZyIsInJlZnJlc2hlZF9hdCI6MTc3NDI3ODgyMSwiaXAiOiIyODA0OjdmNTpiMDQxOjk0ZWQ6ZWYxYzphMDE3OjczYzc6ODVhNCIsImlkZW50aXR5IjoiZjJkM2ZkMjFmNzhhOGJkYzQzODg4NjBmOWY3Y2QyMTkiLCJkZXZpY2Vfd2l0aF9pcCI6WyI5NGU2MWY1M2RhOTNmMzFiNmJkMTBiNWIwOGQyODZjZCIsIjI4MDQ6N2Y1OmIwNDE6OTRlZDplZjFjOmEwMTc6NzNjNzo4NWE0Il19.XWxdHmYLh58eadbSXqmt5k5mlbKHd5F6OHgMuTphetg",
  },
}
