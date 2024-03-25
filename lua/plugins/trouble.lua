return {

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function()
            require("trouble").setup({})
            vim.keymap.set("n", "<leader>xx", function()
                require("trouble").toggle()
            end, { desc = "Toggle Trouble" })
            vim.keymap.set("n", "<leader>xw", function()
                require("trouble").toggle("workspace_diagnostics")
            end, { desc = "Workspace diagnostics" })
            vim.keymap.set("n", "<leader>xd", function()
                require("trouble").toggle("document_diagnostics")
            end, { desc = "Document diagnostic" })
            vim.keymap.set("n", "<leader>xq", function()
                require("trouble").toggle("quickfix")
            end, { desc = "Quickfix" })
            vim.keymap.set("n", "<leader>xl", function()
                require("trouble").toggle("loclist")
            end, { desc = "Loclist" })
            vim.keymap.set("n", "<leader>xn", function()
                require("trouble").next({ skip_groups = true, jump = true })
            end, { desc = "Jump NEXT" })
            vim.keymap.set("n", "<leader>xp", function()
                require("trouble").previous({ skip_groups = true, jump = true })
            end, { desc = "Jump PREVIOUS" })
            vim.keymap.set("n", "gR", function()
                require("trouble").toggle("lsp_references")
            end, { desc = "LSP references" })
        end,
    },
}
