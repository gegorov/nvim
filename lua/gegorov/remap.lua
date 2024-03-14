vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = 'Open file tree view :Ex' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- some fun
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Some fun" })

-- moving line around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line DOWN" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line UP" })


-- others

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line below cursor with current" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go one page UP" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go one page DOWN" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Go to NEXT search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to PREVIOUS search result" })
