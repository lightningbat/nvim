local map = vim.keymap.set
local optsx = { norem = true, silent = true }
-- Adjust window size
map('n', '<M-Left>', '<C-w><', { desc = 'Decrease window width' })
map('n', '<M-Right>', '<C-w>>', { desc = 'Increase window width' })
map('n', '<M-Up>', '<C-w>+', { desc = 'Increase window height' })
map('n', '<M-Down>', '<C-w>-', { desc = 'Decrease window height' })

-- Toggle NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Move line up or down (VS Code style)
map("n", "<A-j>", ":m .+1<CR>==<CR>", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==<CR>", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move visual block down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move visual block up" })

---- Disable default yank on delete behavior
map('n', 'd', '"_d', { desc = "Delete without yanking" })
map('v', 'd', '"_d', { desc = "Delete without yanking" })

-- Map > and < for indenting in Visual Mode (gv re-selects last visula selectoin)
map("v", ">", ">gv", { desc = "Indent selected lines" })
map("v", "<", "<gv", { desc = "Un-indent selected lines" })

-- Jump to window using leder + window_index
for i = 1, 9 do
    map("n", vim.g.mapleader .. tostring(i), function()
        vim.cmd(tostring(i) .. "wincmd w")
    end, { desc = "Jump to window " .. i })
end

-- Jump to tab using alt + tab_index
for i = 1, 9 do
  vim.keymap.set('n', '<A-' .. i .. '>', function()
    vim.cmd(i .. 'tabnext')
  end, { noremap = true, silent = true })
end
