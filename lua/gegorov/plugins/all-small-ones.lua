return {

    -- don't forget to add this one if you don't have it yet!
    "nvim-lua/plenary.nvim",

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
