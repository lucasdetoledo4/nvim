-- Disable annoying modes
vim.keymap.set("n", "Q", "<Nop>", { desc = "Disable Ex mode" })
vim.keymap.set("n", "<C-s>", "<Nop>", { desc = "Disable terminal freeze" })
vim.keymap.set("i", "<C-s>", "<Nop>", { desc = "Disable terminal freeze" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- File operations
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file", silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search" })

-- Buffer/Tab navigation
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bb", "<C-^>", { desc = "Toggle last buffer" })
vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { desc = "Go to tab 1" })
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { desc = "Go to tab 2" })
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { desc = "Go to tab 3" })
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { desc = "Go to tab 4" })
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { desc = "Go to tab 5" })


-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.jump, { desc = "Next/Prev diagnostic" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- Delete/Keep lines matching pattern
vim.keymap.set('n', '<leader>dd', function()
    local pattern = vim.fn.input('Delete lines matching: ')
    if pattern ~= '' then
        vim.cmd('g/' .. vim.fn.escape(pattern, '/') .. '/d')
        print('✓ Deleted lines matching: ' .. pattern)
    end
end, { desc = 'Delete lines matching pattern' })

vim.keymap.set('n', '<leader>dk', function()
    local pattern = vim.fn.input('Keep only lines matching: ')
    if pattern ~= '' then
        vim.cmd('v/' .. vim.fn.escape(pattern, '/') .. '/d')
        print('✓ Kept lines matching: ' .. pattern)
    end
end, { desc = 'Keep lines matching pattern' })

-- Colorscheme toggle
vim.keymap.set("n", "<leader>kt", function()
    local current = vim.g.colors_name
    if current == "gruvbox-material" then
        vim.cmd.colorscheme("vscode")
    else
        vim.cmd.colorscheme("gruvbox-material")
    end
end, { desc = "Toggle colorscheme" })

-- Run Python file raw
vim.keymap.set("n", "<leader>rr", function()
  local file = vim.fn.expand("%:p")
  if not file:match("%.py$") then
    print("Not a Python file")
    return
  end
  vim.cmd("!python " .. file)
end, { desc = "Run Python file" })

-- Run Python file with uv as module (handles imports correctly)
vim.keymap.set("n", "<leader>ru", function()
  local file = vim.fn.expand("%:p")
  if not file:match("%.py$") then
    print("Not a Python file")
    return
  end
  local root = vim.fs.root(0, { "pyproject.toml", ".venv", ".env", "setup.py", ".git" })
  if not root then
    vim.cmd("!uv run python " .. file)
    return
  end
  local rel_path = file:sub(#root + 2)
  local module = rel_path:gsub("%.py$", ""):gsub("/", ".")
  vim.cmd("!cd " .. root .. " && uv run python -m " .. module)
end, { desc = "Run Python with uv" })

-- Folding keymaps (lazy-loaded)
vim.keymap.set("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
vim.keymap.set("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })
vim.keymap.set("n", "zr", function() require("ufo").openFoldsExceptKinds() end, { desc = "Fold less" })
vim.keymap.set("n", "zm", function() require("ufo").closeFoldsWith() end, { desc = "Fold more" })
vim.keymap.set("n", "zp", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Peek fold" })

