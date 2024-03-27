return {
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            local actions = require("telescope.actions")
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        },
                    },
                },
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
                    ["fzf"] = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    },
                },
            })

            telescope.load_extension("ui-select")
            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep everything" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find in help" })
            vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume previous Find" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find in keymaps" })
            vim.keymap.set("n", "<leader>fF", builtin.git_files, { desc = "Search in git files" })
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
}
