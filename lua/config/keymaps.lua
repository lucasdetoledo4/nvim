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
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
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

-- Oil file manager
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open file explorer" })
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

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
    elseif current == "vscode" then
        vim.cmd.colorscheme("tokyonight-night")
    else
        vim.cmd.colorscheme("gruvbox-material")
    end
end, { desc = "Toggle colorscheme" })
