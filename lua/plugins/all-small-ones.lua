return {

    -- don't forget to add this one if you don't have it yet!
    "nvim-lua/plenary.nvim",

    -- undo tree
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Open UndoTree" })
        end,
    },
    -- git client
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
        end,
    },
    -- Vertical indent lines hilight
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    "github/copilot.vim",
    -- fun amiation
    "eandrju/cellular-automaton.nvim",
    "ThePrimeagen/vim-be-good",
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    -- Automatically add closing tags for HTML and JSX
    {
        "windwp/nvim-ts-autotag",
        -- event = "LazyFile",
        opts = {},
    },
}
