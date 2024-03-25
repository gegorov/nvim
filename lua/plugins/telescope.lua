return {
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").setup({})

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep everything" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find in help" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find in keymaps" })
            vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search in git files" })
            vim.keymap.set("n", "<leader>s", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end, { desc = "Grep: search phrase in all files" })
            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set("n", "<leader>fn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end, { desc = "[F]ind [N]eovim files" })

            vim.keymap.set("n", "<leader>fw", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end, { desc = "Search for exact WORD under cursor" })

            vim.keymap.set("n", "<leader>fW", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end, { desc = "Search for exact PHRASE under cursor" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- This is your opts table
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    },
                },
            })
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
}
