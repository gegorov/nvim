return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        branch = "v3.x",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
            })

            vim.keymap.set(
                "n",
                "<leader>ft",
                ":Neotree filesystem reveal<CR>",
                { desc = "[F]ile [T]ree", silent = true }
            )
        end,
    },
}
