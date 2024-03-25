-- for some reasons it should be before requiring lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    ui = { border = "rounded" },
})

--
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "Open file tree view :Ex" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

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

-- statusline with Fugitive git statuses
-- set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "80"

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
--
-- --Enable spell check
-- -- vim.opt.spelllang = 'en_us'
-- -- vim.opt.spell = true
--
-- -- Sets how neovim will display certain whitespace in the editor.
-- --  See `:help 'list'`
-- --  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = {
--     tab = '» ',
--     nbsp = '␣',
--     trail = '·',
-- }
--
-- -- set tmux colors
-- if vim.fn.has("termguicolors") == 1 then
--   vim.opt.termguicolors = true
-- end
--
