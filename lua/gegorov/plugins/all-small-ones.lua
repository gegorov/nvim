return {

    -- don't forget to add this one if you don't have it yet!
    "nvim-lua/plenary.nvim",

    -- Harpoon plugin for file quick navigation
    {
        "ThePrimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file,  { desc = 'Mark file to add to harpoon' } )
            vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = 'Toggle Harpoon quick menu' })

            -- vim.keymap.set("n", "<M-[>", function() ui.nav_prev() end)
            -- vim.keymap.set("n", "<M-]>", function() ui.nav_next() end)
        end,
    },
    -- undo tree
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Open UndoTree' })
        end,
    },
    -- git client
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
        end,
    },
    -- Vertical indent lines hilight
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    "github/copilot.vim",
    -- fun amiation
    'eandrju/cellular-automaton.nvim',
    "ThePrimeagen/vim-be-good",
}
